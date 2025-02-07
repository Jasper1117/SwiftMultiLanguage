//
//  File.swift
//  SwiftMultiLanguage
//
//  Created by Jasper Hui on 7/2/2025.
//

import UIKit

class LanguageManager {

    static let shared = LanguageManager()

    private init() {}

    func setLanguage(_ languageCode: String) {
        // Set the AppleLanguages value in UserDefaults to switch the language
        UserDefaults.standard.setValue(languageCode, forKey: "AppleLanguages")
//        UserDefaults.standard.synchronize()

        // Post a notification to inform the app about the language change
//        NotificationCenter.default.post(name: NSNotification.Name("LanguageChanged"), object: nil)
    }

    func currentLanguage() -> String {
        return (UserDefaults.standard.object(forKey: "AppleLanguages") as? [String])?.first ?? "en"
    }
}
