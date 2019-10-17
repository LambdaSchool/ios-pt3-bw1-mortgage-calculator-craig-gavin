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
    // This function takes in a Loan and calculates the monthly payment amount for a loan, returning a Double
    // The equation is: Payment = Principal / DiscountFactor
    // DiscountFactor is ((1 + i)^n - 1) / (i * (1 + i)^n)  where i = interest rate / 12, n = years * paymentsPerYear
    func paymentAmount(_ loan: Loan?) -> Double {
        guard let loan = loan else { fatalError("paymentAmount called without a loan value") }
        let principal = loan.principal
        let timeFactor = pow((1 + (loan.rate / 12)), (loan.paymentsPerPeriod * loan.years))
        let discountFactor = (timeFactor - 1) / (timeFactor * (loan.rate / 12))
        
        return principal / discountFactor
    }
    
    // This function takes in a Loan and calculates the monthly interest payment included in the loan payment
    // The equation is:  Interest = Principal * (interestRate / paymentsPerYear)
    func interestAmountPaid(_ loan: Loan?) -> Double {
        guard let loan = loan else { fatalError("interestAmount called without a loan value") }
        let principal = loan.principal
        
        return principal * (loan.rate / (loan.paymentsPerPeriod))
    }
    
    // This function takes in a Loan and calculates the monthly principal payment included in the loan payment
    // If the user selects a value for additionalPrincipal, the function adds that as well to get the total principal paid for that payment
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
    
    // I think the next step will be to have a function that chains all of these together, going from one month to the next (using a for-in loop?) over the life of the loan and returning the sum total for the interest paid (and probably the total number of months, which would be shortened is there is a value for additionalPrincipal)
    
}
