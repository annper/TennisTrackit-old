//
//  PagingInterfaces.swift
//  App
//
//  Copyright © 2017 All rights reserved.
//

import Foundation

/** view **/

protocol PagingViewInput: SectionItemViewInput {
    
    var pulledToRefresh: (() -> Void)? { get set }
    var approachingEndOfContent: (() -> Void)? { get set }
    
    func showLoading(loading: Bool, forEmpty empty: Bool)
    func endRefreshing()
    func showWarningForStaleDataOnPage(page: Int)
    func showErrorForFailedToLoadPage(page: Int)
}

/** interactor **/

protocol PagingInteractorInput {
    
    var currentPage: Int { get }
    var nextPage: Int { get }
    var hasNextPage: Bool { get }
    var isEmpty: Bool { get }
    
    func cancelIfLoadingPage()
    func resetCurrentPage()
    func preloadCachedFirstPageItems()
    func loadItemsForPage(page: Int)
}
