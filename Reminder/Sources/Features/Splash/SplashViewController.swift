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
        
        setup()
    }
    
    private func setup() {
        self.view.addSubview(contentView)
        
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
}
