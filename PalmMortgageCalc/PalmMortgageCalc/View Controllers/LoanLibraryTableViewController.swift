//
//  LoanLibraryTableViewController.swift
//  PalmMortgageCalc
//
//  Created by Craig Swanson on 10/18/19.
//  Copyright © 2019 Gavin Murphy. All rights reserved.
//

import UIKit

class LoanLibraryTableViewController: UITableViewController {

    var loanmodelcontroller: LoanModelController?
    let loancontroller = LoanController()
    var cellSettingsHelper: CellSettingsHelper?
    
    var persistentStoreURL: URL! {
        if let documentURL = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true) {
            let persistentStoreURL = documentURL.appendingPathComponent("palmMortgage.plist")
            return persistentStoreURL
        }
        return nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.reloadData()
        
        guard let loanmodelcontroller = loanmodelcontroller else { return }
        if let data = try? Data(contentsOf: persistentStoreURL),
            let savedLoans = try? PropertyListDecoder().decode([Loan].self, from: data) {
            loanmodelcontroller.loans = savedLoans
        }
    }
    
    func save () {
        guard let loanmodelcontroller = loanmodelcontroller else { return }
        if let data = try? PropertyListEncoder().encode(loanmodelcontroller.loans) {
            try? data.write(to: persistentStoreURL)
        }
    }
      

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let loanmodelcontroller = loanmodelcontroller else { return 0 }
        // #warning Incomplete implementation, return the number of rows
        return  loanmodelcontroller.loans.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "LoanCell", for: indexPath) as? LoanResultTableViewCell else { return UITableViewCell() }

        guard let loanmodelcontroller = loanmodelcontroller else { return UITableViewCell() }
        let loan = loanmodelcontroller.loans[indexPath.row]
        cell.loan = loan
//        loanTypeLabel.text = loan.type
        cell.totalInterestPaidLabel.text = cell.lowerLeftLabelSetter(loan)
        cell.totalInterestPaidLabel.text = cell.upperRightLabelSetter(loan)
        cell.totalAmountPaidLabel.text = cell.lowerRightLabelSetter(loan)
        
        // The following block alternates the colors of the cells in the table view
        if (indexPath.row % 2) == 0 {
            cell.backgroundColor = UIColor.lightGray
        }
        else{
            cell.backgroundColor = UIColor.white
        }
        
        return cell
    }
    
    // The following two methods implement the swipe to delete ability in the table view
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        loanmodelcontroller?.loans.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .automatic)
        
        tableView.reloadData()
        
        save()
    }

    // MARK: - Navigation
    
    // The prepare for segue passes the loanmodelcontroller to both view controllers and declares itself a delegate for the loan library view controller
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "ModifyLoanFromLibrarySegue":
                guard let loanCalculatorVC = segue.destination as? LoanCalculatorViewController else { fatalError() }
                loanCalculatorVC.delegate = self
                loanCalculatorVC.loanmodelcontroller = loanmodelcontroller
        case "ShowLoanDetailSegue":
            guard let loanDetailVC = segue.destination as? LoanDetailViewController,
                let loanmodelcontroller = loanmodelcontroller,
                let indexPath = tableView.indexPathForSelectedRow else { fatalError() }
            loanDetailVC.loan = loanmodelcontroller.loans[indexPath.row]
        default:
            return
        }
    }
}



// The delegate takes a loan from the calculator and appends it to the loans array.  It then reloads the table view and dismisses the calculator
extension LoanLibraryTableViewController: AddLoanDelegate {
    func loanWasAdded(_ loan: Loan) {
        loanmodelcontroller?.loans.append(loan)
        tableView.reloadData()
        dismiss(animated: true, completion: nil)
        
        save()
    }
}

extension LoanLibraryTableViewController: UpdateCellFields {
    func updateFields() {
        tableView.reloadData()
    }
}
