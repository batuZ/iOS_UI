//
//  audioVC.m
//  AudioPlay 音频播放
//
//  Created by 张智 on 2018/8/9.
//  Copyright © 2018年 gvitech. All rights reserved.
//

#import "audioVC.h"


@implementation audioVC

- (void)viewDidLoad {
    [super viewDidLoad];
    //声音地址,本地文件模拟URL
    NSURL* url = [NSURL fileURLWithPath:@"/Users/Batu/Music/Mato Grosso - The Last Of The Mohicans.mp3"];
    //NSURL* url = [NSURL URLWithString:@""];
    //创建播放器
    _player = [[AVAudioPlayer alloc]initWithContentsOfURL:url error:nil];
    
    //解码
    [_player prepareToPlay];
    
    //循环方式，-1为无限循环
    _player.numberOfLoops = 1;
    
    //设置音量
    _player.volume = 0.5;
}


- (IBAction)playBtnPress:(id)sender {
    [_player play];
    
    //启动timer更新进度条
    _timer = [NSTimer scheduledTimerWithTimeInterval:0.2 repeats:YES block:^(NSTimer* tm){
        self->_progressItm.value = self->_player.currentTime/self->_player.duration;
    }];
    
    NSLog(@"播放");
}
- (IBAction)stopBtnPress:(id)sender {
    [_player stop];
     NSLog(@"停止");
    _player.currentTime = 0;
}
- (IBAction)pauseBtnPress:(id)sender {
    [_player pause];
     NSLog(@"暂停");
}
//音量
- (IBAction)volumeChange:(UISlider *)sender {
    _player.volume = sender.value;
    NSLog(@"音量：%f",sender.value);
}

//静音
- (IBAction)jingyin:(UISwitch *)sender {
    if(sender.on)
        _player.volume=0;
    else
        _player.volume=_voltem.value;
}

//进度及控制
- (IBAction)progressChange:(UISlider *)sender {
    _player.currentTime = _player.duration*sender.value;
    NSLog(@"设置进度为：%f",sender.value);
}

@end
