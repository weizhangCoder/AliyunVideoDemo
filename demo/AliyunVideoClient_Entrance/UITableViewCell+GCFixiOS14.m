//
//  UITableViewCell+GCFixiOS14.m
//  GreatChef
//
//  Created by 张三 on 2020/10/26.
//  Copyright © 2020 early bird international. All rights reserved.
//

#import "UITableViewCell+GCFixiOS14.h"
#import <objc/runtime.h>

@implementation UITableViewCell (GCFixiOS14)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{

        SEL originalSelector = @selector(addSubview:);
        SEL swizzledSelector = @selector(gcRuntimeAddSubview:);

        Method originalMethod = class_getInstanceMethod(self.class, originalSelector);
        Method swizzledMethod = class_getInstanceMethod(self.class, swizzledSelector);

        BOOL success = class_addMethod(self.class, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
        if (success) {
            class_replaceMethod(self.class, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
        } else {
            method_exchangeImplementations(originalMethod, swizzledMethod);
        }

    });
}


- (void)gcRuntimeAddSubview:(UIView *)view{
    //// 判斷不讓 UITableViewCellContentView addSubView自己
    //// 还需要注意 屏蔽掉一些系统直接添加在Cell上的控件，如 UITableViewCellEditControl、UITableViewCellReorderControl 这些还是直接要加在cell 上，当tableView 是编辑状态的时候UITableViewCellContentView 的frame会变小
    
    if ([view isKindOfClass:NSClassFromString(@"UITableViewCellContentView")] ||
        [view isKindOfClass:NSClassFromString(@"UITableViewCellEditControl")] ||
        [view isKindOfClass:NSClassFromString(@"UITableViewCellReorderControl")]) {
        [self gcRuntimeAddSubview:view];
    }else{
        [self.contentView addSubview:view];
    }
    
}
@end
