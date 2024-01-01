//
//  UIColor+Extensions.swift
//  GitRepos
//
//  Created by Abdullah on 01/01/2024.
//

import UIKit

extension UIColor {
    convenience init(hex: String) {
        var red:   CGFloat = 0.0
        var green: CGFloat = 0.0
        var blue:  CGFloat = 0.0
        var alpha: CGFloat = 1.0
        var hex:   String = hex
        
        if hex.hasPrefix("#") {
            let index   = hex.index(hex.startIndex, offsetBy: 1)
            hex = hex.substring(from: index)
        }
        
        let scanner = Scanner(string: hex)
        var hexValue: CUnsignedLongLong = 0
        if scanner.scanHexInt64(&hexValue) {
            switch (hex.count) {
            case 3:
                red   = CGFloat((hexValue & 0xF00) >> 8)       / 15.0
                green = CGFloat((hexValue & 0x0F0) >> 4)       / 15.0
                blue  = CGFloat(hexValue & 0x00F)              / 15.0
            case 4:
                red   = CGFloat((hexValue & 0xF000) >> 12)     / 15.0
                green = CGFloat((hexValue & 0x0F00) >> 8)      / 15.0
                blue  = CGFloat((hexValue & 0x00F0) >> 4)      / 15.0
                alpha = CGFloat(hexValue & 0x000F)             / 15.0
            case 6:
                red   = CGFloat((hexValue & 0xFF0000) >> 16)   / 255.0
                green = CGFloat((hexValue & 0x00FF00) >> 8)    / 255.0
                blue  = CGFloat(hexValue & 0x0000FF)           / 255.0
            case 8:
                red   = CGFloat((hexValue & 0xFF000000) >> 24) / 255.0
                green = CGFloat((hexValue & 0x00FF0000) >> 16) / 255.0
                blue  = CGFloat((hexValue & 0x0000FF00) >> 8)  / 255.0
                alpha = CGFloat(hexValue & 0x000000FF)         / 255.0
            default:
                print("Invalid RGB string, number of characters after '#' should be either 3, 4, 6 or 8", terminator: "")
            }
        } else {
            print("Scan hex error")
        }
        self.init(red:red, green:green, blue:blue, alpha:alpha)
    }
}

extension UIColor {
    class func compare(_ colorA: UIColor?, with colorB: UIColor?, in view: UIView) -> Bool {
        colorA?.resolvedColor(with: view.traitCollection) == colorB?.resolvedColor(with: view.traitCollection)
    }
}

extension UIColor {
    
    @nonobjc class var primaryYellow: UIColor{
        return UIColor(hex: "#FFBF1F")
    }
    
    @nonobjc class var hex013220: UIColor{
        return UIColor(hex: "#013220")
    }
    
    @nonobjc class var hex056608: UIColor{
        return UIColor(hex: "#056608")
    }
    
    @nonobjc class var hex90EE90: UIColor{
        return UIColor(hex: "#90EE90")
    }
    
    @nonobjc class var hex158816: UIColor{
        return UIColor(hex: "#158816")
    }
    
    @nonobjc class var hex8959F4: UIColor{
        return UIColor(hex: "#8959F4")
    }
    
    @nonobjc class var hex3A3939: UIColor{
        return UIColor(hex: "#3A3939")
    }
    
    @nonobjc class var hex7765C4: UIColor{
        return UIColor(hex: "#7765C4")
    }
    
    @nonobjc class var hex3C3C3CWith20Cent: UIColor{
        return UIColor(hex: "#3C3C3C").withAlphaComponent(0.2)
    }
    
    @nonobjc class var hexFFFFFFWith20Cent: UIColor{
        return UIColor(hex: "#FFFFFF").withAlphaComponent(0.2)
    }
    
    @nonobjc class var hex455A64: UIColor{
        return UIColor(hex: "#455A64")
    }
    
    @nonobjc class var hexD313F2: UIColor{
        return UIColor(hex: "#D313F2")
    }
    
