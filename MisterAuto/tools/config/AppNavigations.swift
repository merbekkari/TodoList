//
//  AppNavigations.swift
//  MisterAuto
//
//  Created by mbekkari on 1/5/2022.
//

import Foundation
import UIKit
public class AppNavigations {

    ///Create UINavigationController from storyboard name
    public static func createNavigationController(from storyboardName : String)-> UINavigationController?{
        guard let viewController = UIStoryboard(name: storyboardName, bundle: nil).instantiateInitialViewController() else { return nil }
        return self.createNavigationController(from: viewController)
    }
    
    
    ///Create UINavigationController from UIViewController
    public static func createNavigationController(from controller : UIViewController) -> UINavigationController?{
        controller.modalPresentationStyle = .overFullScreen
        let navigationController = UINavigationController()
        navigationController.viewControllers = [controller]
        return navigationController
    }
    
    
    public static func getController(storyboardName name : String) -> UIViewController? {
        return UIStoryboard(name: name, bundle: nil).instantiateInitialViewController()
    }
    
    
    public static func pushController(from : UIViewController, viewController : UIViewController){
        from.navigationController?.pushViewController(viewController, animated: true)
    }
    
    
    public static func pushController(from : UIViewController, storyboardName : String){
        guard let viewController = getController(storyboardName: storyboardName) else {return}
        self.pushController(from: from, viewController: viewController)
    }
    
}

