//
//  LoanResultTableViewCell.swift
//  PalmMortgageCalc
//
//  Created by Craig Swanson on 10/18/19.
//  Copyright © 2019 Gavin Murphy. All rights reserved.
//

import UIKit

class LoanResultTableViewCell: UITableViewCell {
    @IBOutlet weak var loanTypeLabel: UILabel!
    @IBOutlet weak var totalInterestPaid: UILabel!
    
    let loancontroller = LoanController()
    func currencyFormatter(_ number: Double) -> String {
    let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
        formatter.locale = Locale.current
        let newNumber = NSNumber(value: number)
        guard let formattedCurrencyString = formatter.string(from: newNumber) else { fatalError("Error converting number to string") }
        return formattedCurrencyString
    }
    var loan: Loan? {
        didSet {
            updateViews()
        }
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
