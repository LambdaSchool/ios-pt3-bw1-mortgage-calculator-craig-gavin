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
    
//    var loan: Loan? {
//        didSet {
//            updateViews()
//        }
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //loanController.loan = loanController
        //updateViews()
        // Do any additional setup after loading the view.
    }
    
//    private func updateViews() {
//        guard let loan = loan, isViewLoaded else { return } // not sure if this is right guard let
        
        // loanPrincipalLabel.text = loan.loan **this is wrong need to figure this out, and other IBOutlets as well
    //}
    
}
