//
//  LoanCalculatorViewController.swift
//  PalmMortgageCalc
//
//  Created by Craig Swanson on 10/18/19.
//  Copyright © 2019 Gavin Murphy. All rights reserved.
//

import UIKit

protocol AddLoanDelegate {
    func loanWasAdded(_ loan: Loan)
}
protocol SelectionVCDelegate {
    func loanWasAdded(_ loan: Loan)
}

class LoanCalculatorViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: Properties
    var delegate: AddLoanDelegate?
    var delegateSelectionVC: SelectionVCDelegate?
    var loanmodelcontroller: LoanModelController?
    var loan: Loan?
    
    
    // MARK: Outlets
    @IBOutlet weak var loanTypeTextField: UITextField!
    @IBOutlet weak var loanPrincipalTextField: UITextField!
    @IBOutlet weak var loanTermTextField: UITextField!
    @IBOutlet weak var loanInterestRateTextField: UITextField!
    @IBOutlet weak var loanDownPaymentTextField: UITextField!
    @IBOutlet weak var loanAdditionalPaymentTextField: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
    }
    
    
    // MARK: Actions
    @IBAction func cancelButtonTapped(_ sender: UIBarButtonItem) {
      dismiss(animated: true, completion: nil)
    }
    
    // I don't know a better way to do this. I did guards to see if the text fields had user input and then I converted the numbers to Doubles.
    @IBAction func saveButtonTapped(_ sender: UIBarButtonItem) {
        guard let loanType = loanTypeTextField.text,
            let loanPrincipal = loanPrincipalTextField.text,
            let loanTerm = loanTermTextField.text,
            let interestRate = loanInterestRateTextField.text,
            let loanDownPayment = loanDownPaymentTextField.text,
            let loanAdditionalPayment = loanAdditionalPaymentTextField.text else { return }
        guard let principal = Double(loanPrincipal),
            let term = Double(loanTerm),
            let rate = Double(interestRate),
            let downPayment = Double(loanDownPayment),
            let additionalPayment = Double(loanAdditionalPayment) else { return }
        
        let loan = Loan(type: loanType, principal: principal, years: term, rate: (rate / 100), downPayment: downPayment, paymentsPerPeriod: 12, additionalPrincipal: additionalPayment)
        
        delegate?.loanWasAdded(loan)
        delegateSelectionVC?.loanWasAdded(loan)

    }
}
