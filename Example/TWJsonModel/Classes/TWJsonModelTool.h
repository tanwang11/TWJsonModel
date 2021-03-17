//
//  TWJsonModelTool.h
//  TWJsonModel_Example
//
//  Created by TW on 2021/3/17.
//  Copyright © 2021 tanwang11. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^BlockTWJsonModel) (NSError * error);


@interface TWJsonModelTool : NSObject

+ (instancetype)share;

@property (nonatomic, copy  ) BlockTWJsonModel blockError;

@end

NS_ASSUME_NONNULL_END
