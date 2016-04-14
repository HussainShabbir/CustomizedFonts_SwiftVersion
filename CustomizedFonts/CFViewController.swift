//
//  ViewController.swift
//  CustomizedFonts
//
//  Created by Hussain  on 11/4/16.
//  Copyright © 2016 OnWardGroup. All rights reserved.
//

import UIKit

enum fontOperationsIndex : Int{
    case kfontFamilyIndex = 0
    case kfontSizeIndex
    case kfontColorIndex
    case kfontTraitsIndex
    case kfontTitleIndex
}
typealias fontOperations = fontOperationsIndex

let FontFamily = "fontFamily"
let FontSize = "fontSize";
let FontColor = "fontColor";
let FontTraits = "fontTraits";
let FontTitle = "fontTitle";

class CFViewController: UIViewController,UITableViewDataSource,
                        UITableViewDelegate,UIPickerViewDelegate,
                        UIPickerViewDataSource
{
    
    var items = []
    var model = CFModel()
    
    @IBOutlet weak var pickerView : UIView?
    @IBOutlet weak var tableView : UITableView?
    @IBOutlet weak var picker : UIPickerView?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let familyNames = UIFont.familyNames()
        let traits = ["Bold","Italic","Bold Italic","Condensed Black","Condensed Bold","Light","Light Italic","Medium","Medium Italic","Thin","Thin Italic","UltraLight","UltraLight Italic"]
        let colors = [0x000000, 0x262626, 0x4d4d4d, 0x666666, 0x808080, 0x990000, 0xcc0000, 0xfe0000, 0xff5757, 0xffabab, 0xffabab, 0xffa757, 0xff7900, 0xcc6100, 0x994900, 0x996f00, 0xcc9400, 0xffb900, 0xffd157, 0xffe8ab, 0xfff4ab, 0xffe957, 0xffde00, 0xccb200, 0x998500, 0x979900, 0xcacc00, 0xfcff00, 0xfdff57, 0xfeffab, 0xf0ffab, 0xe1ff57, 0xd2ff00, 0xa8cc00, 0x7e9900, 0x038001, 0x04a101, 0x05c001, 0x44bf41, 0x81bf80, 0x81c0b8, 0x41c0af, 0x00c0a7, 0x00a18c, 0x00806f, 0x040099, 0x0500cc, 0x0600ff, 0x5b57ff, 0xadabff, 0xd8abff, 0xb157ff, 0x6700bf, 0x5700a1, 0x450080, 0x630080, 0x7d00a1, 0x9500c0, 0xa341bf, 0xb180bf, 0xbf80b2, 0xbf41a6, 0xbf0199, 0xa10181, 0x800166, 0x999999, 0xb3b3b3, 0xcccccc, 0xe6e6e6, 0xffffff]
        self.model.initModel(familyNames, colors: colors, traits: traits, hexColor: Int(colors[5]), currentFamilyName: familyNames[5], currentTrait: traits[1], fontSize: 10, fontFamilyPicker: true, fontTraitsPicker: true)
        self.items = familyNames
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewDidAppear(animated: Bool) {
        self.pickerView!.frame = CGRectMake(0, self.view.frame.size.height+300, self.view.frame.size.width, 300)
        self.picker?.selectRow(5, inComponent: 0, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func shouldAutorotate() -> Bool {
        return false
    }
    
    //pragma Mark - TableView Delegate
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        var rowHeight : CGFloat?
        if let fontOperationValue = fontOperations(rawValue : indexPath.row)
        {
            switch fontOperationValue
            {
                case .kfontSizeIndex:
                    rowHeight = 100.0
                    
                case .kfontColorIndex:
                    rowHeight = 153.0
                
            default :
                rowHeight = 48.0
            }
       }
        else
        {
            //do nothing
        }
    return rowHeight!
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell : UITableViewCell?
        if let fontOperationValue = fontOperations(rawValue : indexPath.row)
        {
            switch fontOperationValue
            {
            case .kfontFamilyIndex:
                cell = tableView.dequeueReusableCellWithIdentifier(FontFamily)
                cell?.detailTextLabel?.text = self.model.currentFamilyName
                
            case .kfontSizeIndex:
                cell = tableView.dequeueReusableCellWithIdentifier(FontSize)
                
            case .kfontColorIndex:
                cell = tableView.dequeueReusableCellWithIdentifier(FontColor)
                
            case .kfontTraitsIndex:
                cell = tableView.dequeueReusableCellWithIdentifier(FontTraits)
                cell?.detailTextLabel?.text = self.model.currentTrait
                
            case .kfontTitleIndex:
                cell = tableView.dequeueReusableCellWithIdentifier(FontTitle)
                cell?.textLabel?.text = "Hello World!";
            
        }
    }
        return cell!
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.model.updateIndexPath(indexPath.row, inSection: indexPath.section)
        if let fontOperationValue = fontOperations(rawValue : indexPath.row)
        {
        switch fontOperationValue{
        case .kfontFamilyIndex:
            self.model.showFontFamilyPicker(true, fontTraitsPicker: false)
            self.items = self.model.fontFamilies
            self.picker!.reloadAllComponents()
            break;
            
        case .kfontTraitsIndex:
            self.model.showFontFamilyPicker(false, fontTraitsPicker: true)
            self.items = self.model.fontTraits
          self.picker!.reloadAllComponents()
            
        default:
            self.model.showFontFamilyPicker(false, fontTraitsPicker: false)
        }
        if (self.model.fontFamilyPicker || self.model.fontTraitsPicker)
        {
            showPickerView()
        }
        else
        {
            hidePickerView()
        }
    }
    }
    
    func hidePickerView()
    {
        UIView.animateWithDuration(0.5)
        {
            self.pickerView!.frame = CGRectMake(0, self.view.frame.size.height+300, self.view.frame.size.width, 300)
        }
    }
    
    func showPickerView()
    {
        UIView.animateWithDuration(0.5)
        {
         self.pickerView!.frame = CGRectMake(0, self.view.frame.size.height-300, self.view.frame.size.width, 300)
        }
    }
    
    @IBAction func done(sender : AnyObject)
    {
      hidePickerView()
    }
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int
    {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        return self.items.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        return self.items[row] as? String
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let cell = self.tableView?.cellForRowAtIndexPath(self.model.currentIndexPath)
        cell?.detailTextLabel?.text = self.items[row] as? String
        if (self.model.fontFamilyPicker){
            self.model.currentFamilyName = self.items[row] as! String
        }
        else if (self.model.fontTraitsPicker){
            self.model.currentTrait = self.items[row] as! String
        }
        updateFonts()
    }
    
    @IBAction func sliderValueChanged(sender : UISlider)
    {
        let sliderValue = Int(sender.value)
        if let _ = sender.viewWithTag(101)
        {
            let fontSizeCell  = self.tableView?.cellForRowAtIndexPath(NSIndexPath(forRow: 1, inSection: 0)) as! CFFontSizeCell
            fontSizeCell.updateDetailTextValue(sliderValue)
            self.model.fontSize = sliderValue
        }
        else if let _ = sender.viewWithTag(102)
        {
            let hexColorValue = self.model.colors[sliderValue] as! Int
            self.model.hexColor = hexColorValue
        }
        updateFonts()
    }
    
    func updateTitleWithFont(font : UIFont)
    {
        let cell = self.tableView?.cellForRowAtIndexPath(NSIndexPath(forRow: 4, inSection: 0))
        cell?.textLabel?.font = font
    }
    
    
    func updateTitleWithFontColor(color : Int)
    {
        let cell = self.tableView?.cellForRowAtIndexPath(NSIndexPath(forRow: 4, inSection: 0))
        cell?.textLabel?.textColor = colorFromHex(color)
    }
    
    func colorFromHex(rgbValue : Int) -> UIColor
    {
        let red = CGFloat((rgbValue & 0xFF0000) >> 16) / 0xFF
        let green = CGFloat((rgbValue & 0x00FF00) >> 8) / 0xFF
        let blue = CGFloat(rgbValue & 0x0000FF) / 0xFF
        let alpha = CGFloat(1.0)
        return  UIColor(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    func updateFonts()
    {
        let font = UIFont.createFontWithFamily(self.model.currentFamilyName, fontSize: CGFloat (self.model.fontSize), fontTrait: self.model.currentTrait)
        updateTitleWithFont(font)
        updateTitleWithFontColor(self.model.hexColor!)
    }
    
}