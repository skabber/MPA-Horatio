//
//  Operation+Particles.swift
//  Copyright © 2016 Mudpot Apps. All rights reserved.
//

import Foundation


extension NSOperation {
    enum KeyPath: String {
        case cancelled = "isCancelled"
        case executing = "isExecuting"
        case finished = "isFinished"
    }
    
    
    func willChangeValue(forKey key: KeyPath) {
        willChangeValue(forKey: key.rawValue)
    }
    

    func didChangeValue(forKey key: KeyPath) {
        didChangeValue(forKey: key.rawValue)
    }
}


public extension NSOperation {
    var operationName: String {
        return name ?? "Unnamed Operation"
    }
    

    var particleName: String {
        return operationName
    }

    
    func addCompletionBlock(block: () -> Void) {
        if let existing = completionBlock {
            completionBlock = {
                existing()
                block()
            }
        } else {
            completionBlock = block
        }
    }
}
