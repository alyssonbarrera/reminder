//
//  SplashViewController.swift
//  Reminder
//
//  Created by Alysson Barrera on 14/12/24.
//

import UIKit

class SplashViewController: UIViewController {
    let contentView = SplashView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupGesture()
        
        // ciclo de decisão se vai para login ou para o menu
        setup()
    }
    
    private func setup() {
        self.view.addSubview(contentView)
        self.navigationController?.navigationBar.isHidden = true
        self.view.backgroundColor = Colors.primaryRedBase
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: view.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        // contentView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        // contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        // contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        // contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    private func setupGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(showLoginBottomSheet))
        self.view.addGestureRecognizer(tapGesture)
    }
    
    @objc // para usar coisas do objective-c que não foram migradas
    private func showLoginBottomSheet() {
        let loginBottomSheet = LoginBottomSheetViewController()
        loginBottomSheet.modalPresentationStyle = .overCurrentContext // apresenta a nova view em cima da view atual
        loginBottomSheet.modalTransitionStyle = .crossDissolve
        self.present(loginBottomSheet, animated: false) {
            loginBottomSheet.animateShow()
        }
    }
}
