//
//  HistoryViewController.swift
//  SenlaApp
//
//  Created by Igor Penkin on 09.04.2022.
//

import UIKit

final class HistoryViewController: UIViewController {

    private let contentView = HistoryView()
    
    override func loadView() {
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "History"
    }
}
