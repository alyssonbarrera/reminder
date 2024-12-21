//
//  ReminderFlowControlller.swift
//  Reminder
//
//  Created by Alysson Barrera on 21/12/24.
//

import UIKit

class ReminderFlowControlller {
    //MARK: - Properties
    private var navigationController: UINavigationController?

    //MARK: - init
    public init() {}
    
    //MARK: - startFlow
    func start() -> UINavigationController? {
        let startViewController = SplashViewController(flowDelegate: self)
        self.navigationController = UINavigationController(rootViewController: startViewController)
        return self.navigationController
    }
}

//MARK: - Login
extension ReminderFlowControlller: LoginBottomSheeFlowDelegate {
    func navigateToHome() {
        self.navigationController?.dismiss(animated: true)
        let viewController = UIViewController()
        viewController.view.backgroundColor = .red
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}

//MARK: - Splash
extension ReminderFlowControlller: SplashFlowDelegate {
    func openLoginBottomSheet() {
        let loginBottomSheet = LoginBottomSheetViewController(flowDelegate: self)
        loginBottomSheet.modalPresentationStyle = .overCurrentContext // apresenta a nova view em cima da view atual
        loginBottomSheet.modalTransitionStyle = .crossDissolve
        navigationController?.present(loginBottomSheet, animated: false) {
            loginBottomSheet.animateShow()
        }
    }
}
