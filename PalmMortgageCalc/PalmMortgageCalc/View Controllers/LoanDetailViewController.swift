//
//  LoanDetailViewController.swift
//  PalmMortgageCalc
//
//  Created by Gavin Murphy on 10/19/19.
//  Copyright © 2019 Gavin Murphy. All rights reserved.
//

import UIKit

class LoanDetailViewController: UIViewController {
    
    var loanController: LoanController = LoanController()
    
    // MARK: Outlets
    
    @IBOutlet weak var loanNameDetails: UILabel!
    @IBOutlet weak var loanPrincipalLabel: UILabel!
    @IBOutlet weak var downPaymentLabel: UILabel!
    @IBOutlet weak var loanStartingPrincipal: UILabel!
    @IBOutlet weak var loanTermLabel: UILabel!
    @IBOutlet weak var loanInterestRateLabel: UILabel!
    @IBOutlet weak var additionalPaymentLabel: UILabel!
    @IBOutlet weak var loanMonthlyPaymentLabel: UILabel!
    @IBOutlet weak var loanTotalInterestLabel: UILabel!
    @IBOutlet weak var totalAmountPaidLabel: UILabel!
    
    var loan: Loan? {
        didSet {
            updateViews()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateViews()
    }
    
    // The following method is called for the loan values that are in currency format
    func currencyFormatter(_ number: Double) -> String {
       let formatter = NumberFormatter()
           formatter.usesGroupingSeparator = true
           formatter.numberStyle = .currency
           formatter.locale = Locale.current
       let newNumber = NSNumber(value: number)
       guard let formattedCurrencyString = formatter.string(from: newNumber) else { fatalError("Error converting number to string") }
       return formattedCurrencyString
       }

    // updateViews() sets the value of each label to the appropriate value of the loan.
    private func updateViews() {
        guard let loan = loan,
                  isViewLoaded else { return }
        loanNameDetails.text = String("\(loan.type) Details")
        loanPrincipalLabel.text = currencyFormatter(loan.principal)
        loanStartingPrincipal.text = currencyFormatter(loan.principal - loan.downPayment)
        loanTermLabel.text = String("\(loan.years) years")
        loanInterestRateLabel.text = String(format: "%.2f%%", loan.rate*100)
        downPaymentLabel.text = currencyFormatter(loan.downPayment)
        additionalPaymentLabel.text = currencyFormatter(loan.additionalPrincipal)
        loanMonthlyPaymentLabel.text = currencyFormatter(loanController.paymentAmount(loan))
        loanTotalInterestLabel.text = currencyFormatter(loanController.lifeOfLoanAmounts(loan).totalInterest)
        totalAmountPaidLabel.text = currencyFormatter(loan.principal + loanController.lifeOfLoanAmounts(loan).totalInterest)
    }
    
}
