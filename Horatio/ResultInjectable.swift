//
//  ResultInjectable.swift
//  Copyright © 2016 Mudpot Apps. All rights reserved.
//

import Foundation


public protocol ParticleResult {
    associatedtype Requirement
    associatedtype Result
    
    var requirement: Requirement { get set }
    var result: Result { get set }
}



public class Particle: NSOperation, ParticleProcotol {
}

    


public protocol Dependency {
    
}


public extension ParticleProtocol {
    func inject<Dependency: ParticleProtocol>(dependency: Dependency, block: (Self, Dependency, [NSError]) -> Void) -> Self {
        dependency.addWillFinishBlockObserver { [weak self] dependency, errors in
            guard let weakSelf = self else { return }
    
            block(weakSelf, dependency, errors)
        }
        
        dependency.addDidCancelBlockObserver { [weak self] dependency, errors in
            guard let weakSelf = self else { return }
            
            add(dependency: dependency)
        }
        
        return self
    }
}


public extension ParticleResult where Self: ParticleProtocol {
    func injectResultFrom<Dependency>(dependency: Dependency) -> Self where Dependency: ParticleProcotol, Dependency: ParticleResult, Dependency.Result == Requirement {
        return inject(dependency: dependency) { procedure, dependency, errors in
            guard errors.isEmpty else {
                procedure.cancel(withError: ProcedureKitError.dependency(finishedWithErrors: errors))
                return
            }

            procedure.requirement = dependency.result
        }
    }
    
    func requireResultFrom<Dependency>(dependency: Dependency) -> Self where Dependency: ParticleProcotol, Dependency: ParticleResult, Dependency.Result == Optional<Requirement> {
        return inject(dependency: dependency) { procedure, dependency, errors in
            guard errors.isEmpty else {
                procedure.cancel(withError: ProcedureKitError.dependency(finishedWithErrors: errors))
                return
            }

            guard let requirement = dependency.result else {
                procedure.cancel(withError: ProcedureKitError.requirementNotSatisfied())
                return
            }

            procedure.requirement = requirement
        }
    }
}
