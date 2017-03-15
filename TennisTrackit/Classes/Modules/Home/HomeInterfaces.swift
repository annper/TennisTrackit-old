//
//  HomeInterfaces.swift
//  Generated using vipergen
//
//  Created by Annie on 27/01/2017.
//  Copyright © 2017. All rights reserved.
//

/** view **/

protocol HomeViewOutput: class {
    func viewWillAppear(animated: Bool)
}

protocol HomeViewInput: class, SectionItemViewInput {
    
}

/** interactor **/

protocol HomeInteractorInput: class {
    func dataItems() -> [HomeListDataItem]
}

protocol HomeInteractorOutput: class {
    
}
