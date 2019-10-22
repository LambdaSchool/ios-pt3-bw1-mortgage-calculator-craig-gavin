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
    let loanmodelcontroller = LoanModelController()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // MARK: Actions
    @IBAction func loanCalculatorButtonTapped(_ sender: UIButton) {
         func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "ShowCalculatorSegue" {
                guard let loanCalculatorVC = segue.destination as? LoanCalculatorViewController else { fatalError() }
                loanCalculatorVC.delegate = self
            }
        }
    }
    @IBAction func loanLibraryButtonTapped(_ sender: UIButton) {
    }

}

extension SelectionViewController: AddLoanDelegate {
    func loanWasAdded(_ loan: Loan) {
        loanmodelcontroller.loans.append(loan)
        
        
//        tableView.reloadData()
    }
    
}

