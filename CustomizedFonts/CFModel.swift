//
//  CFModel.swift
//  CustomizedFonts
//
//  Created by Hussain  on 11/4/16.
//  Copyright © 2016 OnWardGroup. All rights reserved.
//

import UIKit

class CFModel: NSObject {
    var fontFamilies = []
    var fontTraits = []
    var colors = []
    var hexColor :Int?
    var currentFamilyName = ""
    var currentTrait = ""
    var currentIndexPath = NSIndexPath(forRow: 0, inSection: 0)
    var fontSize = 10
    var fontFamilyPicker = false
    var fontTraitsPicker = false
    
    func initModel(fontFamilies : AnyObject, colors : AnyObject, traits : AnyObject, hexColor : Int, currentFamilyName : String, currentTrait : String, fontSize : Int, fontFamilyPicker : Bool, fontTraitsPicker : Bool)
    {
        self.fontFamilies = fontFamilies as! NSArray
        self.colors = colors as! NSArray
        self.fontTraits = traits as! NSArray
        self.hexColor = hexColor
        self.currentFamilyName = currentFamilyName
        self.currentTrait = currentTrait
        self.fontSize = fontSize
        self.fontFamilyPicker = fontFamilyPicker;
        self.fontTraitsPicker = fontTraitsPicker;
    }
    
    func showFontFamilyPicker(fontFamilyPicker : Bool, fontTraitsPicker : Bool)
    {
        self.fontFamilyPicker = fontFamilyPicker;
        self.fontTraitsPicker = fontTraitsPicker;
    }
    
    func updateIndexPath(row : Int, inSection section: Int)
    {
        self.currentIndexPath = NSIndexPath(forRow: row, inSection: section)
    }
    
}



