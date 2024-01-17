//
//  StoryBoardable.swift
//  MVVM_simple
//
//  Created by Nikita Shestakov on 16.01.2024.
//

import UIKit

protocol StoryBoardable {
    static func createObject() -> Self
}

extension StoryBoardable where Self: UIViewController {
    
    static func createObject() -> Self {
        let id = String(describing: self)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        return storyboard.instantiateViewController(identifier: id) as! Self
    }
}
