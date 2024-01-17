//
//  Dynamic.swift
//  MVVM_simple
//
//  Created by Nikita Shestakov on 15.01.2024.
//

import Foundation
//3 создаем класс Dynamic

class Dynamic<T> {
    
    typealias Listener = (T) -> Void
    
    private var listener: Listener?
    
    var value: T {
        didSet {
            listener?(value)
        }
    }
    
    init(value v: T) {
        self.value = v
    }
    
    func bind(_ listener: Listener?) {
        self.listener = listener
    }
    
}

