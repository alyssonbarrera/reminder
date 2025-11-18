//
//  ReminderFlowControlller.swift
//  Reminder
//
//  Created by Alysson Barrera on 21/12/24.
//

import UIKit

class ReminderFlowController {
    //MARK: - Properties
    private var navigationController: UINavigationController?
    private let viewControllersFactory: ViewControllersFactoryProtocol

    //MARK: - init
    public init() {
        self.viewControllersFactory = ViewControllersFactory()
    }
    
    //MARK: - startFlow
    func start() -> UINavigationController? {
        let startViewController = viewControllersFactory.makeSplashViewController(flowDelegate: self)
        self.navigationController = UINavigationController(rootViewController: startViewController)
        return self.navigationController
    }
}

//MARK: - Login
extension ReminderFlowController: LoginBottomSheetFlowDelegate {
    func navigateToHome() {
        self.navigationController?.dismiss(animated: false)
        let viewController = viewControllersFactory.makeHomeViewController(flowDelegate: self)
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}

//MARK: - Splash
extension ReminderFlowController: SplashFlowDelegate {
    func openLoginBottomSheet() {
        let loginBottomSheet = viewControllersFactory.makeLoginBottomSheetViewController(flowDelegate: self)
        loginBottomSheet.modalPresentationStyle = .overCurrentContext // apresenta a nova view em cima da view atual
        loginBottomSheet.modalTransitionStyle = .crossDissolve
        navigationController?.present(loginBottomSheet, animated: false) {
            loginBottomSheet.animateShow()
        }
        
        func navigateToHome() {
            self.navigationController?.dismiss(animated: false)
            let viewController = UIViewController()
            viewController.view.backgroundColor = .red
            self.navigationController?.pushViewController(viewController, animated: true)
        }
    }
}

//MARK: - Home
extension ReminderFlowController: HomeFlowDelegate {
    func logout() {
        self.navigationController?.popViewController(animated: true)
        self.openLoginBottomSheet()
    }
    
    func navigateToRecipes() {
        let newReceiptViewController = viewControllersFactory.makeNewReceiptViewController()
        self.navigationController?.pushViewController(newReceiptViewController, animated: true)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    func navigateToMyReceipts() {
        let myReceiptsViewController = viewControllersFactory.makeMyReceiptsViewController(flowDelegate: self)
        self.navigationController?.pushViewController(myReceiptsViewController, animated: true)
        self.navigationController?.navigationBar.isHidden = true
    }
}

//MARK: - MyReceipts
extension ReminderFlowController: MyReceiptsFlowDelegate {
    func goToNewReceipts() {
        // não implementado
    }
}
