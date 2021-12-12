//
//  DailyTableViewCell.swift
//  MostlySunny
//
//  Created by Mindy Douglas on 12/11/21.
//

import UIKit

class DailyTableViewCell: UITableViewCell {
  
  @IBOutlet weak var dayLabel: UILabel!
  @IBOutlet weak var dailyHighLabel: UILabel!
  @IBOutlet weak var dailyLowLabel: UILabel!
  @IBOutlet weak var dailyImage: UIImageView!
  @IBOutlet weak var dailyPopLabel: UILabel!
  
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
