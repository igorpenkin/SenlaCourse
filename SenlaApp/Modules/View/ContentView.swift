//
//  ContentView.swift
//  SenlaApp
//
//  Created by Igor Penkin on 19.03.2022.
//

import UIKit


protocol ContentViewDelegate: AnyObject {
    func contentViewSettingsButtonDidTap(_ contentView: ContentView)
}

final class ContentView: UIView {

    weak var viewDelegate: ContentViewDelegate?
    
    private enum Constants {
        static let padding: CGFloat = 40
        static let rowHeight: CGFloat = 60
    }
    
    private let image: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(
            systemName: "hand.thumbsup.fill",
            withConfiguration: UIImage.SymbolConfiguration(pointSize: 512, weight: .semibold)
        )
        view.tintColor = .red
        view.layer.borderWidth = 1.0
        view.clipsToBounds = true
        view.contentMode = .center
        return view
    }()
    
    /// 1st way to navigate to the next screen
    private lazy var settingButton: UIButton = {
        let button = UIButton()
        button.setTitle("Route to settings", for: .normal)
        button.setTitleColor(.red, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 22, weight: .medium)
        button.setImage(.init(systemName: "rectangle.portrait.and.arrow.right"), for: .normal)
        button.imageView?.tintColor = .red
        button.addAction(UIAction() { [weak self] _ in
            self?.settingButtonDidTap()
        }, for: .touchUpInside)
        button.backgroundColor = .white
        button.layer.cornerRadius = 18
        return button
    }()
    
    convenience init() {
        self.init(frame: .zero)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemGray6
        addSubviews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        settingButton.frame = .init(
            x: Constants.padding,
            y: bounds.height - safeAreaInsets.bottom - Constants.padding - Constants.rowHeight,
            width: bounds.width - 2*Constants.padding,
            height: Constants.rowHeight
        )
        image.frame = .init(
            x: Constants.padding,
            y: safeAreaInsets.top + Constants.padding,
            width: bounds.width - 2*Constants.padding,
            height: bounds.height - safeAreaInsets.top - safeAreaInsets.bottom - 2*Constants.padding - settingButton.frame.height
        )
        
    }
}

private extension ContentView {
    
    func addSubviews() {
        addSubview(image)
        addSubview(settingButton)
    }
    
    func settingButtonDidTap() {
        viewDelegate?.contentViewSettingsButtonDidTap(self)
    }
}
