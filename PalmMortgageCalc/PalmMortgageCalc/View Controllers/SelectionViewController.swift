//
//  SelectionViewController.swift
//  PalmMortgageCalc
//
//  Created by Gavin Murphy on 10/16/19.
//  Copyright © 2019 Gavin Murphy. All rights reserved.
//

import UIKit

class SelectionViewController: UIViewController {
    
    // MARK: Properties
    let loanModelController = LoanModelController()
    var cellSettingsHelper = CellSettingsHelper()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func save() {
        guard let loanLibrary = LoanLibraryTableViewController() as? LoanLibraryTableViewController else { return }
        if let data = try? PropertyListEncoder().encode(loanModelController.loans) {
            try? data.write(to: loanLibrary.persistentStoreURL)
        }
    }
    
    // MARK: Actions
    // The buttons are linked to their respective view controllers via segues.
    @IBAction func loanCalculatorButtonTapped(_ sender: UIButton) {
    }
    @IBAction func loanLibraryButtonTapped(_ sender: UIButton) {
    }
    
    // The prepare for segue passes the loanmodelcontroller to both views and also declares itself a delegate for the calculator view controller.
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "ShowCalculatorSegue":
            guard let loanCalculatorVC = segue.destination as? LoanCalculatorViewController else { fatalError() }
            loanCalculatorVC.delegate = LoanLibraryTableViewController()
            loanCalculatorVC.loanmodelcontroller = loanModelController
        case "ShowLibrarySegue":
            guard let loanLibraryVC = segue.destination as? LoanLibraryTableViewController else { fatalError() }
            loanLibraryVC.loanmodelcontroller = loanModelController
            loanLibraryVC.cellSettingsHelper = cellSettingsHelper
        default:
            guard let showSettingsVC = segue.destination as? SettingsViewController else { fatalError() }
            showSettingsVC.cellSettingsHelper = cellSettingsHelper
        }
    }

}

// The SelectionVCDelegate takes a loan created in the calculator and appends it to the loans array and then immediately segues to the loan library


