//
//  ViewController.swift
//  HW 12
//
//  Created by Ольга on 02.12.2021.
//

import UIKit

class SettingsViewController: UIViewController {
    
    private var settingsView: SettingsView? {
        guard isViewLoaded else { return nil }
        return view as? SettingsView
    }
    
    var model: SettingsModel?
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = SettingsView()
        model = SettingsModel()
        
        setupView()
        configureView()
    }

    // MARK: - Settings
    
    private func setupView() {
        view.backgroundColor = .systemGray6
        navigationItem.title = "Настройки"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}

// MARK: - Configurations

private extension SettingsViewController {
    func configureView() {
        guard let models = model?.createModels() else { return }
        models.forEach { [unowned self] model in
            settingsView?.configureView(with: models)
        }
    }
}

