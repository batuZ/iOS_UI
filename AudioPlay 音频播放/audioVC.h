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
<AVAudioPlayerDelegate>
{
    AVAudioPlayer* _player;
    NSTimer* _timer;
}
@property (weak, nonatomic) IBOutlet UISlider *progressItm;
@property (weak, nonatomic) IBOutlet UISlider *voltem;

@end
