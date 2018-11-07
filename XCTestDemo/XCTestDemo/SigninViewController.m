//
//  SigninViewController.m
//  XCTestDemo
//
//  Created by uwei on 9/21/16.
//  Copyright © 2016 Tencent. All rights reserved.
//

#import "SigninViewController.h"
#define kSignedTimesKey @"Signed in times"
@interface SigninViewController ()
@property (weak, nonatomic) IBOutlet UILabel *signinTimesLabel;

@end

@implementation SigninViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSInteger times = [[NSUserDefaults standardUserDefaults] integerForKey:kSignedTimesKey];
    self.signinTimesLabel.text = [NSString stringWithFormat:@"%ld", times];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)signin:(UISwitch *)sender {
    NSInteger times = [[NSUserDefaults standardUserDefaults] integerForKey:kSignedTimesKey];
    if (sender.on) {
        times++;
    } else {
        times--;
    }
    
    self.signinTimesLabel.text = [NSString stringWithFormat:@"%ld", times];
    
    [[NSUserDefaults standardUserDefaults] setInteger:times forKey:kSignedTimesKey];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
