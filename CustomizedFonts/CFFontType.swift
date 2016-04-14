//
//  CFFontType.swift
//  CustomizedFonts
//
//  Created by Hussain  on 13/4/16.
//  Copyright © 2016 OnWardGroup. All rights reserved.
//

import UIKit

class CFFontType: UIFont {
}
extension UIFont{
    class func createFontWithFamily(familyName : String, fontSize : CGFloat, fontTrait : String) -> UIFont
    {
        let attriButes = [kCTFontFamilyNameAttribute as NSString : familyName, kCTFontStyleNameAttribute as NSString : fontTrait, kCTFontSizeAttribute as NSString : fontSize]
        let descriptor = CTFontDescriptorCreateWithAttributes(attriButes)
        let font = CTFontCreateWithFontDescriptor(descriptor, fontSize, nil)
        return font
    }
}

