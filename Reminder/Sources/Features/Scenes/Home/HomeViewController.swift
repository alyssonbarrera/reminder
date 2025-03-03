//
//  HomeViewController.swift
//  Reminder
//
//  Created by Alysson Barrera on 23/12/24.
//

import UIKit

class HomeViewController: UIViewController {
    let contentView: HomeView
    let flowDelegate: HomeFlowDelegate
    
    init(contentView: HomeView, flowDelegate: HomeFlowDelegate) {
        self.contentView = contentView
        self.flowDelegate = flowDelegate
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setupNavigationBar()
    }
    
    private func setupNavigationBar() {
        self.navigationController?.navigationBar.isHidden = false
        self.navigationItem.hidesBackButton = true
        
        let logoutButton = UIBarButtonItem(
            image: UIImage(named: "log-out-icon"),
            style: .plain,
            target: self,
            action: #selector(logoutAction))
        
        logoutButton.tintColor = Colors.primaryRedBase
        navigationItem.rightBarButtonItem = logoutButton
    }
    
    private func setup() {
        view.addSubview(contentView)
        buildHierarchy()
    }
    
    @objc
    private func logoutAction() {
        // clicou no logout
    }
    
    private func buildHierarchy() {
        setupContentViewToBounds(contentView: contentView)
    }
}
