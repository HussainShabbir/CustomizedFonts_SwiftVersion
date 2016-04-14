//
//  CFFontSizeCellTableViewCell.swift
//  CustomizedFonts
//
//  Created by Hussain  on 11/4/16.
//  Copyright © 2016 OnWardGroup. All rights reserved.
//

import UIKit

class CFFontSizeCell: UITableViewCell {
    func updateDetailTextValue(textValue : Int)
    {
      self.detailTextLabel?.text = NSString(format: "%d",textValue) as String
    }
}
