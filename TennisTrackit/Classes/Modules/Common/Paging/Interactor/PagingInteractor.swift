//
//  PagingInteractor.swift
//  App
//
//  Copyright © 2017 All rights reserved.
//

import Foundation

class PagingInteractor<T>: PagingInteractorInput {
    
    var paginator: Paginator<T>? {
        didSet {
            setupPaginator()
        }
    }
    
    var currentPage: Int {
        get {
            return paginator!.currentPage
        }
    }
    var nextPage: Int {
        get {
            return paginator!.nextPage
        }
    }
    var hasNextPage: Bool {
        get {
            return paginator!.hasNextPage
        }
    }
    var isEmpty: Bool {
        get {
            return 0 == paginator!.loadedItems.count
        }
    }
    
    // MARK: - PagingInteractorInput
    
    func resetCurrentPage() {
        
        paginator?.resetCurrentPage()
    }
    
    func cancelIfLoadingPage() {
        
        paginator?.cancelPendingPageLoad()
    }
    
    func preloadCachedFirstPageItems() {
        
        paginator?.preloadCachedItemsForPage(page: 0, completion: { (items) -> Void in
            self.handleItemsLoadedForPages(pages: [0], items: items, fellBackToCache: false)
        })
    }
    
    func reloadAllLoadedItems() {
        
        var pages: [Int] = []
        
        for page in 0...paginator!.currentPage {
            pages.append(page)
        }
        
        paginator?.loadItemsForPages(pages: pages, success: { (items) -> Void in
            self.handleItemsLoadedForPages(pages: pages, items: items, fellBackToCache: false)
            }, failure: { (error) -> Void in
                self.handleFailedToLoadItemsForPages(pages: pages, withError: error)
        })
    }
    
    func loadItemsForPage(page: Int) {
        
        paginator?.loadItemsForPage(page: page, success: { (items, fellBackToCache) -> Void in
            self.handleItemsLoadedForPages(pages: [page], items: items, fellBackToCache: fellBackToCache)
            }, failure: { (error) -> Void in
                self.handleFailedToLoadItemsForPages(pages: [page], withError: error)
        })
    }
    
    // MARK: - PagingInteractor
    
    func setupPaginator() {
        
    }
    
    func handleFailedToLoadItemsForPages(pages: [Int], withError error: Error?) {
        
    }
    
    func handleItemsLoadedForPages(pages: [Int], items: [T], fellBackToCache: Bool) {
        
    }
}
