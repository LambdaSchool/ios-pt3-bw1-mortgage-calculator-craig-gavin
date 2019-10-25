//
//  CellSettingsHelper.swift
//  PalmMortgageCalc
//
//  Created by Craig Swanson on 10/25/19.
//  Copyright © 2019 Gavin Murphy. All rights reserved.
//

import Foundation

class CellSettingsHelper {
    let themePreferenceKey: String = "SetThemePreference"
    var themePreference: String? {
        let userDefaults = UserDefaults.standard
        return userDefaults.string(forKey: themePreferenceKey)
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
    
    func setThemePreferenceToGreen() {
        let userDefaults = UserDefaults.standard
        userDefaults.set("Green", forKey: themePreferenceKey)
    }
}
