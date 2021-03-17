//
//  JSONModel+twSafe.m
//  TWJsonModel_Example
//
//  Created by TW on 2021/3/17.
//  Copyright © 2021 tanwang11. All rights reserved.
//

#import "JSONModel+twSafe.h"
#import <TWFoundation/NSObject+twSwizzling.h>
#import "TWJsonModelTool.h"


@implementation JSONModel (twSafe)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        // 初始化
        [objc_getClass("JSONModel") methodSwizzlingWithOriginalSelector:@selector(initWithDictionary:error:)  bySwizzledSelector:@selector(safeInitWithDictionary:error:)];
    });
}

- (instancetype)safeInitWithDictionary:(NSDictionary *)dict error:(NSError **)err {
    id entity;
    if (err) {
        entity = [self safeInitWithDictionary:dict error:err];
    }else{
        NSError * error;
        entity = [self safeInitWithDictionary:dict error:&error];
        if (error) {
            TWJsonModelTool * tool = [TWJsonModelTool share];
            if (tool.blockError) {
                tool.blockError(error);
            } else {
                NSLog(@"TWJsonModel ERROR: %@", error.userInfo[@"kJSONModelTypeMismatch"]);
            }
        }
    }
    
    return entity;
}

@end
