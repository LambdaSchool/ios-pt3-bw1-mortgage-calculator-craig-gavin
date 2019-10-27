//
//  CellSettingsHelper.swift
//  PalmMortgageCalc
//
//  Created by Craig Swanson on 10/25/19.
//  Copyright © 2019 Gavin Murphy. All rights reserved.
//

import Foundation

class CellSettingsHelper {
    let lowerLeftPreferenceKey: String = "lowerLeft"
    var lowerLeftPreference: String? {
        let userDefaults = UserDefaults.standard
        return userDefaults.string(forKey: lowerLeftPreferenceKey)
    }
    let upperRightPreferenceKey: String = "upperRight"
    var upperRightPreference: String? {
        let userDefaults = UserDefaults.standard
        return userDefaults.string(forKey: upperRightPreferenceKey)
    }
    let lowerRightPreferenceKey: String = "lowerRight"
    var lowerRightPreference: String? {
        let userDefaults = UserDefaults.standard
        return userDefaults.string(forKey: lowerRightPreferenceKey)
    }
    
    var cellLocationPreferenceKey: String?
    var cellLocationPreference: String? {
        let userDefaults = UserDefaults.standard
        return userDefaults.string(forKey: cellLocationPreferenceKey!)
    }
    
    init() {
        if lowerLeftPreference == nil {
            cellLocationPreferenceKey = "lowerLeft"
            setDataToTotalInterest()
        }
        if upperRightPreference == nil {
            cellLocationPreferenceKey = "upperRight"
            setDataToPrincipal()
        }
        if lowerRightPreference == nil {
            cellLocationPreferenceKey = "lowerRight"
            setDataToTotalCost()
        }
    }
    
    func setDataToTotalInterest() {
        guard let cellLocationPreferenceKey = cellLocationPreferenceKey else { return }
        let userDefaults = UserDefaults.standard
        userDefaults.set("totalInterest", forKey: cellLocationPreferenceKey)
    }
    
    func setDataToDownPayment() {
        guard let cellLocationPreferenceKey = cellLocationPreferenceKey else { return }
        let userDefaults = UserDefaults.standard
        userDefaults.set("downPayment", forKey: cellLocationPreferenceKey)
    }
    
    func setDataToInterestRate() {
        guard let cellLocationPreferenceKey = cellLocationPreferenceKey else { return }
        let userDefaults = UserDefaults.standard
        userDefaults.set("interestRate", forKey: cellLocationPreferenceKey)
    }
    
    func setDataToAdditionalPayment() {
        guard let cellLocationPreferenceKey = cellLocationPreferenceKey else { return }
        let userDefaults = UserDefaults.standard
        userDefaults.set("additionalPayment", forKey: cellLocationPreferenceKey)
    }
    
    func setDataToLoanTerm() {
        guard let cellLocationPreferenceKey = cellLocationPreferenceKey else { return }
        let userDefaults = UserDefaults.standard
        userDefaults.set("loanTerm", forKey: cellLocationPreferenceKey)
    }
    
    func setDataToMonthlyPayment() {
        guard let cellLocationPreferenceKey = cellLocationPreferenceKey else { return }
        let userDefaults = UserDefaults.standard
        userDefaults.set("monthlyPayment", forKey: cellLocationPreferenceKey)
    }
    
    func setDataToPrincipal() {
        guard let cellLocationPreferenceKey = cellLocationPreferenceKey else { return }
        let userDefaults = UserDefaults.standard
        userDefaults.set("initialPrincipal", forKey: cellLocationPreferenceKey)
    }
    
    func setDataToTotalCost() {
        guard let cellLocationPreferenceKey = cellLocationPreferenceKey else { return }
        let userDefaults = UserDefaults.standard
        userDefaults.set("totalPaid", forKey: cellLocationPreferenceKey)
    }
}
