//
//  MenuPresenter.swift
//  Generated using vipergen
//
//  Created by Annie on 27/01/2017.
//  Copyright © 2017 Dogfish Mobile. All rights reserved.
//

import UIKit

class MenuPresenter: SectionItemPresenter<MenuListDisplayItem>, MenuViewOutput, MenuInteractorOutput {
    
    var wireframe: MenuWireframe
    var interactor: MenuInteractorInput
    weak var userInterface: MenuViewInput!
	
    // MARK: - MenuPresenter
    
    init(wireframe: MenuWireframe, interactor: MenuInteractorInput, userInterface: MenuViewInput) {
        self.wireframe = wireframe
        self.interactor = interactor
        self.userInterface = userInterface
    }
    
    // MARK: - MenuViewOutput
    
    func viewWillAppear(animated: Bool) {
        updateSectionItemUserInterface(userInterface: userInterface, reloadData: false)
    }
    
    // MARK: - SectionItemPresenter
    
    override func displayDataItems() -> [MenuListDisplayItem]? {
        let dataItems = interactor.dataItems()
        
        return dataItems.map { MenuListDisplayItem(id: $0.id, text: $0.text) }
    }

}
