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
    _isSwitch = YES;
    _recoderInfo.text =@"00:00";
    
}
#pragma mark 录音
- (IBAction)recoderPress:(UIButton *)sender {
    //判断录音机状态，是否在正录音,判断nil是为了第一次执对象为空时不报错
    if(_adRecorder!=nil && _adRecorder.isRecording)
    {    //停
        [_adRecorder stop];
        [_recoderBtn setTitle:@"开始录音" forState:UIControlStateNormal];
        //设置计时器为初始值；
        if (_timer) {
            [_timer invalidate];
            _timer = nil;
        }
        _count = 0;
        _recoderInfo.text =@"00:00";
    }
    else
    {                  //开始
        _count = 0;
        _timer = [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(repeatShowTime:) userInfo:@"info" repeats:YES];
        
#pragma mark 下面设置录音文件的保存路径信息
        //获取Documents目录路径
        NSArray* pathArr = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
        NSString* dir = pathArr[0];
        NSString* filePath = [dir stringByAppendingString:@"testSound.wav"];
        _url = [NSURL fileURLWithPath:filePath];
        
#pragma mark 下面设置录音的参数和录音文件的保存路径等信息
        //创建一个Dictionary，用于保存录制属性
        NSMutableDictionary *recordSettings = [[NSMutableDictionary alloc]init];
        
        //设置录制音频的格式
        [recordSettings setObject:[NSNumber numberWithInt:kAudioFormatLinearPCM]forKey:AVFormatIDKey];
        
        //设置录制音频的采样率
        [recordSettings setObject:[NSNumber numberWithFloat:@"1".floatValue] forKey:AVSampleRateKey];
        
        //设置录制音频的通道数
        [recordSettings setObject:[NSNumber numberWithInt:(_isSwitch =/* DISABLES CODE */ (YES) ?2:1)]forKey:AVNumberOfChannelsKey];
        
        //设置录制音频采用高位优先的记录格式
        [recordSettings setObject:[NSNumber numberWithBool:YES]forKey:AVLinearPCMIsBigEndianKey];
        
        //设置采样信号采用浮点数
        [recordSettings setObject:[NSNumber numberWithBool:YES]forKey:AVLinearPCMIsFloatKey];
        
#pragma mark 到这里开始实例化录音对象
        //初始化AVAudioRecorder
        _adRecorder = [[AVAudioRecorder alloc] initWithURL:_url settings:recordSettings error:nil];
        _adRecorder.delegate =self;
        [_adRecorder record];
        
        //设置按钮的状态为录音
        [_recoderBtn setTitle:@"停止录音" forState:UIControlStateNormal];
    }
}
- (void)repeatShowTime:(NSTimer *)tempTimer {
    _count++;
    //设置在文本框上显示时间；
    _recoderInfo.text = [NSString stringWithFormat:@"%02d:%02d",_count/60,_count%60];
}

#pragma mark- 录制音频的代理方法
//-(void)audioRecorderBeginInterruption:(AVAudioRecorder *)recorder{
//    NSLog(@"---->被中断！");
//}
-(void)audioRecorderDidFinishRecording:(AVAudioRecorder *)aRecorder successfully:(BOOL)flag{
    if(flag){
        NSLog(@"---->录制完成！！");
    }
}




#pragma mark 播放
- (IBAction)playBtnPress:(id)sender {

//    NSURL* url = [NSURL fileURLWithPath:@"/Users/Batu/Music/Mato Grosso - The Last Of The Mohicans.mp3"];
    //NSURL* url = [NSURL URLWithString:@""];
    
    //创建播放器
    _player = [[AVAudioPlayer alloc]initWithContentsOfURL:_url error:nil];
    
    //播放前准备，如：下载、解码...
    [_player prepareToPlay];
    
    //循环方式，-1为无限循环
    _player.numberOfLoops = 1;
    
    //设置音量
    _player.volume = 1.0f;
    
    //播放
    [_player play];
    
    //启动timer更新进度条
    _timer = [NSTimer scheduledTimerWithTimeInterval:0.2 repeats:YES block:^(NSTimer* tm){
        self->_progressItm.value = self->_player.currentTime/self->_player.duration;
    }];
}

- (IBAction)stopBtnPress:(id)sender {
    [_player stop];
     NSLog(@"停止");
    //进度归零
    _player.currentTime = 0;
    //停止更新进度
    [_timer invalidate];
    _timer = nil;
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
        _player.volume = 0;
    else
        _player.volume = _voltem.value;
}
//进度显示及控制
- (IBAction)progressChange:(UISlider *)sender {
    _player.currentTime = _player.duration * sender.value;
    NSLog(@"设置进度为：%f",sender.value);
}
#pragma mark 播放代理
-(void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag
{
   NSLog(@"播放完成！");
}
@end
