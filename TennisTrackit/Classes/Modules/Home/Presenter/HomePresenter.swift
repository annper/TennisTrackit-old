//
//  HomePresenter.swift
//  Generated using vipergen
//
//  Created by Annie on 27/01/2017.
//  Copyright © 2017. All rights reserved.
//

import UIKit

class HomePresenter: SectionItemPresenter<HomeListDisplayItem>, HomeViewOutput, HomeInteractorOutput {
    
    var wireframe: HomeWireframe
    var interactor: HomeInteractorInput
    weak var userInterface: HomeViewInput!
	
    // MARK: - HomePresenter
    
    init(wireframe: HomeWireframe, interactor: HomeInteractorInput, userInterface: HomeViewInput) {
        self.wireframe = wireframe
        self.interactor = interactor
        self.userInterface = userInterface
    }
    
    // MARK: - HomeViewOutput
    
    func viewWillAppear(animated: Bool) {
        updateSectionItemUserInterface(userInterface: userInterface, reloadData: false)
    }
    
    // MARK: - SectionItemPresenter
    
    override func displayDataItems() -> [HomeListDisplayItem]? {
        let dataItems = interactor.dataItems()
        
        return dataItems.map { HomeListDisplayItem(id: $0.id, text: $0.text) }
    }

}
