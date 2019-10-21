//
//  LoanCalculatorViewController.swift
//  PalmMortgageCalc
//
//  Created by Craig Swanson on 10/18/19.
//  Copyright © 2019 Gavin Murphy. All rights reserved.
//

import UIKit

protocol AddLoanDelegate {
    func loanWasAdd(_ loan: Loan)
}

class LoanCalculatorViewController: UIViewController {
    
    // MARK: Properties
    var delegate: AddLoanDelegate?
    
    
    // MARK: Outlets
    @IBOutlet weak var loanTypeTextField: UITextField!
    @IBOutlet weak var loanPrincipalTextField: UITextField!
    @IBOutlet weak var loanTermTextField: UITextField!
    @IBOutlet weak var loanInterestRateTextField: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // MARK: Actions
    @IBAction func cancelButtonTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func saveButtonTapped(_ sender: UIBarButtonItem) {
        guard let loanType = loanTypeTextField.text,
            let loanPrincipal = loanPrincipalTextField.text,
            let loanTerm = loanTermTextField.text,
            let interestRate = loanInterestRateTextField.text else { return }
        guard let principal = Double(loanPrincipal),
            let term = Double(loanTerm),
            let rate = Double(interestRate) else { return }
        
        // TODO: hard coded in downPayment, paymentsPerPeriod, and additionalPrincipal.  Need to fix that
        var loan = Loan(principal: principal, years: term, rate: rate, downPayment: 0, paymentsPerPeriod: 12, additionalPrincipal: 0)
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
