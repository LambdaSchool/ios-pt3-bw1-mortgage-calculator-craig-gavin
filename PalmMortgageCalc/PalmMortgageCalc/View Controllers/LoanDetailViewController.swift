//
//  LoanDetailViewController.swift
//  PalmMortgageCalc
//
//  Created by Gavin Murphy on 10/19/19.
//  Copyright © 2019 Gavin Murphy. All rights reserved.
//

import UIKit

class LoanDetailViewController: UIViewController {
    
    //var loanController: LoanController = LoanController()
    
    // MARK: Outlets
    
    @IBOutlet weak var loanPrincipalLabel: UILabel!
    @IBOutlet weak var loanTermLabel: UILabel!
    @IBOutlet weak var loanInterestRateLabel: UILabel!
    @IBOutlet weak var downPaymentLabel: UILabel!
    @IBOutlet weak var additionalPaymentLabel: UILabel!
    
    var loan: Loan? {
        didSet {
            updateViews()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func currencyFormatter(_ number: Double) -> String {
       let formatter = NumberFormatter()
           formatter.usesGroupingSeparator = true
           formatter.numberStyle = .currency
           formatter.locale = Locale.current
       let newNumber = NSNumber(value: number)
       guard let formattedCurrencyString = formatter.string(from: newNumber) else { fatalError("Error converting number to string") }
       return formattedCurrencyString
       }

    
    private func updateViews() {
        guard let loan = loan else { return } // not sure if this is right guard let
        loanTermLabel.text = String("\(loan.years)")
        loanPrincipalLabel.text = currencyFormatter(loan.principal)
    }
    
}
