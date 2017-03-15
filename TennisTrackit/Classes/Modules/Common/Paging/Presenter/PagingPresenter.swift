//
//  PagingPresenter.swift
//  App
//
//  Copyright © 2017 All rights reserved.
//

import Foundation

class PagingPresenter<T: SectionItem>: SectionItemPresenter<T> {
    
    // MARK: - PagingPresenter
    
    func loadPage(page: Int, interactor: PagingInteractorInput, userInterface: PagingViewInput) {
        
        let empty = interactor.isEmpty
        
        // show loading if empty first page or not on first page (lazy loading)
        if 0 != page || empty {
            userInterface.showLoading(loading: true, forEmpty: empty)
        }
        
        if 0 == page {
            interactor.resetCurrentPage()
            interactor.preloadCachedFirstPageItems()
        }
        
        interactor.cancelIfLoadingPage()
        interactor.loadItemsForPage(page: page)
    }
}
