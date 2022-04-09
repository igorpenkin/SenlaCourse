//
//  ContentViewController.swift
//  SenlaApp
//
//  Created by Igor Penkin on 26.03.2022.
//

import UIKit

class ContentViewController: UIViewController {

    private lazy var contentView: ContentView = {
        let view = ContentView()
        view.viewDelegate = self
        return view
    }()
    
    override func loadView() {
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBarIfPossible()
    }
}

extension ContentViewController: ContentViewDelegate {
    func contentViewSettingsButtonDidTap(_ contentView: ContentView) {
        routeToSettings()
    }
}

private extension ContentViewController {
    
    func setupNavigationBarIfPossible() {
        title = "Content scene"
        navigationController?.navigationBar.prefersLargeTitles = true
        let button = UIButton()
        button.setImage(
            UIImage(systemName: "arrow.up.doc.fill",
                    withConfiguration: UIImage.SymbolConfiguration(pointSize: 32)),
            for: .normal)
        button.imageView?.tintColor = .black
        button.addAction(UIAction() { [weak self] _ in
            self?.routeToModalSheet()
        }, for: .touchUpInside)
        navigationItem.rightBarButtonItems = [ UIBarButtonItem(customView: button) ]
    }
    
    func routeToSettings() {
        let vc = UIViewController()
        vc.view.backgroundColor = .red
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func routeToModalSheet() {
        let vc = UIViewController()
        vc.view.backgroundColor = .white
        present(vc, animated: true)
    }
}
