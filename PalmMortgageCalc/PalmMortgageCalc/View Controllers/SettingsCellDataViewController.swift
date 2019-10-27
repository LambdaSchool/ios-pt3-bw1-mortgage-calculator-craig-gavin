//
//  SettingsCellDataViewController.swift
//  PalmMortgageCalc
//
//  Created by Craig Swanson on 10/25/19.
//  Copyright © 2019 Gavin Murphy. All rights reserved.
//

import UIKit

protocol UpdateCellFields {
    func updateFields()
}

class SettingsCellDataViewController: UIViewController {
    
    var menuLoaction: String?
    var delegate: UpdateCellFields?
    var cellSettingsHelper: CellSettingsHelper?

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // MARK: Actions
    @IBAction func selectDataToAdditionalPayment(_ sender: UIButton) {
        guard let menuLocation = menuLoaction,
            let cellSettingsHelper = cellSettingsHelper else { return }
        cellSettingsHelper.cellLocationPreferenceKey = menuLocation
        cellSettingsHelper.setDataToAdditionalPayment()
        delegate?.updateFields()
        dismiss(animated: true, completion: nil)
    }
    @IBAction func selectDataToDownPayment(_ sender: UIButton) {
            guard let menuLocation = menuLoaction,
                let cellSettingsHelper = cellSettingsHelper else { return }
        cellSettingsHelper.cellLocationPreferenceKey = menuLocation
        cellSettingsHelper.setDataToDownPayment()
              dismiss(animated: true, completion: nil)
    }
    @IBAction func selectDataToInterestRate(_ sender: UIButton) {
            guard let menuLocation = menuLoaction,
                let cellSettingsHelper = cellSettingsHelper else { return }
        cellSettingsHelper.cellLocationPreferenceKey = menuLocation
        cellSettingsHelper.setDataToInterestRate()
                dismiss(animated: true, completion: nil)
    }
    @IBAction func selectDataToLoanTerm(_ sender: UIButton) {
            guard let menuLocation = menuLoaction,
                let cellSettingsHelper = cellSettingsHelper else { return }
        cellSettingsHelper.cellLocationPreferenceKey = menuLocation
        cellSettingsHelper.setDataToLoanTerm()
                dismiss(animated: true, completion: nil)
    }
    @IBAction func selectDataToMonthlyPayment(_ sender: UIButton) {
            guard let menuLocation = menuLoaction,
                let cellSettingsHelper = cellSettingsHelper else { return }
        cellSettingsHelper.cellLocationPreferenceKey = menuLocation
        cellSettingsHelper.setDataToMonthlyPayment()
               dismiss(animated: true, completion: nil)
    }
    @IBAction func selectDataToPrincipal(_ sender: UIButton) {
            guard let menuLocation = menuLoaction,
                let cellSettingsHelper = cellSettingsHelper else { return }
        cellSettingsHelper.cellLocationPreferenceKey = menuLocation
        cellSettingsHelper.setDataToPrincipal()
               dismiss(animated: true, completion: nil)
    }
    @IBAction func selectDataToTotalInterest(_ sender: UIButton) {
            guard let menuLocation = menuLoaction,
                let cellSettingsHelper = cellSettingsHelper else { return }
        cellSettingsHelper.cellLocationPreferenceKey = menuLocation
        cellSettingsHelper.setDataToTotalInterest()
               dismiss(animated: true, completion: nil)
    }
    @IBAction func selectDataToTotalCost(_ sender: UIButton) {
            guard let menuLocation = menuLoaction,
                let cellSettingsHelper = cellSettingsHelper else { return }
        cellSettingsHelper.cellLocationPreferenceKey = menuLocation
        cellSettingsHelper.setDataToTotalCost()
               dismiss(animated: true, completion: nil)
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
