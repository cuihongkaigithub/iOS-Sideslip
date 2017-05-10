//
//  NSObject+GetClass.m
//  Practice-Demo-Drawer
//
//  Created by IOSDEV on 16/8/15.
//  Copyright © 2016年 COOL KAI. All rights reserved.
//

#import "NSObject+GetClass.h"

@implementation NSObject (GetClass)

- (Class)getClassByClassName:(NSString *)className {
    return NSClassFromString(className);
}

@end
