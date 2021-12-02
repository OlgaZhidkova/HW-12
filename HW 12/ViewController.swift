//
//  ViewController.swift
//  HW 12
//
//  Created by Ольга on 02.12.2021.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupHierarchy()
        setupLayout()
        
    }

    // MARK: - Settings
    
    private func setupView() {
        navigationItem.title = "Настройки"
        navigationController?.navigationBar.barTintColor = .lightGray
        navigationController?.navigationBar.isTranslucent = false
    
    }
    
    private func setupHierarchy() {
    
    }
    
    private func setupLayout() {
        
    }

}

