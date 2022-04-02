//
//  BrowseViewController.swift
//  SenlaApp
//
//  Created by Igor Penkin on 02.04.2022.
//

import UIKit

class BrowseViewController: UIViewController {

    private let browseView = BrowseView()
    
    override func loadView() {
        view = browseView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
