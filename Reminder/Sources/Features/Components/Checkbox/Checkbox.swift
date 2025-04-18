//
//  Checkbox.swift
//  Reminder
//
//  Created by Alysson Barrera on 18/04/25.
//

import UIKit

public class Checkbox: UIView {
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = Typography.input
        label.textColor = Colors.gray200
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let checkbox: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "square"), for: .normal)
        button.tintColor = Colors.gray400
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    init(title: String) {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.text = title
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        addSubview(checkbox)
        addSubview(titleLabel)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            checkbox.leadingAnchor.constraint(equalTo: leadingAnchor),
            checkbox.centerYAnchor.constraint(equalTo: centerYAnchor),
            checkbox.widthAnchor.constraint(equalToConstant: Metrics.medium),
            checkbox.heightAnchor.constraint(equalToConstant: Metrics.medium),
            
            titleLabel.leadingAnchor.constraint(equalTo: checkbox.trailingAnchor, constant: Metrics.small),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
}
