//
//  LoanLibraryTableViewController.swift
//  PalmMortgageCalc
//
//  Created by Craig Swanson on 10/18/19.
//  Copyright © 2019 Gavin Murphy. All rights reserved.
//

import UIKit

class LoanLibraryTableViewController: UITableViewController {

    var loans: [Loan] = []
    let loancontroller = LoanController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    // Trying to get the scene to go from the Calculator to the Library; but when arriving at the Calculator via the start scene, it doesn't work.  Tried to implement an unwind segue but I can't seem to get that to work properly either.
    @IBAction func unwindToLoanLibraryVC(_ unwindSegue: UIStoryboardSegue) {}
    @IBAction func unwindFromLoanCalcVC(_ sender: UIStoryboardSegue) {
        
        if sender.source is LoanCalculatorViewController {
            if let senderVC = sender.source as? LoanCalculatorViewController {
                guard let loan = senderVC.loan else { return }
                loans.append(loan)
            }
            tableView.reloadData()
        }
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return loans.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "LoanCell", for: indexPath) as? LoanResultTableViewCell else { return UITableViewCell() }

        let loan = loans[indexPath.row]
        cell.loan = loan
        
        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */


    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ModifyLoanFromLibrarySegue" {
            guard let loanCalculatorVC = segue.destination as? LoanCalculatorViewController else { fatalError() }
            loanCalculatorVC.delegate = self
        }
    }

}

extension LoanLibraryTableViewController: AddLoanDelegate {
    func loanWasAdded(_ loan: Loan) {
        loans.append(loan)
        tableView.reloadData()
    }
    
}
