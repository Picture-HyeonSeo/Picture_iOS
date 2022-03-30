//
//  AppRootComponent.swift
//  Picture
//
//  Created by Ji-hoon Ahn on 2022/03/28.
//

import RIBs
import RIBsUtil

final class AppRootComponent: Component<AppRootDependency>, AppHomeDependency , ListHomeDependency, TopupDependency, AlbumHomeDependency, PageDashboardDependency{
    
    lazy var pageDashboardBuildable: PageDashboardBuildable = {
        return PageDashboardBuilder(dependency: self)
    }()
    
    
    lazy var albumBuildable: AlbumHomeBuildable = {
       return AlbumHomeBuilder(dependency: self)
    }()
    
    lazy var topupBuildable: TopupBuildable = {
        return TopupBuilder(dependency: self)
    }()
    
    var topupBaseViewController: ViewControllable{
        rootViewController.topViewControllable
    }
    
    private let rootViewController : ViewControllable

     init(
        dependency: AppRootDependency,
        rootViewController: ViewControllable
    ) {
        self.rootViewController = rootViewController
        super.init(dependency: dependency)
    }
    
    
}