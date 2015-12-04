//
//  TimelineViewCell.swift
//  Squad
//
//  Created by Michael Vieth on 12/3/15.
//  Copyright © 2015 Michael Vieth. All rights reserved.
//

import Foundation
import UIKit
import QuartzCore

class TimelineViewCell: UITableViewCell {
    
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var mainTextLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        iconImageView.layer.cornerRadius = 10
        iconImageView.layer.masksToBounds = true
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func setIconImage(image: UIImage) {
        iconImageView.image = image
    }
    
    func setMainText(text: String) {
        mainTextLabel.text = text
    }
    
    func setUsername(name: String) {
        usernameLabel.text = name
    }
}
