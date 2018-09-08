//
//  audioVC.h
//  AudioPlay 音频播放
//
//  Created by 张智 on 2018/8/9.
//  Copyright © 2018年 gvitech. All rights reserved.
//

#import <UIKit/UIKit.h>
//音频框架
#import <AVFoundation/AVFoundation.h>

@interface audioVC : UIViewController
<AVAudioRecorderDelegate,AVAudioPlayerDelegate>
{
    //录音机
    AVAudioRecorder* _adRecorder;
    BOOL _isSwitch;
    int _count;
    
    //播放器
    AVAudioPlayer* _player;
    
    NSURL *_url;
    NSTimer* _timer;
}
//播放进度
@property (weak, nonatomic) IBOutlet UISlider *progressItm;
//音量
@property (weak, nonatomic) IBOutlet UISlider *voltem;

//录音时长
@property (weak, nonatomic) IBOutlet UILabel *recoderInfo;

//录音按钮
@property (weak, nonatomic) IBOutlet UIButton *recoderBtn;

@end
