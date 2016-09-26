//
//  ParticleBlockObservers.swift
//  Copyright © 2016 Mudpot Apps. All rights reserved.
//

import Foundation


public extension ParticleProcotol {
    func addWillExecuteBlockObserver(block: ParticleWillExecuteObserver.ObservingBlock) {
        add(observer: ParticleWillExecuteObserver(block))
    }
    
    func addWillCancelBlockObserver(block: ParticleWillCancelObserver.ObservingBlock) {
        add(observer: ParticleWillCancelObserver(block))
    }
    
    func addDidCancelBlockObserver(block: ParticleDidCancelObserver.ObservingBlock) {
        add(observer: ParticleDidCancelObserver(block))
    }
    
    func addDidProduceOperationBlockObserver(block: ParticleDidProduceOperationObserver.ObservingBlock) {
        add(observer: ParticleDidProduceOperationObserver(block))
    }
    
    func addWillFinishBlockObserver(block: ParticleWillFinishObserver.ObservingBlock) {
        add(observer: ParticleWillFinishObserver(block))
    }
    
    func addDidFinishBlockObserver(block: ParticleDidFinishObserver.ObservingBlock) {
        add(observer: ParticleDidFinishObserver(block))
    }
}


public struct ParticleWillExecuteObserver: ParticleObserver {
    public typealias ObservingBlock = (Particle) -> Void
    
    
    // MARK: - Initialization
    
    public init(block: ObservingBlock) {
        self.block = block
    }
    
    
    // MARK: - <ParticleObserver>
    
    public func willExecute(particle: Particle) {
        block(particle)
    }
    
    
    // MARK: - Private
    
    private let block: ObservingBlock
}


public struct ParticleWillCancelObserver: ParticleObserver {
    public typealias ObservingBlock = (Particle, [NSError]?) -> Void
    
    
    // MARK: - Initialization
    
    public init(block: ObservingBlock) {
        self.block = block
    }
    
    
    // MARK: - <ParticleObserver>
    
    public func willCancel(particle: Particle, withErrors: [NSError]?) {
        block(particle, withErrors)
    }
    
    
    // MARK: - Private
    
    private let block: ObservingBlock
}


public struct ParticleDidCancelObserver: ParticleObserver {
    public typealias ObservingBlock = (Particle, [NSError]?) -> Void
    
    
    // MARK: - Initialization
    
    public init(block: ObservingBlock) {
        self.block = block
    }
    
    
    // MARK: - <ParticleObserver>
    
    public func didCancel(particle: Particle, withErrors: [NSError]?) {
        block(particle, withErrors)
    }
    
    
    // MARK: - Private
    
    private let block: ObservingBlock
}


public struct ParticleDidProduceOperationObserver: ParticleObserver {
    public typealias ObservingBlock = (Particle, NSOperation) -> Void
    
    
    // MARK: - Initialization
    
    public init(block: ObservingBlock) {
        self.block = block
    }
    
    
    // MARK: - <ParticleObserver>
    
    public func particle(particle: Particle, didProduce newOperation: NSOperation) {
        block(particle, newOperation)
    }
    
    
    // MARK: - Private
    
    private let block: ObservingBlock
}


public struct ParticleWillFinishObserver: ParticleObserver {
    public typealias ObservingBlock = (Particle, [NSError]?) -> Void
    
    
    // MARK: - Initialization
    
    public init(block: ObservingBlock) {
        self.block = block
    }
    
    
    // MARK: - <ParticleObserver>
    
    public func willFinish(particle: Particle, withErrors: [NSError]?) {
        block(particle, withErrors)
    }
    
    
    // MARK: - Private
    
    private let block: ObservingBlock
}


public struct ParticleDidFinishObserver: ParticleObserver {
    public typealias ObservingBlock = (Particle, [NSError]?) -> Void
    
    
    // MARK: - Initialization
    
    public init(block: ObservingBlock) {
        self.block = block
    }
    
    
    // MARK: - <ParticleObserver>
    
    public func didFinish(particle: Particle, withErrors: [NSError]?) {
        block(particle, withErrors)
    }
    
    
    // MARK: - Private
    
    private let block: ObservingBlock
}
