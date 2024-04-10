//
//  ViewController.swift
//  ZodiacApp
//
//  Created by Bakar Kharabadze on 4/10/24.
//

import UIKit

class MainVC: UIViewController {
    
    //MARK: properties
    private let mainStackView = UIStackView()
    private let hubNameLabel = UILabel()
    private let descriptionAppLAbel = UILabel()
    private let zodiacNameTextField = UITextField()
    private let zodiacNameLabel = UILabel()
    private let nextButton = UIButton()
    private let imageView = UIImageView()
    private let errorLabel = UILabel()
    
    private let hubNameLabelColor = UIColor(hexString: "#FFFFFF")
    private let descriptionAppLabelColor = UIColor(hexString: "#8B8B8B")
    private let zodiacNameLabelColor = UIColor(hexString: "#FFFFFF")
    private let zodiacNameTextFielPlaceholderdColor = UIColor(hexString: "#7D7E83")
    private let zodiacNameTextFieldColor = UIColor(hexString: "#DDDDDD")
    private let nextButtonColor = UIColor(hexString: "#5000B6")
    
    //MARK: life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setup()
    }
    
    //MARK: Set up Methods
    private func setup() {
        setupImageView()
        setupMainStackView()
        setupHubNameLabel()
        setupDescriptionAppLabel()
        setupZodiacNameLabel()
        setupZodiacNameTextField()
        setupNextButton()
        setupMainStackViewsCustomSpacings()
        setupErrorLabel()
        
    }
    
    private func setupMainStackViewsCustomSpacings() {
        mainStackView.setCustomSpacing(90, after: descriptionAppLAbel)
        mainStackView.setCustomSpacing(8, after: zodiacNameLabel)
        mainStackView.setCustomSpacing(38, after: zodiacNameTextField)
        mainStackView.setCustomSpacing(40, after: nextButton)
        
    }
    
    private func setupMainStackView() {
        view.addSubview(mainStackView)
        
        mainStackView.spacing = 20
        mainStackView.axis = .vertical
        mainStackView.layoutMargins = UIEdgeInsets(top: 70, left: 20, bottom: 0, right: 20)
        mainStackView.isLayoutMarginsRelativeArrangement = true
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        mainStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        mainStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
    }
    
    private func setupHubNameLabel() {
        
        hubNameLabel.translatesAutoresizingMaskIntoConstraints = false
        hubNameLabel.text = "მიშა ცაგარელის ჰაბი"
        hubNameLabel.font = UIFont.systemFont(ofSize: 24)
        hubNameLabel.textColor = hubNameLabelColor
        hubNameLabel.topAnchor.constraint(equalTo: hubNameLabel.topAnchor, constant: 70).isActive = true
        hubNameLabel.leadingAnchor.constraint(equalTo: hubNameLabel.leadingAnchor, constant: 20).isActive = true
        hubNameLabel.heightAnchor.constraint(equalToConstant: 34).isActive = true
        hubNameLabel.widthAnchor.constraint(equalToConstant: 230).isActive = true
        
        mainStackView.addArrangedSubview(hubNameLabel)
    }
    
    private func setupDescriptionAppLabel() {
        
        descriptionAppLAbel.text = "მოცემულ აპლიკაციაში შეგიძლიათ გაიგოთ თქვენი ზოდიაქოს ყველაზე გამოკვეთილი უნარები და თვისებები."
        descriptionAppLAbel.numberOfLines = 0
        descriptionAppLAbel.font = UIFont.systemFont(ofSize: 16)
        descriptionAppLAbel.textColor = descriptionAppLabelColor
        
        mainStackView.addArrangedSubview(descriptionAppLAbel)
    }
    
    private func setupZodiacNameLabel() {
        zodiacNameLabel.text = "ზოდიაქოს სახელი"
        zodiacNameLabel.textColor = zodiacNameLabelColor
        zodiacNameLabel.font = UIFont.systemFont(ofSize: 12)
        
        mainStackView.addArrangedSubview(zodiacNameLabel)
    }
    
    private func setupZodiacNameTextField() {
        zodiacNameTextField.attributedPlaceholder = NSAttributedString(
            string: "   მაგ: სასწორი",
            attributes: [NSAttributedString.Key.foregroundColor: zodiacNameTextFielPlaceholderdColor]
        )
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 50))
        
        zodiacNameTextField.leftView = paddingView
        zodiacNameTextField.leftViewMode = .always
        zodiacNameTextField.font = UIFont.systemFont(ofSize: 12)
        zodiacNameTextField.textColor = zodiacNameTextFieldColor
        zodiacNameTextField.layer.borderWidth = 1.5
        zodiacNameTextField.layer.cornerRadius = 5
        zodiacNameTextField.layer.borderColor = UIColor.white.cgColor
        zodiacNameTextField.heightAnchor.constraint(equalToConstant: 44).isActive = true
        zodiacNameTextField.delegate = self
        
        mainStackView.addArrangedSubview(zodiacNameTextField)
    }
    
    private func setupNextButton() {
        
        nextButton.setTitle("შემდეგ", for: .normal)
        nextButton.heightAnchor.constraint(equalToConstant: 46).isActive = true
        nextButton.backgroundColor = nextButtonColor
        nextButton.layer.cornerRadius = 12
        nextButton.addTarget(self, action: #selector(presentDescriptionVC), for: .touchUpInside)
        
        mainStackView.addArrangedSubview(nextButton)
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
    
    private func setupErrorLabel() {
        errorLabel.text = "შეიყვანეთ სწორი ზოდიაქოს ნიშანი"
        errorLabel.isHidden = true
        errorLabel.textColor = .red
        errorLabel.textAlignment = .center
        mainStackView.addArrangedSubview(errorLabel)
    }
    
    @objc private func presentDescriptionVC() {
        if let unwrappedZodiac = zodiacs.first(where: {$0.name == zodiacNameTextField.text } )
        {
            let vc = DescriptionVC(zodiac: unwrappedZodiac)
            self.navigationController?.pushViewController(vc, animated: false)
            vc.delegate = self
        } else {
            errorLabel.isHidden = false
        }
    }
}

//MARK: Extensions
extension MainVC: BackgroundDelegate {
    func changeButton(color: UIColor) {
        nextButton.backgroundColor = color
    }
}

extension MainVC: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        errorLabel.isHidden = true
    }
}

extension UIColor {
    convenience init(hexString: String) {
        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt64()
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }
}
