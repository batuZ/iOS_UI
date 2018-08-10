//
//  MoviePlayer.m
//  MPMoviePlayer 视频播放
//
//  Created by 张智 on 2018/8/10.
//  Copyright © 2018年 gvitech. All rights reserved.
//

#import "MoviePlayer.h"

@interface MoviePlayer ()

@end

@implementation MoviePlayer

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)MPMoviePlayerViewControllerPress:(UIButton *)sender {
    NSURL* url = [NSURL fileURLWithPath:@"/Users/Batu/MyData/资料/rubyVideo/videos/08Rails框架基础/01重新认识Rails.avi"];
    playerVC = [[MPMoviePlayerController alloc] initWithContentURL:url];
    
    [self.view addSubview:playerVC.view];
}

- (IBAction)MPMoviePlayerControllerPress:(UIButton *)sender {
    NSURL* url = [NSURL fileURLWithPath:@"/Users/Batu/MyData/资料/rubyVideo/videos/08Rails框架基础/01重新认识Rails.avi"];
    playerC = [[MPMoviePlayerController alloc]initWithContentURL:url];
    playerC.view.frame = self.view.bounds;
    
    [playerC prepareToPlay];
    [self.view addSubview:playerC.view];
}

- (IBAction)AVPlayerViewControllerPress:(UIButton *)sender {
    
}



















@end
