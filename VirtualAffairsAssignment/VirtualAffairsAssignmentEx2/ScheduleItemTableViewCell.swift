//
//  ScheduleItemTableViewCell.swift
//  VirtualAffairsAssignment
//
//  Created by Said Rehouni on 8/6/16.
//  Copyright © 2016 Said Rehouni. All rights reserved.
//

import UIKit

class ScheduleItemTableViewCell: UITableViewCell {

    @IBOutlet weak var beginDate: UILabel!
    @IBOutlet weak var endDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setModelInView(model: ScheduleItemModel) {
        beginDate.text = model.beginDate
        endDate.text = model.endDate
    }
    
}
