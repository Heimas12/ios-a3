//
//  Commen.swift
//  Uninn
//
//  Created by nav on 2018/5/15.
//  Copyright © 2018年 Chris.C. All rights reserved.
//

import Foundation
import UIKit

enum Collect_Source:String{
    case  allEvents = "allEvents"
    case favoriteEvent = "favoriteEvent"
    
}
enum HasPwd:String{
    case  has = "1"
    case isNotHas = "0"
    
}

enum HavePermisson:String{
    case  havePermisson = "1"
    case isNotHave = "0"
    
}


//Renewal status: 0=The reminder period has not yet arrived, 1=The user is waiting for confirmation, 2=The user has confirmed the renewal, 3=The user refuses to renew
enum ExpiredStatus:String{
    case  noRemindingCycle = "0"
    case userToBeConfirmed = "1"
    case confirmedTheRenewal = "2"
    case refusesToRenew = "3"

}
//Reservation status: 1=pending, 2=user pending confirmation, 3=user confirmed, 99=completed
enum Order_status:String{
    case  toBeTreated = "1"
    case userToBeConfirmed = "2"
    case confirmedTheRenewal = "3"
    case finished = "99"
    
}

enum Confirm_inventory:String{
    case  noNeed = "0"
    case  need = "1"
    
}

enum Class_id:String{
    case  ChangedMaintance = "1101"
    case  Renew = "1201"
    case  Inventory = "1301"
    case  Notification = "1401"
    case  AddPracel = "1501"
    case  ReceivedPracel = "1502"

}

enum MaintanceSelectType:String{
    case  location = "Location"
    case  item = "Item"
    case  priority = "Priority"
    
}

enum UploadImageType:String{
    case  event = "Event"
    case  maintance = "Maintance"
}

func navColor(_ red: CGFloat, _ green: CGFloat,_  blue: CGFloat,_ alpha: CGFloat) -> UIColor {
    return UIColor(red: red/255.0, green: green/255.0, blue: blue/255.0, alpha: alpha)
}

func navColorWithHex(hex: CUnsignedInt, alpha: CGFloat) -> UIColor {
    let color = UIColor.init(red: (CGFloat)((hex&0xFF0000)>>16)/255.0, green: (CGFloat)((hex&0xFF00)>>8)/255.0, blue: (CGFloat)(hex&0xFF)/255.0, alpha: alpha)
    return color
}

func navColorWithHex(_ hex: CUnsignedInt) -> UIColor {
    let color = UIColor.init(red: (CGFloat)((hex&0xFF0000)>>16)/255.0, green: (CGFloat)((hex&0xFF00)>>8)/255.0, blue: (CGFloat)(hex&0xFF)/255.0, alpha: 1.0)
    return color
}


//main color tone
let Klogin_uInput_color = navColor(209,209,209,1)
let KloginBtn_disable_color = Klogin_uInput_color
let KloginBtn_normal_color = navColor(51,51,51,1)
let KlandPageBtn_normal_color = navColor(205,21,67,1)
let KPersonal_topView_color = navColor(175,150,102,1)
let KPersonal_descLab_color = navColor(152,152,152,1)
let KHome_shadow_color = navColor(0,0,0,0.09)

let kHome_bg_color = navColor(249,249,249,1)

//background color
let kBackground_color = navColor(255,255,255,1)
let kMaintance_btn_color = navColor(205,21,67,1)
let kMaintance_edit_color = navColor(0,104,246,1)

let kMaintance_status1_color = navColor(27,208,34,1)
let kMaintance_status2_color = navColor(242,201,43,1)
let kMaintance_status3_color = navColor(255,238,192,1)


let kInvetary_header_color = navColor(248,202,77,1)
let kInvetary_cellbg_color = navColor(255,250,236,1)


let kUninn_word_color = navColor(255,255,255,0.5)
let kEmergency_btn_color = navColor(76,217,100,1)

let kBookdetail_bg_color = navColor(241,222,185,1)
let kBookdetail_title_color = navColor(175,150,102,1)
let kMessage_textLeft_color = navColor(95,95,95,1)
let kEvent_btnBg_color = navColor(227,227,227,1)


let kScreenWidth = UIScreen.main.bounds.width
let kScreenHeight = UIScreen.main.bounds.height

let KNavHeight = kScreenHeight == 812.0 ? CGFloat(88) : CGFloat(64)

//banner ratio 16:6.5
let KBanner_rate:CGFloat = 0.4
//    CGFloat(6.5/16)
//banner thumbnail ratio 16:10
let KSmallBanner_rate:CGFloat = 0.625


