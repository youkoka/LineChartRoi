//
//  ViewController.m
//  LineChartRoi
//
//  Created by yehengjia on 2016/1/8.
//  Copyright © 2016年 mitake. All rights reserved.
//

#import "ViewController.h"

#import "LineChartView.h"

@interface ViewController ()

@property (nonatomic, strong) NSMutableArray *anchorDataAry;

@property (nonatomic, strong) LineChartView *lineChartView;

@end

@interface ViewController ()

@end

@implementation ViewController

#if !__has_feature(objc_arc)

-(void) dealloc
{
    OBJC_RELEASE(self.anchorDataAry);
    OBJC_RELEASE(self.lineChartView);
    
    [super dealloc];
    
}

#endif

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.anchorDataAry = [NSMutableArray array];
    
    NSMutableArray *labelAry = [NSMutableArray array];
    
    for (int j = 0; j != 30; j++) {
        
        NSMutableArray *stepAry = [NSMutableArray array];
            
        
        for (int i = 0; i != 1; i++) {
            
            AnchorItem *item = [[[AnchorItem alloc] init] autorelease];
            
            item.y1Value = 0.5 - ((rand() % 1000) * 0.001);
            item.y2Value = (rand() % 100);
            
            [stepAry addObject:item];
        }
        
        [self.anchorDataAry addObject:stepAry];
        
        
        if (j % 5 == 0) {
        
            [labelAry addObject:[NSString stringWithFormat:@"01/%zd", j + 1]];
        }
        else {
            
            [labelAry addObject:@""];
        }
        
    }

    CGRect rect = CGRectMake(5, 40,
                             self.view.frame.size.width - 5 - 5,
                             300);
    
    self.lineChartView = [[[LineChartView alloc] initWithFrame:rect] autorelease];
    self.lineChartView.isShowY1MinMaxValue = YES;
    self.lineChartView.drawLineTypeOfY = LineDrawTypeDashLine;
    self.lineChartView.drawLineTypeOfX = LineDrawTypeDashLine;
    self.lineChartView.backgroundColor = [UIColor blackColor];
    self.lineChartView.xAxisLineColor = [UIColor whiteColor];
    self.lineChartView.yAxisLineColor = [UIColor whiteColor];
    self.lineChartView.xLineColor = [UIColor whiteColor];
    self.lineChartView.yLineColor = [UIColor whiteColor];
    self.lineChartView.xTextColor = [UIColor whiteColor];
    self.lineChartView.yTextColor = [UIColor orangeColor];
    self.lineChartView.y1LineColorLower = [UIColor greenColor];
    self.lineChartView.y1LineColorUpper = [UIColor redColor];
    self.lineChartView.y2LineColor = [UIColor purpleColor];
    self.lineChartView.xLabelAry = labelAry;
    [self.lineChartView setDataSource:self.anchorDataAry];
    [self.view addSubview:self.lineChartView];
}

-(BOOL) shouldAutorotate
{
    UIInterfaceOrientation orientation = [[UIApplication sharedApplication] statusBarOrientation];
    CGRect rect;
    
    switch (orientation) {
            
        case UIInterfaceOrientationPortrait:
        case UIInterfaceOrientationPortraitUpsideDown:
        {
            rect = CGRectMake(5, 40,
                              self.view.frame.size.width - 5 - 5,
                              300);
        }
            break;
        case UIInterfaceOrientationLandscapeLeft:
        case UIInterfaceOrientationLandscapeRight:
        {
            rect = CGRectMake(5, 10,
                              self.view.frame.size.width - 5 - 5,
                              300);
        }
            break;
        default:
            break;
    }
    
    [self.lineChartView resetViewWithFrame:rect];
    
    return YES;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
