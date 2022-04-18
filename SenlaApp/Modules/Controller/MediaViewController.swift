//
//  MediaViewController.swift
//  SenlaApp
//
//  Created by Igor Penkin on 16.04.2022.
//

import UIKit

final class MediaViewController: UIViewController {

    private let contentView = MediaView()
    
    override func loadView() {
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Media"
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    

}
