//
//  Config.h
//  Uninn
//
//  Created by nav on 2018/5/12.
//  Copyright © 2018年 Chris.C. All rights reserved.
//

#ifndef Config_h
#define Config_h

#define KcalculateStringSize(name,string,fontSize,sizeWidth,sizeHeight)  CGSize name;\
{\
NSDictionary *attribute = @{NSFontAttributeName: [UIFont systemFontOfSize:fontSize]};\
name = [string boundingRectWithSize:CGSizeMake(sizeWidth, sizeHeight) options: NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attribute context:nil].size;\
}

/*======================== Height and Width of Basic Controls =======================*/

#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define iPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)
#define kNavigationHeight (iPhoneX ? 88.f : 64.f)
#define kTabbarHeight 49
#define kUITableViewCellHeight 44
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
#define kFilePath(name) [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:name]
#define K_Avalable [[[UIDevice currentDevice] systemVersion] floatValue]
#define Ksearch_H (K_Avalable >= 11 ? 56 : 44)


/*====================== Log information output =====================*/
#ifdef DEBUG
#define DebugLog(s, ... ) NSLog( @"[%@ in line %d] ===============>%@", [[NSString stringWithUTF8String:__FILE__] lastPathComponent], __LINE__, [NSString stringWithFormat:(s), ##__VA_ARGS__] )
#else
#define DebugLog(s, ... )
#endif

#endif /* Config_h */
