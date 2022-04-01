//
//  ContentViewController.swift
//  SenlaApp
//
//  Created by Igor Penkin on 26.03.2022.
//

import UIKit

class ContentViewController: UIViewController {

    /// 1st way to navigate to the next screen
    private lazy var button: UIButton = {
        let button = UIButton()
        button.setTitle("Route to settings", for: .normal)
        button.setTitleColor(.red, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 22, weight: .medium)
        button.setImage(.init(systemName: "rectangle.portrait.and.arrow.right"), for: .normal)
        button.imageView?.tintColor = .red
        button.addAction(UIAction() { [weak self] _ in
            self?.routeToSettings()
        }, for: .touchUpInside)
        button.backgroundColor = .white
        button.layer.cornerRadius = 18
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBarIfPossible()
        setupView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        button.frame = CGRect(origin: .zero, size: .init(width: 224, height: 36))
        button.center = view.center
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
    
    func setupView() {
        view.backgroundColor = .systemGray5
        view.addSubview(button)
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
