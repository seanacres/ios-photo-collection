//
//  ThemeHelper.swift
//  PhotoCollection
//
//  Created by Sean Acres on 6/13/19.
//  Copyright © 2019 Sean Acres. All rights reserved.
//

import Foundation

class ThemeHelper {
    let themePreferenceKey: String = "themePreference"
    
    var themePreference: String? {
        let userDefaults = UserDefaults.standard
        guard let theme = userDefaults.value(forKey: themePreferenceKey) else { return nil }
        let themeString = "\(theme)"
        return themeString
    }
    
    init() {
        if themePreference == nil {
            setThemePreferenceToDark()
        }
    }
    
    func setThemePreferenceToDark() {
        let userDefaults = UserDefaults.standard
        userDefaults.set("Dark", forKey: themePreferenceKey)
        
    }
    
    func setThemePreferenceToBlue() {
        let userDefaults = UserDefaults.standard
        userDefaults.set("Blue", forKey: themePreferenceKey)
    }
}
