//
//  ChooseImageBuilder.swift
//  Picture
//
//  Created by Ji-hoon Ahn on 2022/03/31.
//

import RIBs

protocol ChooseImageDependency: Dependency {
    var loadingModalBuildable : LoadingModalBuildable {get}
    var imageVerificationBuildable : ImageVerificationBuildable {get}

}

final class ChooseImageComponent: Component<ChooseImageDependency> , ImageVerificationDependency{
    var loadingModalBuildable : LoadingModalBuildable {dependency.loadingModalBuildable}
    var imageVerificationBuildable : ImageVerificationBuildable {dependency.imageVerificationBuildable}
}

// MARK: - Builder

protocol ChooseImageBuildable: Buildable {
    func build(withListener listener: ChooseImageListener) -> ViewableRouting
}

final class ChooseImageBuilder: Builder<ChooseImageDependency>, ChooseImageBuildable {
    
    override init(dependency: ChooseImageDependency) {
        super.init(dependency: dependency)
    }
    
    func build(withListener listener: ChooseImageListener) -> ViewableRouting {
        let component = ChooseImageComponent(dependency: dependency)
        let viewController = ChooseImageViewController()
        
        let interactor = ChooseImageInteractor(presenter: viewController)
        interactor.listener = listener
        
        
        return ChooseImageRouter(
            interactor: interactor,
            viewController: viewController,
            loadingModalBuidable: component.loadingModalBuildable,
            imageVerificationBuildable: component.imageVerificationBuildable
        )
    }
}
