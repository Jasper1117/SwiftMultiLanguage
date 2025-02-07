//
//  SwitchLangVC.swift
//  SwiftMultiLanguage
//
//  Created by Jasper Hui on 6/2/2025.
//

import UIKit

var LocalizeUserDefaultKey = "LocalizeUserDefaultKey"
var LocalizDefaultLanguage = "en"

class SwitchLangVC: UIViewController {
    let switchEnButton = MLButton(backgroundColor: .systemMint, title: "en")
    let switchChButton = MLButton(backgroundColor: .systemMint, title: "中文")
    let switchLangLabel = MLLabel(textAlignment: .center, fontSize: 20, text: "message".translated())
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCTAButton()
        configureCTA2Button()
        configureLabel()
        LocalizDefaultLanguage = UserDefaults.standard.string(forKey: LocalizeUserDefaultKey) ?? LocalizDefaultLanguage
    }
    
    func configureLabel(){
        view.addSubview(switchLangLabel)
        
        NSLayoutConstraint.activate([
            switchLangLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            
            switchLangLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            switchLangLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            switchLangLabel.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func configureCTAButton(){
        view.addSubview(switchEnButton)
        switchEnButton.layer.name = "en"
        switchEnButton.addTarget(self, action: #selector(languageTapped(_:)), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            switchEnButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -100),
            switchEnButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            switchEnButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            switchEnButton.heightAnchor.constraint(equalToConstant: 50)
            
        ])
    }
    
    func configureCTA2Button(){
        view.addSubview(switchChButton)
        switchChButton.layer.name = "zh-HK"
        switchChButton.addTarget(self, action: #selector(languageTapped(_:)), for: .touchUpInside)
        NSLayoutConstraint.activate([
            switchChButton.topAnchor.constraint(equalTo: switchEnButton.bottomAnchor, constant: 20),
            switchChButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            switchChButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            switchChButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
}

extension SwitchLangVC{
    func refreshLocalizedLabels() {
        for subview in view.subviews {
            if let label = subview as? UILabel {
                label.text = label.text?.translated()
            }
            if let label = subview as? MLLabel {
                label.text = label.text?.translated()
            }
        }
        view.layoutIfNeeded()
    }
    
    @objc func languageTapped(_ sender: MLButton){
        LocalizDefaultLanguage = sender.layer.name ?? "en"
        UserDefaults.standard.set(LocalizDefaultLanguage, forKey: LocalizeUserDefaultKey)
        
        print("Current language is: \(UserDefaults.standard.string(forKey: LocalizeUserDefaultKey)!)")
        
        refreshLocalizedLabels()
    }
}

