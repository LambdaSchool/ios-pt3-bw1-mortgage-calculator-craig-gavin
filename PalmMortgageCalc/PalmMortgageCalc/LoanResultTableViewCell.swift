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
    @IBOutlet weak var totalInterestPaidLabel: UILabel!
    @IBOutlet weak var initialPriceLabel: UILabel!
    @IBOutlet weak var totalAmountPaidLabel: UILabel!
    

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
    
    
    func lowerLeftLabelSetter() -> String {
        guard let loan = loan else { return "" }
        //         let lowerLeftLabelKey = UserDefaults.standard.????(forKey: .lowerLeft)
        let totalInterest = loancontroller.lifeOfLoanAmounts(loan).totalInterest
        let initialPrincipal = loan.principal
        let totalPaid = initialPrincipal + totalInterest
        let additionalPayment = loan.additionalPrincipal
        let downPayment = loan.downPayment
        let loanTerm = loan.years
        let interestRate = loan.rate * 100
        let monthlyPayment = loancontroller.paymentAmount(loan)
        
        switch lowerLeftLabelKey {
        case "totalInterest":
            let formattedPrincipal = currencyFormatter(totalInterest)
            return "Total Interest: \(formattedPrincipal)"
        case "initialPrincipal":
            let formattedPrincipal = currencyFormatter(initialPrincipal)
            return "Initial Price:  \(formattedPrincipal)"
        case "totalPaid":
            let formattedTotalPaid = currencyFormatter(totalPaid)
            return "Total Paid:  \(formattedTotalPaid)"
        case "additionalPayment":
            let formattedAdditionalPayment = currencyFormatter(additionalPayment)
            return "Additional Payment:  \(formattedAdditionalPayment)"
        case "downPayment":
            let formattedDownPayment = currencyFormatter(downPayment)
            return "Down Payment:  \(formattedDownPayment)"
        case "loanTerm":
            return "Loan Length:  \(loanTerm) yrs"
        case "interestRate":
            return String(format: "%.2f%%", interestRate)
        case "monthlyPayment":
            let formattedMonthlyPayment = currencyFormatter(monthlyPayment)
            return "Monthly Payment:  \(formattedMonthlyPayment)"
        default:
            return ("No lower left label key found")
        }
    }
    
   func upperRightLabelSetter() -> String {
          guard let loan = loan else { return "" }
          //         let upperRightLabelKey = UserDefaults.standard.????(forKey: .upperRight)
          let totalInterest = loancontroller.lifeOfLoanAmounts(loan).totalInterest
          let initialPrincipal = loan.principal
          let totalPaid = initialPrincipal + totalInterest
          let additionalPayment = loan.additionalPrincipal
          let downPayment = loan.downPayment
          let loanTerm = loan.years
          let interestRate = loan.rate * 100
          let monthlyPayment = loancontroller.paymentAmount(loan)
          
          switch upperRightLabelKey {
          case "totalInterest":
              let formattedPrincipal = currencyFormatter(totalInterest)
              return "Total Interest: \(formattedPrincipal)"
          case "initialPrincipal":
              let formattedPrincipal = currencyFormatter(initialPrincipal)
              return "Initial Price:  \(formattedPrincipal)"
          case "totalPaid":
              let formattedTotalPaid = currencyFormatter(totalPaid)
              return "Total Paid:  \(formattedTotalPaid)"
          case "additionalPayment":
              let formattedAdditionalPayment = currencyFormatter(additionalPayment)
              return "Additional Payment:  \(formattedAdditionalPayment)"
          case "downPayment":
              let formattedDownPayment = currencyFormatter(downPayment)
              return "Down Payment:  \(formattedDownPayment)"
          case "loanTerm":
              return "Loan Length:  \(loanTerm) yrs"
          case "interestRate":
              return String(format: "%.2f%%", interestRate)
          case "monthlyPayment":
              let formattedMonthlyPayment = currencyFormatter(monthlyPayment)
              return "Monthly Payment:  \(formattedMonthlyPayment)"
            default:
                return ("No upper right label key found")
          }
      }
    
    func lowerRightLabelSetter() -> String {
           guard let loan = loan else { return "" }
           //         let lowerRightLabelKey = UserDefaults.standard.????(forKey: .lowerRight)
           let totalInterest = loancontroller.lifeOfLoanAmounts(loan).totalInterest
           let initialPrincipal = loan.principal
           let totalPaid = initialPrincipal + totalInterest
           let additionalPayment = loan.additionalPrincipal
           let downPayment = loan.downPayment
           let loanTerm = loan.years
           let interestRate = loan.rate * 100
           let monthlyPayment = loancontroller.paymentAmount(loan)
           
           switch lowerRightLabelKey {
           case "totalInterest":
               let formattedPrincipal = currencyFormatter(totalInterest)
               return "Total Interest: \(formattedPrincipal)"
           case "initialPrincipal":
               let formattedPrincipal = currencyFormatter(initialPrincipal)
               return "Initial Price:  \(formattedPrincipal)"
           case "totalPaid":
               let formattedTotalPaid = currencyFormatter(totalPaid)
               return "Total Paid:  \(formattedTotalPaid)"
           case "additionalPayment":
               let formattedAdditionalPayment = currencyFormatter(additionalPayment)
               return "Additional Payment:  \(formattedAdditionalPayment)"
           case "downPayment":
               let formattedDownPayment = currencyFormatter(downPayment)
               return "Down Payment:  \(formattedDownPayment)"
           case "loanTerm":
               return "Loan Length:  \(loanTerm) yrs"
           case "interestRate":
               return String(format: "%.2f%%", interestRate)
           case "monthlyPayment":
               let formattedMonthlyPayment = currencyFormatter(monthlyPayment)
               return "Monthly Payment:  \(formattedMonthlyPayment)"
            default:
                return ("No lower right label key found")
           }
       }

    
    private func updateViews() {
        guard let loan = loan
            else { return }
//        let totalInterest = loancontroller.lifeOfLoanAmounts(loan).totalInterest
//        let initialPrincipal = loan.principal
//        let totalPaid = initialPrincipal + totalInterest
//
//        let formattedInterest = currencyFormatter(totalInterest)
//        let formattedPrincipal = currencyFormatter(initialPrincipal)
//        let formattedTotalPaid = currencyFormatter(totalPaid)
//
//        loanTypeLabel.text = loan.type
//        totalInterestPaidLabel.text = "Total Interest:  \(formattedInterest)"
//        initialPriceLabel.text = "Initial Price:  \(formattedPrincipal)"
//        totalAmountPaidLabel.text = "Total Paid:  \(formattedTotalPaid)"
        
        // new code starts here
        loanTypeLabel.text = loan.type
        totalInterestPaidLabel.text = lowerLeftLabelSetter()
        totalInterestPaidLabel.text = upperRightLabelSetter()
        totalAmountPaidLabel.text = lowerRightLabelSetter()
        
        
        
        // new code ends here
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
