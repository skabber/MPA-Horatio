//
//  Particle.swift
//  Copyright © 2016 Mudpot Apps. All rights reserved.
//

import Foundation


public protocol ParticleProcotol {
    var particleName: String { get }
    
    var isExecuting: Bool { get }
    var isFinished: Bool { get }
    var isCancelled: Bool { get }
    
    var errors: [NSError] { get }
    
    // Execution
    
    func willEnqueue()
    func execute()
    func produce(operation: NSOperation)
    
    // Cancelling
    
    func cancel(withErrors: [NSError]?)
    func procedureWillCancel(withErrors: [NSError]?)
    func procedureDidCancel(withErrors: [NSError]?)
    
    // Finishing
    
    func finish(withErrors: [NSError]?)
    func particleWillFinish(withErrors: [NSError]?)
    func particleDidFinish(withErrors: [NSError]?)
    
    // Observers
    
    func add(observer: ParticleObserver) // Swift3 -- where Observer.Particle == Self
    
    // Dependencies
    
    func add(dependency: ParticleProtocol)
}


public extension ParticleProcotol {
    var failed: Bool {
        return errors.count > 0
    }
    
    func cancel(withError error: NSError?) {
        cancel(error.map { [$0] } ?? nil)
    }
    
    func particleWillCancel(withErrors: [NSError]) { }
    
    func particleDidCancel(withErrors: [NSError]) { }
    
    func finish(withError error: NSError? = nil) {
        finish(error.map { [$0] } ?? nil)
    }
    
    func procedureWillFinish(withErrors: [NSError]) { }
    
    func procedureDidFinish(withErrors: [NSError]) { }
}
