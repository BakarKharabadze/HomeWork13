//
//  OppositeSignVC.swift
//  ZodiacApp
//
//  Created by Bakar Kharabadze on 4/10/24.
//

import UIKit

//MARK: Protocol
protocol BackgroundDelegate: AnyObject {
    func changeButton(color: UIColor)
}

class OppositeSignVC: UIViewController {
    
    //MARK: Properties
    private let mainStackView = UIStackView()
    private let imageView = UIImageView()
    private let zodiacIcon = UIImageView()
    private let zodiacNameLabel = UILabel()
    private let redButton = UIButton()
    private let bottomStackView = UIStackView()
    private let blueButton = UIButton()
    private var zodiac: Zodiac
    weak var delegate: BackgroundDelegate?
    
    init(zodiac: Zodiac) {
        self.zodiac = zodiac
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("error")
    }
    
    private let zodiacNameLabelColor = UIColor(hexString: "#FFFFFF")

    //MARK: life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        mainStackView.setCustomSpacing(0, after: zodiacIcon)
    }
    
    //MARK: Set up Methods
    private func setup() {
        setupImageView()
        setupMainStackView()
        setupBottomStackView()
        setupzodiacIcon()
        setupZodiacNameLabel()
        setupRedButton()
        setupBlueButton()
        setMethod()
    }
    
    private func setupImageView() {
        view.addSubview(imageView)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "backgroundImage")
        imageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
    
    private func setupMainStackView() {
        view.addSubview(mainStackView)
        
        mainStackView.spacing = 20
        mainStackView.axis = .vertical
        mainStackView.layoutMargins = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        mainStackView.isLayoutMarginsRelativeArrangement = true
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        mainStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        mainStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
    
    private func setupzodiacIcon() {
        zodiacIcon.image = UIImage(named: "ვერძი")
        zodiacIcon.contentMode = .scaleAspectFit
        zodiacIcon.widthAnchor.constraint(equalToConstant: 90).isActive = true
        zodiacIcon.heightAnchor.constraint(equalToConstant: 124).isActive = true
        mainStackView.addArrangedSubview(zodiacIcon)
    }
    
    private func setupZodiacNameLabel() {
        zodiacNameLabel.text = "ვერძი"
        zodiacNameLabel.font = UIFont.systemFont(ofSize: 24)
        zodiacNameLabel.textColor = zodiacNameLabelColor
        zodiacNameLabel.textAlignment = .center
        zodiacNameLabel.numberOfLines = 1
        mainStackView.addArrangedSubview(zodiacNameLabel)
    }
    
    private func setupBottomStackView() {
        view.addSubview(bottomStackView)
        
        bottomStackView.spacing = 30
        bottomStackView.axis = .vertical
        bottomStackView.layoutMargins = UIEdgeInsets(top: 0, left: 20, bottom: 50, right: 20)
        bottomStackView.isLayoutMarginsRelativeArrangement = true
        bottomStackView.translatesAutoresizingMaskIntoConstraints = false
        bottomStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        bottomStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        bottomStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
    }
    
    private func setupRedButton() {
        redButton.setTitle("წითელი", for: .normal)
        redButton.heightAnchor.constraint(equalToConstant: 46).isActive = true
        redButton.backgroundColor = .red
        redButton.layer.cornerRadius = 10
        redButton.addTarget(self, action: #selector(redButtonDidTap), for: .touchUpInside)
        
        bottomStackView.addArrangedSubview(redButton)
        
    }
    
    private func setupBlueButton() {
        blueButton.setTitle("ლურჯი", for: .normal)
        blueButton.heightAnchor.constraint(equalToConstant: 46).isActive = true
        blueButton.backgroundColor = .blue
        blueButton.layer.cornerRadius = 10
        blueButton.addTarget(self, action: #selector(blueButtonDidTap), for: .touchUpInside)
        
        bottomStackView.addArrangedSubview(blueButton)
    }
    
    private func setMethod() {
        zodiacIcon.image = UIImage(named: zodiac.polarSign)
        zodiacNameLabel.text = zodiac.polarSign
    }
    
    @objc private func redButtonDidTap() {
        delegate?.changeButton(color: .red)
        navigationController?.popToRootViewController(animated: false)

}
    
    @objc private func blueButtonDidTap() {
        delegate?.changeButton(color: .blue)
        navigationController?.popToRootViewController(animated: false)

    }
}


