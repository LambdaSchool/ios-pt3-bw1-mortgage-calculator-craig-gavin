//
//  SettingsViewController.swift
//  PalmMortgageCalc
//
//  Created by Craig Swanson on 10/25/19.
//  Copyright © 2019 Gavin Murphy. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    var cellSettingsHelper: CellSettingsHelper?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "LowerLeftSegue":
                guard let settingsCellDataVC = segue.destination as? SettingsCellDataViewController else { fatalError() }
                settingsCellDataVC.cellSettingsHelper = cellSettingsHelper
                settingsCellDataVC.menuLoaction = "lowerLeft"
                settingsCellDataVC.delegate = LoanResultTableViewCell()
        case "UpperRightSegue":
            guard let settingsCellDataVC = segue.destination as? SettingsCellDataViewController else { fatalError() }
            settingsCellDataVC.cellSettingsHelper = cellSettingsHelper
            settingsCellDataVC.menuLoaction = "upperRight"
            settingsCellDataVC.delegate = LoanResultTableViewCell()
        case "LowerRightSegue":
            guard let settingsCellDataVC = segue.destination as? SettingsCellDataViewController else { fatalError() }
            settingsCellDataVC.cellSettingsHelper = cellSettingsHelper
            settingsCellDataVC.menuLoaction = "lowerRight"
            settingsCellDataVC.delegate = LoanResultTableViewCell()
        default:
            return
        }
    }

}

// TODO:  need to somehow delegate (verb) from the settingscelldataVC to run the update function in the tableviewcell.
