//
//  String+ extension.swift
//  ServiceStation
//
//  
//
//

import Foundation

// Calculating text height or width has nothing to do with the weight parameter
public extension String {
    static func getTextHeigh(textStr:String,font:Float,width:CGFloat) -> CGFloat {
        
        let normalText: NSString = textStr as NSString
        let size = CGSize.init(width: width, height: 1000)
        let dic = [NSAttributedString.Key.font:UIFont.systemFont(ofSize: CGFloat(font)),NSAttributedString.Key.foregroundColor:UIColor.black]
        let stringSize = normalText.boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: dic, context: nil)
        return stringSize.height
    }
    
    static func getTexWidth(textStr:String,font:Float,height:CGFloat) -> CGFloat {
        
        let normalText: NSString = textStr as NSString
        let size = CGSize.init(width: 10000, height: height)
        let dic = [NSAttributedString.Key.font:UIFont.systemFont(ofSize: CGFloat(font)),NSAttributedString.Key.foregroundColor:UIColor.black]
        let stringSize = normalText.boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: dic, context: nil)
        
        return stringSize.width
        
    }
    
    static func StringChangeToDoubleForJingdu(textStr:String) -> Double {
        if textStr.count == 0 || textStr == "" {
            return 0.0
        }
        
        let formatter = NumberFormatter.init()
        formatter.numberStyle = .decimal
        return (formatter.number(from: textStr)?.doubleValue)!
    }
    
    //array to json
    static func getJSONStringFromArray(array:NSArray) -> String {
        
        if (!JSONSerialization.isValidJSONObject(array)) {
            print("Unable to parse out JSONString")
            return ""
        }
        
        let data : NSData! = try! JSONSerialization.data(withJSONObject: array, options: []) as NSData?
        let JSONString = NSString(data:data as Data,encoding: String.Encoding.utf8.rawValue)
        return JSONString! as String
        
    }

    
}

