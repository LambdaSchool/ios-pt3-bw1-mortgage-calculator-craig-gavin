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
    
    var loan: Loan? {
        didSet {
            updateViews()
        }
    }
    
    private func updateViews() {
        guard let loan = loan else { return }
        loanTypeLabel.text = loan.type
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