    @nonobjc class var hexA310E8: UIColor{
        return UIColor(hex: "#A310E8")
    }
    
    @nonobjc class var hex443586: UIColor{
        return UIColor(hex: "#443586")
    }
    
    @nonobjc class var hex7765C4With9Cent: UIColor{
        return UIColor(hex: "#7765C4").withAlphaComponent(0.09)
    }
    
    @nonobjc class var hex7765C4With10Cent: UIColor{
        return UIColor(hex: "#7765C4").withAlphaComponent(0.1)
    }
    
    @nonobjc class var hex7765C4With4Cent: UIColor{
        return UIColor(hex: "#7765C4").withAlphaComponent(0.04)
    }
    
    @nonobjc class var hex7765C4With5Cent: UIColor{
        return UIColor(hex: "#7765C4").withAlphaComponent(0.05)
    }
    
    @nonobjc class var hexDADADA: UIColor{
        return UIColor(hex: "#DADADA")
    }
    
    @nonobjc class var hexFAF9FF: UIColor {
        return UIColor(hex: "#FAF9FF")
    }
    
    @nonobjc class var hexF1F0F9: UIColor {
        return UIColor(hex: "#F1F0F9")
    }
    
    @nonobjc class var hex008766With10Cent: UIColor {
        return UIColor(hex: "#008766").withAlphaComponent(0.1)
    }
    
    @nonobjc class var hexAD9EEE: UIColor {
        return UIColor(hex: "#AD9EEE").withAlphaComponent(0.59)
    }
    
    @nonobjc class var hexAD9EEEWithoutAlpa: UIColor {
        return UIColor(hex: "#AD9EEE")
    }

    @nonobjc class var hex008766: UIColor {
        return UIColor(hex: "#008766")
    }

    @nonobjc class var hexEA001B: UIColor {
        return UIColor(hex: "#EA001B")
    }
    
    @nonobjc class var hexFEF2F4: UIColor {
        return UIColor(hex: "#FEF2F4")
    }
    
    @nonobjc class var hexEA001BWith5Cent: UIColor {
        return UIColor(hex: "#EA001B").withAlphaComponent(0.05)
    }
    
    @nonobjc class var hex05737AWith10Cent: UIColor {
        return UIColor(hex: "#05737A").withAlphaComponent(0.1)
    }
    
    @nonobjc class var hex05737A: UIColor {
        return UIColor(hex: "#05737A")
    }
    
    @nonobjc class var hexF27B79With10Cent: UIColor {
        return UIColor(hex: "#F27B79").withAlphaComponent(0.1)
    }
    
    @nonobjc class var hexF27B79: UIColor {
        return UIColor(hex: "#F27B79")
    }
    
    @nonobjc class var hexFFB400: UIColor {
        return UIColor(hex: "#FFB400")
    }
    
    @nonobjc class var hexECEBED: UIColor {
        return UIColor(hex: "#ECEBED")
    }
    
    @nonobjc class var hex00A300: UIColor {
        return UIColor(hex: "#00A300")
    }
    
    @nonobjc class var hex200E32: UIColor {
        return UIColor(hex: "#200E32")
    }
    
    @nonobjc class var hex707070: UIColor {
        return UIColor(hex: "#707070")
    }
    
    @nonobjc class var hexEE4848: UIColor {
        return UIColor(hex: "#EE4848")
    }
    
    @nonobjc class var hex1B1A1A: UIColor {
        return UIColor(hex: "#1B1A1A")
    }
    
    @nonobjc class var hex141414: UIColor {
        return UIColor(hex: "#141414")
    }
    
    @nonobjc class var hex2E2E2E: UIColor {
        return UIColor(hex: "#2E2E2E")
    }
    
    @nonobjc class var hex00ab80: UIColor {
        return UIColor(hex: "#00ab80")
    }
    
    @nonobjc class var hexd49426: UIColor {
        return UIColor(hex: "#d49426")
    }
    
    @nonobjc class var hexD1D1D1: UIColor {
        return UIColor(hex: "#D1D1D1")
    }
    
