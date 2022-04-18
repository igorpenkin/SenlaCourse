//
//  MediaView.swift
//  SenlaApp
//
//  Created by Igor Penkin on 16.04.2022.
//

import UIKit

final class MediaView: UIView {
    
    private lazy var shakerButton: UIButton = {
        let button = UIButton()
        button.setTitle("Shaker", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .black
        button.layer.cornerRadius = 10
        button.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
        button.layer.masksToBounds = true
        button.addAction(UIAction { [weak self] _ in
            self?.shakerButtonDidTouchDown()
        }, for: .touchDown)
        return button
    }()
    
    private lazy var pulsationButton: UIButton = {
        let button = UIButton()
        button.setTitle("Pulse", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .black
        button.addAction(UIAction { [weak self] _ in
            self?.pulsationButtonDidTouchDown()
        }, for: .touchDown)
        button.addAction(UIAction { [weak self] _ in
            self?.pulsationButtonDidTouchUpInside()
        }, for: .touchUpInside)
        button.addAction(UIAction { [weak self] _ in
            self?.pulsationButtonDidTouchUpOutside()
        }, for: .touchUpOutside)
        return button
    }()
    
    private lazy var tranpareneButton: UIButton = {
        let button = UIButton()
        return button
    }()

    private lazy var squareView: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var circleView: UIView = {
        let view = UIView()
        view.backgroundColor = .magenta
        view.layer.masksToBounds = true
        view.layer.borderWidth = 30
        view.layer.borderColor = UIColor.systemGreen.cgColor
        return view
    }()
    
    private lazy var animator = UIViewPropertyAnimator(duration: 2.0, curve: .easeOut) {
        self.circleView.center = self.center
        self.circleView.layer.cornerRadius = 0
        self.circleView.layer.borderWidth = 0
    }
    
    private lazy var curveView: UIView = {
        let view = UIView()
        return view
    }()
    
    convenience init() {
        self.init(frame: .zero)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        addSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let padding: CGFloat = 10
        let bWidth: CGFloat = (width-4*padding)/3
        let viewEdge = bWidth
        squareView.frame = CGRect(x: safeAreaInsets.left+padding,
                                  y: safeAreaInsets.top+padding,
                                  width: viewEdge,
                                  height: viewEdge)
        circleView.frame = CGRect(x: squareView.right+padding,
                                  y: safeAreaInsets.top+padding,
                                  width: viewEdge,
                                  height: viewEdge)
        circleView.layer.cornerRadius = circleView.height/2
        curveView.frame = CGRect(x: squareView.right+padding,
                                  y: safeAreaInsets.top+padding,
                                  width: viewEdge,
                                  height: viewEdge)
        shakerButton.frame = CGRect(x: safeAreaInsets.left+padding,
                                    y: height-safeAreaInsets.bottom-48-padding,
                                    width: bWidth,
                                    height: 48)
        pulsationButton.frame = CGRect(x: shakerButton.right+padding,
                                    y: height-safeAreaInsets.bottom-48-padding,
                                    width: bWidth,
                                    height: 48)
        tranpareneButton.frame = CGRect(x: pulsationButton.right+padding,
                                    y: height-safeAreaInsets.bottom-48-padding,
                                    width: bWidth,
                                    height: 48)
    }
}

private extension MediaView {
    func addSubviews() {
        addSubview(circleView)
        addSubview(squareView)
        addSubview(curveView)
        addSubview(shakerButton)
        addSubview(pulsationButton)
        addSubview(tranpareneButton)
    }
}

private extension MediaView {
    func shakerButtonDidTouchDown() {
        shakerButton.animationOfShaking()
    }
    
    func pulsationButtonDidTouchDown() {
        pulsationButton.animationOfTouchDown()
    }
    
    func pulsationButtonDidTouchUpOutside() {
        pulsationButton.animationOfTouchUp()
    }
    
    func pulsationButtonDidTouchUpInside() {
        pulsationButton.animationOfPulsation()
        animator.startAnimation()
//        UIView.animateKeyframes(withDuration: 2.0, delay: 0, options: .autoreverse) {
//            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.5) {
//                self.circleView.frame = self.bounds
//            }
//            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.5) {
//                self.circleView.layer.cornerRadius = 0
//                self.circleView.layer.borderWidth = 0
//            }
//
//        } completion: { _ in
//
//        }
        
//        UIView.transition(with: <#T##UIView#>, duration: <#T##TimeInterval#>, options: <#T##UIView.AnimationOptions#>, animations: <#T##(() -> Void)?##(() -> Void)?##() -> Void#>, completion: <#T##((Bool) -> Void)?##((Bool) -> Void)?##(Bool) -> Void#>)
    }
}
