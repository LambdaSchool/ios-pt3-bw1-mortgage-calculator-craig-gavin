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
        
        return ((principal / discountFactor)*100).rounded() / 100
    }
    
    // This function takes in a Loan and calculates the monthly interest payment included in the loan payment
    // The equation is:  Interest = Principal * (interestRate / paymentsPerYear)
    func interestAmountPaid(_ loan: Loan?) -> Double {
        guard let loan = loan else { fatalError("interestAmount called without a loan value") }
        let principal = loan.principal
        
        return ((principal * (loan.rate / (loan.paymentsPerPeriod)))*100).rounded() / 100
    }
    
    // This function takes in a Loan and calculates the monthly principal payment included in the loan payment
    // If the user selects a value for additionalPrincipal, the function adds that as well to get the total principal paid for that payment
    func principalAmountPaid(_ loan: Loan?) -> Double {
        guard let loan = loan else { fatalError("principalAmountPaid called without a loan value") }
        let totalPayment = paymentAmount(loan)
        let interestAmount = interestAmountPaid(loan)
        
        return totalPayment - interestAmount + loan.additionalPrincipal
    }
    
    // This function takes in a Loan and returns the cumulative interest paid over the life of the loan.  It was a little tricky for me and I'm not sure it's optimally efficient but it seems to work.  It might also be interesting to add the total number of months, which would be shortened is there is a value for additionalPrincipal
    func lifeOfLoanAmounts(_ loan: Loan?) -> Double {
        guard let loan = loan else { fatalError("lifeOfLoan called without a loan value") }
        
        var cumulativeInterestPaid: Double = 0   // start the cumulative counter at 0
        var newLoanValues: Loan = loan   // the while loop will need to recalculate the values for each loop
        let monthlyPayment = paymentAmount(loan)  // the monthly payment will not change, so it is set outside the loop
        
        //  I set variables/constants for these just to make it easier to call them in the while loop
        var currentPrincipal = (loan.principal * 100).rounded() / 100
        let years = loan.years
        let rate = loan.rate
        let downPayment = loan.downPayment
        let paymentsPerPeriod = loan.paymentsPerPeriod
        let additionalPrincipal = loan.additionalPrincipal

        while currentPrincipal > monthlyPayment {
            let currentInterestPaid = interestAmountPaid(newLoanValues)
            cumulativeInterestPaid = cumulativeInterestPaid + currentInterestPaid
            currentPrincipal = ((currentPrincipal - (monthlyPayment - currentInterestPaid + additionalPrincipal)) * 100).rounded() / 100
            
            newLoanValues = Loan(principal: currentPrincipal, years: years, rate: rate, downPayment: downPayment, paymentsPerPeriod: paymentsPerPeriod, additionalPrincipal: additionalPrincipal)
            
            
        }
        
        return (cumulativeInterestPaid * 100).rounded() / 100
    }
    
}
