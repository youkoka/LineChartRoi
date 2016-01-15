//
//  Ancher.h
//  LineGraphicTest
//
//  Created by yehengjia on 2015/3/30.
//  Copyright (c) 2015年 mitake. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol AnchorDelefate <NSObject>

//! 回傳資料
-(void) didSelectAnchorPoint:(NSArray *) anchorDataAry;

@end

@interface AnchorItem : NSObject

@property (nonatomic, assign) CGFloat y1Value;
@property (nonatomic, assign) CGFloat y2Value;

//! 固定日期格式, ex : 2015/12/31
@property (nonatomic, strong) NSString *xDateLabel;

@end

@interface AnchorView : UIView

@property (nonatomic, assign) id<AnchorDelefate> anchorDelegate;

@property (nonatomic, assign) UIColor *anchorColor;

//! 存放資料
@property (nonatomic, strong) NSArray *anchorDataAry;

@end
