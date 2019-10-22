//
//  LoanModelController.swift
//  PalmMortgageCalc
//
//  Created by Craig Swanson on 10/22/19.
//  Copyright © 2019 Gavin Murphy. All rights reserved.
//

import UIKit

class LoanModelController {
    var loans: [Loan]
    
    func addLoan(_ loan: Loan) {
        loans.append(loan)
    }
}
