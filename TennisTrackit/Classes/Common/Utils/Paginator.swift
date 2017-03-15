//
//  RealmPaginator.swift
//  App
//
//  Copyright © 2017 All rights reserved.
//

import Foundation
import RealmSwift

public protocol PageableDataManager {
    
    func refreshItems<T>(items: [T]) -> [T]
    func itemsInRange<T>(range: NSRange, predicate: NSPredicate?, sortDescriptors: [SortDescriptor]?) -> [T]
}

public enum PaginatorError : Error {
    
    case DataManagerError(String)
}

public class Paginator<T> {
    
    public var dataManager: PageableDataManager?
    
    public var userInfo: [String: Any]?
    public var hasNextPage = true
    public var predicate: NSPredicate?
    public var sortDescriptors: [SortDescriptor]?
    public var nextPage: Int {
        get {
            return currentPage + 1
        }
    }
    public private(set) var currentPage = 0
    public let perPage = 20
    public var loadedItems: [T] {
        get {
            return loadedItemsByPage.values.flatMap { $0 }
        }
    }
    private var loadedItemsByPage = Dictionary<Int, [T]>()
    
    // MARK: - Paginator
    
    public init() { }
    
    internal func rangeWithPage(page: Int) -> NSRange {
        
        return NSMakeRange(page * perPage, perPage)
    }
    
    internal func handleItemsLoadedForPage(page: Int, items: [T]) {
        
        loadedItemsByPage[page] = items
        
        // check if we've loaded all items
        if 0 == page || page > currentPage {
            if perPage > items.count {
                hasNextPage = false
            }
        }
        
        // ignore loading past pages
        if page > currentPage {
            // update current page reference
            currentPage += 1
        }
    }
    
    private func dataManagerItemsWithRange(range: NSRange) -> [T] {
        
        if let dataManager = self.dataManager {
            return dataManager.itemsInRange(range: range,
                predicate: predicate, sortDescriptors: sortDescriptors)
        }
        
        return []
    }
    
    public func refreshLoadedItems() {
        
        let staleItemsByPage = loadedItemsByPage
        
        loadedItemsByPage = Dictionary<Int, [T]>()
        
        if let dataManager = self.dataManager {
            for (page, staleItems) in staleItemsByPage {
                loadedItemsByPage[page] = dataManager.refreshItems(items: staleItems)
            }
        }
    }
    
    public func cancelPendingPageLoad() {
        
        // not currently needed (pages load synchronously)
    }
    
    public func resetCurrentPage() {
        
        // clear loded items
        loadedItemsByPage = Dictionary<Int, [T]>()
        
        // clear state
        hasNextPage = true
        currentPage = 0
    }
    
    public func preloadCachedItemsForPage(page: Int, completion: (_ items: [T]) -> Void) {
        
        let range = rangeWithPage(page: page)
        let items = dataManagerItemsWithRange(range: range)
        
        // updates loaded items but doesn't increment current page pointer
        loadedItemsByPage[page] = items
        
        completion(items)
    }
    
    public func loadItemsForPages(pages: [Int], success: (_ items: [T]) -> Void,
        failure: (_ error: Error?) -> Void) {
            
            assertionFailure("not yet implemented for non-network paginator")
    }
    
    public func loadItemsForPage(page: Int, success: (_ items: [T], _ fellBackToCache: Bool) -> Void,
        failure: (_ error: Error?) -> Void) {
            
            if nil != dataManager {
                let range = rangeWithPage(page: page)
                let items = dataManagerItemsWithRange(range: range)
                
                handleItemsLoadedForPage(page: page, items: items)
                success(items, false)
            } else {
                failure(PaginatorError.DataManagerError("no data manager set"))
            }
    }
}
