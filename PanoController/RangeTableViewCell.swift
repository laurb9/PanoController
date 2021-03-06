//
//  RangeTableViewCell.swift
//  PanoController
//
//  Created by Laurentiu Badea on 8/2/17.
//  Copyright © 2017 Laurentiu Badea.
//
//  This file may be redistributed under the terms of the MIT license.
//  A copy of this license has been included with this distribution in the file LICENSE.
//

import UIKit

class RangeTableViewCell: UITableViewCell {
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet var slider: UISlider!
    let MULTIPLE = 5

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    // Make the slider use MULTIPLEs
    @IBAction func valueChanged(_ sender: Any) {
        slider.value = roundf((slider.value) / Float(MULTIPLE)) * Float(MULTIPLE)
        valueLabel?.text = "\(Int(slider.value))º"
    }
    @IBAction func touchUpInside(_ sender: Any) {
        return valueChanged(sender)
    }
}