    @nonobjc class var hexF3F0FF: UIColor {
        return UIColor(hex: "#F3F0FF")
    }

    @nonobjc class var hex565656: UIColor {
        return UIColor(hex: "#565656")
    }
    
    @nonobjc class var hex38B50D: UIColor {
        return UIColor(hex: "#38B50D")
    }
    
    @nonobjc class var hex545F8A: UIColor {
        return UIColor(hex: "#545F8A")
    }
    
    @nonobjc class var hexE5E5E5: UIColor {
        return UIColor(hex: "#E5E5E5")
    }
	
	@nonobjc class var hexE55252: UIColor {
		return UIColor(hex: "#E55252")
	}
    
    @nonobjc class var hexEEEEEE: UIColor {
        return UIColor(hex: "#EEEEEE")
    }
    
    @nonobjc class var hex7B7B7B: UIColor {
        return UIColor(hex: "#7B7B7B")
    }
    
    @nonobjc class var hexF9F6F6: UIColor {
        return UIColor(hex: "#F9F6F6")
    }
    
    @nonobjc class var hex332860: UIColor {
        return UIColor(hex: "#332860")
    }
    
    @nonobjc class var hex4B4651: UIColor {
        return UIColor(hex: "#4B4651")
    }

    @nonobjc class var hex65ADC4: UIColor {
        return UIColor(hex: "#65ADC4")
    }
    
    @nonobjc class var hexC4C4C4: UIColor {
        return UIColor(hex: "#C4C4C4")
    }

    @nonobjc class var hex676767: UIColor {
        return UIColor(hex: "#676767")
    }
    
    @nonobjc class var hex65C4AD: UIColor {
        return UIColor(hex: "#65C4AD")
    }
    
    @nonobjc class var hex1BA096: UIColor {
        return UIColor(hex: "#1BA096")
    }
    
    @nonobjc class var hexE47673: UIColor{
        return UIColor(hex: "#E47673")
    }

    @nonobjc class var hex611F69: UIColor{
        return UIColor(hex: "#611F69")
    }
    
    @nonobjc class var hexA065C4: UIColor{
        return UIColor(hex: "#A065C4")
    }
    
    @nonobjc class var hexAAAAAA: UIColor{
        return UIColor(hex: "#AAAAA")
    }
    
    @nonobjc class var hex987284: UIColor{
        return UIColor(hex: "#987284")
    }
    
    @nonobjc class var hexBD45BD: UIColor{
        return UIColor(hex: "#BD45BD")
    }
   
    @nonobjc class var hex999999: UIColor{
        return UIColor(hex: "#999999")
    }
    
    @nonobjc class var hex65ADC4With10Cent: UIColor {
        return UIColor(hex: "#65ADC4").withAlphaComponent(0.1)
    }
    
    @nonobjc class var hexCA21211A: UIColor {
        return UIColor(hex: "#CA21211A")
    }
    
    @nonobjc class var ongoingOrderBgColor: UIColor {
        return UIColor(hex: "#F79F1A").withAlphaComponent(0.1)
    }
    
    @nonobjc class var ongoingOrderTxtColor: UIColor {
        return UIColor(hex: "#F79F1A")
    }
    
    @nonobjc class var cancelledOrderBgColor: UIColor {
        return UIColor(hex: "#EA001B").withAlphaComponent(0.1)
    }
    
    @nonobjc class var cancelledOrderTxtColor: UIColor {
        return UIColor(hex: "#EA001B")
    }
    
    @nonobjc class var completedOrderBgColor: UIColor {
        return UIColor(hex: "#05737A").withAlphaComponent(0.1)
    }
    
    @nonobjc class var completedOrderTxtColor: UIColor {
        return UIColor(hex: "#05737A")
    }

    @nonobjc class var acceptCall: UIColor {
        return UIColor(hex: "#01A201")
    }
    
    @nonobjc class var declineCall: UIColor {
        return UIColor(hex: "#E20112")
    }
}
