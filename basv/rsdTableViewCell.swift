//
//  rsdTableViewCell.swift
//  basv
//
//  Created by Ranjeet Singh on 27/11/20.
//

import UIKit

class rsdTableViewCell: UITableViewCell {

    @IBOutlet weak var name: UITextField!
    
    @IBOutlet weak var hrs: UITextField!
    
    @IBOutlet weak var fees: UITextField!
    
    @IBOutlet weak var deleteButton: UIButton!
    
    
    func setdetails(det:Course) {
        name.text = det.course
        hrs.text = String(det.hours)
        fees.text = String(det.fee)
        
    }
}
