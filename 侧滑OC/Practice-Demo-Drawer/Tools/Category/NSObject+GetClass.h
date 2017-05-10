//
//  NSObject+GetClass.h
//  Practice-Demo-Drawer
//
//  Created by IOSDEV on 16/8/15.
//  Copyright © 2016年 COOL KAI. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (GetClass)

- (Class)getClassByClassName:(NSString *)className;

@end
