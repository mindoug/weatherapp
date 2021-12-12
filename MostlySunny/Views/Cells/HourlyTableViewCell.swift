//
//  HourlyTableViewCell.swift
//  MostlySunny
//
//  Created by Mindy Douglas on 12/11/21.
//

import UIKit

class HourlyTableViewCell: UITableViewCell {
  
  @IBOutlet weak var hourlyTimeLabel: UILabel!
  @IBOutlet weak var hourlyTempLabel: UILabel!
  @IBOutlet weak var hourlyImageLabel: UIImageView!
  @IBOutlet weak var hourlyPopLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
