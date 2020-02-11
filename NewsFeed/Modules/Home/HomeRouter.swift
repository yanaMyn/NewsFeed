//
//  HomeRouter.swift
//  NewsFeed
//
//  Created yana mulyana on 10/02/20.
//  Copyright © 2020 LinkAJa. All rights reserved.
//
//  Template generated by Yana Mulyana
//

import UIKit

class HomeRouter: HomePresenterToRouterProcotol {
    
    static func mainStoryBoard(storyName: String) -> UIStoryboard {
        return UIStoryboard(name: storyName, bundle: Bundle.main)
    }
    
    static func createModule() -> UIViewController {
        let view = mainStoryBoard(storyName: "Main").instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        var interactor: HomePresenterToInteractorProtocol = HomeInteractor()
        let presenter: HomeViewToPresenterProtocol & HomeInteractorToPresenterProtocol = HomePresenter()
        let router: HomePresenterToRouterProcotol = HomeRouter()
        
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        
        view.presenter = presenter
        interactor.presenter = presenter
        
        return view
    }
    
    func toDetail(navigation: UINavigationController) {
        //present or push
    }
}