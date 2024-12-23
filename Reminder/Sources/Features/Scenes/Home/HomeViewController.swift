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
    }
    
    private func setup() {
        view.addSubview(contentView)
        buildHierarchy()
    }
    
    private func buildHierarchy() {
        setupContentViewToBounds(contentView: contentView)
    }
}
