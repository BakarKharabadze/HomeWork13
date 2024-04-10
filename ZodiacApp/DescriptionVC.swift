//
//  DescriptionVC.swift
//  ZodiacApp
//
//  Created by Bakar Kharabadze on 4/10/24.
//

import UIKit

class DescriptionVC: UIViewController {
    
    //MARK: Properties
    private let mainStackView = UIStackView()
    private let imageView = UIImageView()
    private let iconZodiac = UIImageView()
    private let zodiacNameLabel = UILabel()
    private let zodiacDescriptionTextView = UITextView()
    private let polarSignButton = UIButton()
    weak var delegate: BackgroundDelegate?
    private var zodiac: Zodiac
    
    init(zodiac: Zodiac) {
        self.zodiac = zodiac
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("error")
    }
    
    private let zodiacNameLabelColor = UIColor(hexString: "#FFFFFF")
    private let zodiacDescriptionTextViewColor = UIColor(hexString: "#8B8B8B")
    private let polarSignButtonColor = UIColor(hexString: "#5000B6")
    
    //MARK: life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    //MARK: Set up Methods
    private func setup() {
        setupImageView()
        setupMainStackView()
        setupMainStackViewsCustomSpacings()
        setupIconZodiac()
        setupZodiacNameLabel()
        setupZodiacDescriptionTextView()
        setupPolarSignButton()
        setMethod()
        
    }
    
    private func setupMainStackViewsCustomSpacings() {
        mainStackView.setCustomSpacing(0, after: imageView)
        mainStackView.setCustomSpacing(30, after: zodiacNameLabel)
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
        mainStackView.layoutMargins = UIEdgeInsets(top: 30, left: 20, bottom: 0, right: 20)
        mainStackView.isLayoutMarginsRelativeArrangement = true
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        mainStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        mainStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
    }
    
    private func setupIconZodiac() {
        iconZodiac.translatesAutoresizingMaskIntoConstraints = false
        iconZodiac.image = UIImage(named: "სასწორი")
        iconZodiac.contentMode = .scaleAspectFit
        iconZodiac.heightAnchor.constraint(equalToConstant: 108).isActive = true
        iconZodiac.widthAnchor.constraint(equalToConstant: 118).isActive = true
        
        mainStackView.addArrangedSubview(iconZodiac)
    }
    
    private func setupZodiacNameLabel() {
        zodiacNameLabel.text = "სასწორი"
        zodiacNameLabel.font = UIFont.systemFont(ofSize: 24)
        zodiacNameLabel.textColor = zodiacNameLabelColor
        zodiacNameLabel.textAlignment = .center
        mainStackView.addArrangedSubview(zodiacNameLabel)
    }
    
    private func setupZodiacDescriptionTextView() {
        zodiacDescriptionTextView.text = "სასწორის ზოდიაქოს ნიშნით დაბადებული ადამიანები, პლანეტა ვენერას გავლენის ქვეშ იმყოფებიან, რაც მათ ხასიათში თანდაყოლილ დიპლომატიის უანრს, ჰარმონიის და სილამაზის სიყვარულს განაპირობებს. სასწორების უმრავლესობა, როგორც გარეგნობით ისე ხასიათით, სასიამოვნო და კომუნიკაბელური ხალხია. ორივე სქესის სასწორებს, ძალიან უყვართ კამათი, შესაბამისად მათთვის უცხო არ არის სხვადასხვა სახის დისკუსიებსა და პოლემიკებში მონაწილეობის მიღების სიყვარული."
        zodiacDescriptionTextView.font = UIFont.systemFont(ofSize: 14)
        zodiacDescriptionTextView.textColor = zodiacDescriptionTextViewColor
        zodiacDescriptionTextView.isScrollEnabled = false
        zodiacDescriptionTextView.backgroundColor = .clear
        
        mainStackView.addArrangedSubview(zodiacDescriptionTextView)
    }
    
    private func setupPolarSignButton() {
        view.addSubview(polarSignButton)
        
        polarSignButton.translatesAutoresizingMaskIntoConstraints = false
        polarSignButton.backgroundColor = polarSignButtonColor
        polarSignButton.setTitle("პოლარული ნიშანი", for: .normal)
        polarSignButton.heightAnchor.constraint(equalToConstant: 46).isActive = true
        polarSignButton.layer.cornerRadius = 10
        polarSignButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30).isActive = true
        polarSignButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        polarSignButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        polarSignButton.addTarget(self, action: #selector(presentOppositeSignVC), for: .touchUpInside)
}
    
    private func setMethod() {
        
        zodiacNameLabel.text = zodiac.name
        zodiacDescriptionTextView.text = zodiac.description
        iconZodiac.image = UIImage(named: zodiac.imageName)
    }
    
    
    @objc func presentOppositeSignVC() {
        if let unwrappedZodiac = zodiacs.first(where: {$0.polarSign == zodiac.polarSign } )
        {
            let vc = OppositeSignVC(zodiac: zodiac)
            self.navigationController?.pushViewController(vc, animated: false)
            vc.delegate = delegate        }
    }
}



