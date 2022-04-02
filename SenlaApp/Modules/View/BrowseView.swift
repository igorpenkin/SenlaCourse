//
//  BrowseView.swift
//  SenlaApp
//
//  Created by Igor Penkin on 02.04.2022.
//

import UIKit

class BrowseView: UIView {
    
    private enum Constants {
        static let padding: CGFloat = 40
        static let rowHeight: CGFloat = 60
    }
    
    private let scrollView = UIScrollView()
    
    private let image: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(
            systemName: "hand.thumbsup.fill",
            withConfiguration: UIImage.SymbolConfiguration(pointSize: 512, weight: .semibold)
        )
        view.tintColor = .red
        view.layer.borderWidth = 1.0
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    /// 1st way to navigate to the next screen
    private lazy var settingButton: UIButton = {
        let button = UIButton()
        button.setTitle("Print CGRects", for: .normal)
        button.setTitleColor(.red, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 22, weight: .medium)
        button.setImage(.init(systemName: "rectangle.portrait.and.arrow.right"), for: .normal)
        button.imageView?.tintColor = .red
        button.addAction(UIAction() { [weak self] _ in
            self?.printBounds()
        }, for: .touchUpInside)
        button.backgroundColor = .white
        button.layer.cornerRadius = 18
        return button
    }()
    
    private let magicLabel: UILabel = {
        let label = UILabel()
        label.text = "Magic label"
        label.font = .systemFont(ofSize: 48, weight: .semibold)
        label.textColor = .black
        return label
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        label.text = """
        Lorem Ipsum - это текст-"рыба", часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной "рыбой" для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum для распечатки образцов. Lorem Ipsum не только успешно пережил без заметных изменений пять веков, но и перешагнул в электронный дизайн. Его популяризации в новое время послужили публикация листов Letraset с образцами Lorem Ipsum в 60-х годах и, в более недавнее время, программы электронной вёрстки типа Aldus PageMaker, в шаблонах которых используется Lorem Ipsum.
        """
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.numberOfLines = 0
        label.textColor = .black
        return label
    }()
    
    convenience init() {
        self.init(frame: .zero)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .green
        addSubviews()
        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


private extension BrowseView {
    func addSubviews() {
        scrollView.addSubview(image)
        scrollView.addSubview(magicLabel)
        scrollView.addSubview(label)
        scrollView.addSubview(settingButton)
        addSubview(scrollView)
    }
    
    func makeConstraints() {
        scrollView.backgroundColor = .white
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        image.translatesAutoresizingMaskIntoConstraints = false
        magicLabel.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        settingButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            
            image.topAnchor.constraint(equalTo: scrollView.topAnchor),
            image.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            image.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            magicLabel.topAnchor.constraint(equalTo: image.bottomAnchor, constant: Constants.padding),
            magicLabel.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            magicLabel.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.75, constant: 10),
            magicLabel.heightAnchor.constraint(equalToConstant: Constants.rowHeight),
            
            label.topAnchor.constraint(equalTo: magicLabel.bottomAnchor, constant: Constants.padding),
            label.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            label.widthAnchor.constraint(equalTo: magicLabel.widthAnchor),
            
            settingButton.topAnchor.constraint(equalTo: label.bottomAnchor, constant: Constants.padding),
            settingButton.leadingAnchor.constraint(equalTo: magicLabel.leadingAnchor),
            settingButton.trailingAnchor.constraint(equalTo: magicLabel.trailingAnchor),
            settingButton.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -Constants.padding)
        ])
    }
    
    func printBounds() {
        print("frame origin: \(scrollView.frame.origin)")
        print("frame size: \(scrollView.frame.size)\n")
        print("bounds origin: \(scrollView.bounds.origin)")
        print("bounds size: \(scrollView.bounds.size)\n")
        print("content size: \(scrollView.contentSize)")
        print("content offset: \(scrollView.contentOffset)")
    }
}
