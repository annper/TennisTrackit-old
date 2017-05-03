//
//  MenuInterfaces.swift
//  Generated using vipergen
//
//  Created by Annie on 27/01/2017.
//  Copyright © 2017 Dogfish Mobile. All rights reserved.
//

/** view **/

protocol MenuViewOutput: class {
    func viewWillAppear(animated: Bool)
    func rowTappedWith(id: Int)
}

protocol MenuViewInput: class, SectionItemViewInput {
    
}

/** interactor **/

protocol MenuInteractorInput: class {
    func dataItems() -> [MenuListDataItem]
}

protocol MenuInteractorOutput: class {
    
}
