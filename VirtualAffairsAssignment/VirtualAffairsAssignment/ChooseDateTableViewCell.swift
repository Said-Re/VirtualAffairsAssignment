//
//  ChooseDateTableViewCell.swift
//  VirtualAffairsAssignment
//
//  Created by Said Rehouni on 7/6/16.
//  Copyright © 2016 Said Rehouni. All rights reserved.
//

import UIKit

class ChooseDateTableViewCell: UITableViewCell {

    @IBOutlet weak var chooseDatePicker: UIDatePicker!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(false, animated: animated)
    }
    
    @IBAction func valueChanged(sender: UIDatePicker) {
        
    
    }
    
}
