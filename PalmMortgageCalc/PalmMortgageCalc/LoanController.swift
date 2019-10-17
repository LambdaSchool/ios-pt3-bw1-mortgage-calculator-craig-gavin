//
//  LoanController.swift
//  PalmMortgageCalc
//
//  Created by Craig Swanson on 10/17/19.
//  Copyright © 2019 Gavin Murphy. All rights reserved.
//

import UIKit

class LoanController {
    
    // MARK: Properties
    var loan: Loan?
    var loanPayment: Double
    var interestPayment: Double
    
    init(loanPayment: Double, interestPayment: Double) {
        self.loanPayment = loanPayment
        self.interestPayment = interestPayment
    }
    
    
    // MARK: Methods
    // This function calculates the monthly payment amount for a loan
    func paymentAmount(_ loan: Loan?) -> Double {
        guard let loan = loan else { fatalError("paymentAmount called without a loan value") }
        let principal = loan.principal
        let timeFactor = pow((1 + (loan.rate / 12)), (loan.paymentsPerPeriod * loan.years))
        let discountFactor = (timeFactor - 1) / (timeFactor * (loan.rate / 12))
        
        return principal / discountFactor
    }
    
    // This function calculates the monthly interest payment included in the loan payment
    func interestAmountPaid(_ loan: Loan?) -> Double {
        guard let loan = loan else { fatalError("interestAmount called without a loan value") }
        let principal = loan.principal
        
        return principal * (loan.rate / (loan.paymentsPerPeriod))
    }
    
    // This function calculates the monthly principal payment included in the loan payment
    // If the user selects a value for additionalPrincipal, the function adds that as well
    func principalAmountPaid(_ loan: Loan?) -> Double {
        guard let loan = loan else { fatalError("principalAmountPaid called without a loan value") }
        let totalPayment = paymentAmount(loan)
        let interestAmount = interestAmountPaid(loan)
        
        if let additionalPrincipal = loan.additionalPrincipal {
        return totalPayment - interestAmount + additionalPrincipal
        } else {
            return totalPayment - interestAmount
        }
    }
    
}
