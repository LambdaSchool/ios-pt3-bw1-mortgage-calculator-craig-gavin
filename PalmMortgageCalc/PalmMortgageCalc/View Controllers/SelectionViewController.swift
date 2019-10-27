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

    // Set up URL and file for persistence
    var persistentStoreURL: URL! {
        if let documentURL = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true) {
            let persistentStoreURL = documentURL.appendingPathComponent("palmMortgage.plist")
            return persistentStoreURL
        }
        return nil
    }
    
    // MARK: Outlets
    @IBOutlet weak var loanCalcButton: UIButton!
    @IBOutlet weak var loanLibraryButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Decode for persistence.
        let loanmodelcontroller = loanModelController
        if let data = try? Data(contentsOf: persistentStoreURL),
            let savedLoans = try? PropertyListDecoder().decode([Loan].self, from: data) {
            loanmodelcontroller.loans = savedLoans
        }
        
        // Round the corners of the buttons
        loanCalcButton.layer.cornerRadius = 17
        loanLibraryButton.layer.cornerRadius = 17
    }
    
    // Function to encode for persistence
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
            loanCalculatorVC.loanmodelcontroller = loanModelController
            loanCalculatorVC.delegateSelectionVC = self
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

extension SelectionViewController: SelectionVCDelegate {
    func loanWasAdded(_ loan: Loan) {
        loanModelController.loans.append(loan)
        dismiss(animated: true, completion: nil)
        performSegue(withIdentifier: "ShowLibrarySegue", sender: self)
        
        save()
    }
}

