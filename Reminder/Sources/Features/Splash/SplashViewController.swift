//
//  SplashViewController.swift
//  Reminder
//
//  Created by Alysson Barrera on 14/12/24.
//

import UIKit

class SplashViewController: UIViewController {
    let contentView: SplashView
    public weak var flowDelegate: SplashFlowDelegate?
    
    init(contentView: SplashView, flowDelegate: SplashFlowDelegate) {
        self.contentView = contentView
        self.flowDelegate = flowDelegate
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupGesture()
        
        // ciclo de decisão se vai para login ou para o menu
        setup()
    }
    
    private func setup() {
        self.view.addSubview(self.contentView)
        self.navigationController?.navigationBar.isHidden = true
        self.view.backgroundColor = Colors.primaryRedBase
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            self.contentView.topAnchor.constraint(equalTo: view.topAnchor),
            self.contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            self.contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            self.contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        
        self.contentView.translatesAutoresizingMaskIntoConstraints = false
        
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
        self.flowDelegate?.openLoginBottomSheet()
    }
}
