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
    @IBOutlet weak var loanDownPayment: UITextField!
    @IBOutlet weak var loanAdditionalPayment: UITextField!
    

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
            let interestRate = loanInterestRateTextField.text,
            let loanDownPayment = loanDownPayment.text,
            let loanAdditionalPayment = loanAdditionalPayment.text else { return }
        guard let principal = Double(loanPrincipal),
            let term = Double(loanTerm),
            let rate = Double(interestRate),
            let downPayment = Double(loanDownPayment),
            let additionalPayment = Double(loanAdditionalPayment) else { return }
        
        
        // TODO: Need to pass the loanType to the loanLibrary
        let loan = Loan(principal: principal, years: term, rate: (rate / 100), downPayment: downPayment, paymentsPerPeriod: 12, additionalPrincipal: additionalPayment)
        
        delegate?.loanWasAdd(loan)
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
