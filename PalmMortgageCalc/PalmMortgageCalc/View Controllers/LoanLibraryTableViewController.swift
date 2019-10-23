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
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
        switch segue.identifier {
        case "ModifyLoanFromLibrarySegue":
                guard let loanCalculatorVC = segue.destination as? LoanCalculatorViewController else { fatalError() }
                loanCalculatorVC.delegate = self
        case "ShowLoanDetailSegue":
            guard let loanDetailVC = segue.destination as? LoanDetailViewController,
                let loanmodelcontroller = loanmodelcontroller,
                let indexPath = tableView.indexPathForSelectedRow else { fatalError() }
            loanDetailVC.loan = loanmodelcontroller.loans[indexPath.row]
            print(loanmodelcontroller.loans[indexPath.row])
        default:
            return
        }
    }
}

extension LoanLibraryTableViewController: AddLoanDelegate {
    func loanWasAdded(_ loan: Loan) {
        loanmodelcontroller?.loans.append(loan)
        tableView.reloadData()
        
        dismiss(animated: true, completion: nil)
    }
    
}
