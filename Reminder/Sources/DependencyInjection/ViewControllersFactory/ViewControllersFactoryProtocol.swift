//
//  ViewControllersFactoryProtocol.swift
//  Reminder
//
//  Created by Alysson Barrera on 22/12/24.
//

protocol ViewControllersFactoryProtocol: AnyObject {
    func makeSplashViewController(flowDelegate: SplashFlowDelegate) -> SplashViewController
    func makeLoginBottomSheetViewController(flowDelegate: LoginBottomSheeFlowDelegate) -> LoginBottomSheetViewController
}
