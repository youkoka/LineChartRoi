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
    
    NSDictionary *dicData1 = @{@"cost":@"1777869.0000", @"dd":@"2015/07/01", @"roi":@"-34.532465"};
    NSDictionary *dicData2 = @{@"cost":@"1801928.0000", @"dd":@"2015/07/02", @"roi":@"-77.061070"};
    NSDictionary *dicData3 = @{@"cost":@"1547810.0000", @"dd":@"2015/07/07", @"roi":@"-34.557859"};
    NSDictionary *dicData4 = @{@"cost":@"1325624.0000", @"dd":@"2015/08/03", @"roi":@"-71.777140"};
    NSDictionary *dicData5 = @{@"cost":@"1385683.0000", @"dd":@"2015/08/12", @"roi":@"-88.617526"};
    NSDictionary *dicData6 = @{@"cost":@"1462692.0000", @"dd":@"2015/08/19", @"roi":@"-59.157361"};
    NSDictionary *dicData7 = @{@"cost":@"1530751.0000", @"dd":@"2015/08/28", @"roi":@"-88.602587"};
    NSDictionary *dicData8 = @{@"cost":@"1891987.0000", @"dd":@"2015/10/14", @"roi":@"-67.421393"};
    NSDictionary *dicData9 = @{@"cost":@"2114046.0000", @"dd":@"2015/10/27", @"roi":@"-67.724448"};
    NSDictionary *dicData10 = @{@"cost":@"1141433.0000", @"dd":@"2015/12/22", @"roi":@"-0.227170"};
    NSDictionary *dicData11 = @{@"cost":@"1284442.0000", @"dd":@"2015/12/30", @"roi":@"0.098486"};
    NSDictionary *dicData12 = @{@"cost":@"2336105.0000", @"dd":@"2016/01/11", @"roi":@"38.851121"};
    
    NSMutableArray *chartListAry = [NSMutableArray arrayWithObjects:dicData1, dicData2, dicData3, dicData4, dicData5, dicData6, dicData7, dicData8, dicData9, dicData10, dicData11, dicData12, nil];
    
    for (NSDictionary *dicData in chartListAry) {
    
        AnchorItem *anchorItem = [AnchorItem new];
        anchorItem.y1Value = [[dicData objectForKey:@"roi"] floatValue];
        anchorItem.y2Value = [[dicData objectForKey:@"cost"] floatValue];
        anchorItem.xDateLabel = [dicData objectForKey:@"dd"];
        
        [self.anchorDataAry addObject:anchorItem];
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
    self.lineChartView.yTextColor = [UIColor whiteColor];
    self.lineChartView.y1LineColorLower = [UIColor greenColor];
    self.lineChartView.y1LineColorUpper = [UIColor redColor];
    self.lineChartView.y2LineColor = [UIColor colorWithRed:12/255.0 green:139/255.0 blue:207/255.0 alpha:1];
    self.lineChartView.dataSourceAry = self.anchorDataAry;
    [self.view addSubview:self.lineChartView];//
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
