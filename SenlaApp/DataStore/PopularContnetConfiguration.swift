//
//  PopularContnetConfiguration.swift
//  SenlaApp
//
//  Created by Igor Penkin on 09.04.2022.
//

import UIKit


struct PopularContnetConfiguration: UIContentConfiguration {
    let id: Int
    let title: String
    let imageUrl: String
    
    func makeContentView() -> UIView & UIContentView {
        PopularContentView(with: self)
    }
    
    func updated(for state: UIConfigurationState) -> PopularContnetConfiguration {
        self
    }
}


final class PopularContentView: UIView, UIContentView {
    var configuration: UIContentConfiguration
    
    private let label: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.textColor = .label
        label.textAlignment = .center
        return label
    }()
    
    private let image: UIImageView = {
        let view = UIImageView()
        view.tintColor = .red
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        return view
    }()
    
    init(with contentConfiguration: PopularContnetConfiguration) {
        configuration = contentConfiguration
        super.init(frame: .zero)
        addSubview(image)
        addSubview(label)
        makeConstraints()
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        guard let content = configuration as? PopularContnetConfiguration else {
            return
        }
        label.text = content.title
        image.image = UIImage(systemName: content.imageUrl)
    }
    
    private func makeConstraints() {
        label.translatesAutoresizingMaskIntoConstraints = false
        image.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: topAnchor),
            image.leftAnchor.constraint(equalTo: leftAnchor),
            image.rightAnchor.constraint(equalTo: rightAnchor),
            image.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            label.centerXAnchor.constraint(equalTo: centerXAnchor),
            label.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}
