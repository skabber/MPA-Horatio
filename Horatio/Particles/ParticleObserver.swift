//
//  ParticleObserver.swift
//  HoratioDemo
//
//  Created by Kevin Tatroe on 9/15/16.
//  Copyright © 2016 Mudpot Apps. All rights reserved.
//

import Foundation


public protocol ParticleObserver {
    func didAttach(to particle: Particle)
    
    func willExecute(particle: Particle)
    
    func willCancel(particle: Particle, withErrors: [NSError]?)
    func didCancel(particle: Particle, withErrors: [NSError]?)
    
    func particle(particle: Particle, didProduce newOperation: NSOperation)
    
    func willFinish(particle: Particle, withErrors errors: [NSError]?)
    func didFinish(particle: Particle, withErrors errors: [NSError]?)
}


public extension ParticleObserver {
    func didAttach(to particle: Particle) { }
    
    func willExecute(particle: Particle) { }
    
    func willCancel(particle: Particle, withErrors: [NSError]?) { }
    func didCancel(particle: Particle, withErrors: [NSError]?) { }
    
    func particle(particle: Particle, didProduce newOperation: NSOperation) { }
    
    func willFinish(particle: Particle, withErrors errors: [NSError]?) { }
    func didFinish(particle: Particle, withErrors errors: [NSError]?) { }
}
