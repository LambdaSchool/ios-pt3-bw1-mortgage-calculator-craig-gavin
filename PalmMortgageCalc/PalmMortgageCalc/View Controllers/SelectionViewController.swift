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

    }
    @IBAction func loanLibraryButtonTapped(_ sender: UIButton) {
    }
    
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "ShowCalculatorSegue":
            guard let loanCalculatorVC = segue.destination as? LoanCalculatorViewController else { fatalError() }
            loanCalculatorVC.delegateSelectionVC = self
            loanCalculatorVC.loanmodelcontroller = loanmodelcontroller
        case "ShowLibrarySegue":
            guard let loanLibraryVC = segue.destination as? LoanLibraryTableViewController else { fatalError() }
            
            loanLibraryVC.loanmodelcontroller = loanmodelcontroller
        default:
            return
        }
    }

}

extension SelectionViewController: SelectionVCDelegate {
    func loanWasAdded(_ loan: Loan) {
        loanmodelcontroller.loans.append(loan)
        print(loanmodelcontroller.loans.count)
        
        dismiss(animated: true, completion: nil)
        
        performSegue(withIdentifier: "ShowLibrarySegue", sender: self)
//        self.navigationController?.popViewController(animated: true)
        
        
//        tableView.reloadData()
    }
    
}

