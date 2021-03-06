//
//  Ancher.m
//  LineGraphicTest
//
//  Created by yehengjia on 2015/3/30.
//  Copyright (c) 2015年 mitake. All rights reserved.
//

#import "AnchorView.h"
#import "Constants.h"

@interface AnchorView()

@property CGFloat anchorWidth;
@property CGFloat anchorHeight;

@end

@implementation AnchorItem

#if !__has_feature(objc_arc)

-(void) dealloc
{
    OBJC_RELEASE(self.xDateLabel);
    
    [super dealloc];
}

#endif

-(instancetype) init {
    
    if ( self = [super init]) {
        
        self.y1Value = 0.0f;
        self.y2Value = 0.0f;
        self.xDateLabel = @"";
    }
    
    return self;
}

@end

@implementation AnchorView

#if !__has_feature(objc_arc)

-(void) dealloc
{
    OBJC_RELEASE(self.anchorDataAry);
    
    [super dealloc];
}

#endif

-(id) initWithFrame:(CGRect)frame
{
    if ( (self = [super initWithFrame:frame]) ) {
        
        self.backgroundColor = [UIColor clearColor];
        
        self.anchorWidth = frame.size.width;
        self.anchorHeight = frame.size.height;
        self.anchorColor = [UIColor orangeColor];
    }
    
    return self;
}
 
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    //Create clear background
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetAllowsAntialiasing(context, YES);
    CGContextSetShouldAntialias(context, YES);

    CGContextSetFillColorWithColor(context, self.anchorColor.CGColor);
    
    CGContextAddEllipseInRect(context, CGRectMake(0, 0, self.anchorWidth, self.anchorHeight));
    
    CGContextDrawPath(context, kCGPathFill);
}

-(void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (self.anchorDelegate != nil) {
        
        if ([self.anchorDelegate respondsToSelector:@selector(didSelectAnchorPoint:)]) {
            
            [self.anchorDelegate didSelectAnchorPoint:self.anchorDataAry];
        }
    }
}
@end
