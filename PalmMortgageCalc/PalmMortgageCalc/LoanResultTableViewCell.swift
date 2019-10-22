//
//  LoanResultTableViewCell.swift
//  PalmMortgageCalc
//
//  Created by Craig Swanson on 10/18/19.
//  Copyright © 2019 Gavin Murphy. All rights reserved.
//

import UIKit

class LoanResultTableViewCell: UITableViewCell {
    
    // MARK: Properties
    // Initialized an instance of LoanController in order to calculate the total interest paid.
    let loancontroller = LoanController()
    var loan: Loan? {
        didSet {
            updateViews()
        }
    }
    
    // MARK: Outlets
    @IBOutlet weak var loanTypeLabel: UILabel!
    @IBOutlet weak var totalInterestPaid: UILabel!
    

    // MARK: Methods
    // CurrencyFormatter will take in a Double, convert it to an NSNumber and return a string, formatted in US Dollars
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
        guard let loan = loan
            else { return }
        let totalInterest = loancontroller.lifeOfLoanAmounts(loan).totalInterest
        let formattedInterest = currencyFormatter(totalInterest)
        loanTypeLabel.text = loan.type
        totalInterestPaid.text = "Total Interest Paid:  \(formattedInterest)"
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
