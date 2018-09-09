#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSError *err = nil;
    AVAudioSession *auSess = [AVAudioSession sharedInstance];
    //设置会话类别
    [auSess setCategory:AVAudioSessionCategoryPlayAndRecord error:&err];
    //设置应用模式
    [auSess setMode:AVAudioSessionModeVoiceChat error:nil];
    //设置监听
    NSNotificationCenter* nc = [NSNotificationCenter defaultCenter];
    [nc addObserver:self selector:@selector(adInterruption:) name:AVAudioSessionInterruptionNotification object:auSess];
    //激活会话
    if(err){
        NSLog(@"Error creating session: %@", [err description]);
    }else{
        [auSess setActive:YES error:nil];
    }
}

//响应打断事件监听方法
-(void)adInterruption:(NSNotification *)notification{
    //获取事件信息
    NSDictionary *info = notification.userInfo;
    
    //判断事件内容
    // AVAudioSessionInterruptionTypeBegan 被打断
    // AVAudioSessionInterruptionTypeEnded 打断结束
    AVAudioSessionInterruptionType type = [info[AVAudioSessionInterruptionTypeKey] unsignedIntegerValue];
    
    if (type == AVAudioSessionInterruptionTypeBegan) {
        //被打断,停止操作和相关动作
        
    } else {
        //打断结束，准备回复操作
        //近一步判断，系统是否通知可以恢复操作
        AVAudioSessionInterruptionOptions options = [info[AVAudioSessionInterruptionOptionKey] unsignedIntegerValue];
        if (options == AVAudioSessionInterruptionOptionShouldResume) {
            // 开始恢复...
        }
    }
}
//响应设置改变事件方法
-(void)adRouteChange:(NSNotification *)notification{
    //获取事件信息
    NSDictionary *info = notification.userInfo;
    //判断事件内容
    AVAudioSessionRouteChangeReason reason = [info[AVAudioSessionRouteChangeReasonKey] unsignedIntegerValue];
    
    //旧音频设备断开
    if (reason == AVAudioSessionRouteChangeReasonOldDeviceUnavailable) {
        
        //获取上一线路描述信息并获取上一线路的输出设备类型
        AVAudioSessionRouteDescription *previousRoute = info[AVAudioSessionRouteChangePreviousRouteKey];
        AVAudioSessionPortDescription *previousOutput = previousRoute.outputs[0];
        NSString *portType = previousOutput.portType;
        
        if ([portType isEqualToString:AVAudioSessionPortHeadphones]) {
            
            //在这里暂停播放
        }
    }
}


#pragma mark AVAudioSession的代理事件
-(void)beginInterruption{
    //Audio 被终断时调用
}
-(void)endInterruption{
    //终断 Audio的事件结束后调用
}
-(void)endInterruptionWithFlags:(NSUInteger)flags{
    //终断 Audio的事件结束后调用,带参数（标识符）
}
-(void)inputIsAvailableChanged:(BOOL)isInputAvailable{
    //通知input设备是有效的或者无效的
    NSLog(@"%@", isInputAvailable ? @"YES" : @"NO");
}







// 详细说明
-(void) test{
    
    NSError *err = nil;
    AVAudioSession *auSess = [AVAudioSession sharedInstance];
    
#pragma mark Category 类别说明，APP运行中可以动态切换
    /*
     /// Ambient
     //用于非以语音为主的应用，使用这个category的应用会随着静音键和屏幕关闭而静音。
     //并且不会中止其它应用播放声音，可以和其它自带应用如iPod，safari等同时播放声音。
     //注意：该Category无法在后台播放声音
     
     /// SoloAmbient
     //类似于Ambient不同之处在于它会中止其它应用播放声音。
     //这个category为默认category。该Category无法在后台播放声音
     
     /// Playback
     //用于以语音为主的应用，使用这个category的应用不会随着静音键和屏幕关闭而静音。可在后台播放声音
     
     /// Record
     //用于需要录音的应用，设置该category后，除了来电铃声，闹钟或日历提醒之外的其它系统声音都不会被播放。
     //该Category只提供单纯录音功能。
     
     /// MultiRoute
     //这个类别可以实现同时可以有多种输出，例如：usb和耳机同时输出，但并非所有输入输出方式均支持.
     //输入包括：AVAudioSessionPortUSBAudio/HeadsetMic/BuiltInMic;
     //输出包括：AVAudioSessionPortUSBAudio /LineOut/Headphones/HDMI/BuiltInSpeaker
     
     /// PlayAndRecord
     //用于既需要播放声音又需要录音的应用，语音聊天应用(如微信）应该使用这个category。该Category提供录音和播放功能。
     //如果你的应用需要用到iPhone上的听筒，该category是你唯一的选择，在该Category下声音的默认出口为听筒（在没有外接设备的情况下）。
     
     Category       播放/录音           打断其他不支持混音APP    被静音键或锁屏键静音
     Ambient        只支持播放               否                       是
     MultiRoute     支持播放，支持录制         是                     否
     PlayAndRecord  支持播放，支持录制      默认YES，可以重写为NO        否
     Playback       只支持播放           默认YES，可以重写为NO           否
     Record         只支持录制               是                       否（锁屏下仍可录制）
     SoloAmbient    只支持播放               是                        是
     
     */
    [auSess setCategory:AVAudioSessionCategoryPlayAndRecord error:&err];
    
    
#pragma mark CategoryOption 类别选项，微调类别特性，选择音频输出方式
    /*
     DefaultToSpeaker   设置默认输出音频到扬声器
     可用类别：AVAudioSessionCategoryPlayAndRecord
     
     MixWithOthers  可以和其他后台App进行混音
     可用类别：AVAudioSessionCategoryPlayAndRecord/Playback/MultiRoute
     
     DuckOthers 系统智能调低其他APP音频音量
     可用类别：AVAudioSessionCategoryAmbient/PlayAndRecord/Playback/MultiRoute
     
     AllowBluetooth 支持蓝牙耳机
     可用类别：AVAudioSessionCategoryRecord/PlayAndRecord
     
     支持蓝牙A2DP耳机和AirPlay
     AllowAirPlay
     AllowBluetoothA2DP
     InterruptSpokenAudioAndMixWithOthers
     
     */
    [auSess setCategory:AVAudioSessionCategoryPlayAndRecord withOptions:AVAudioSessionCategoryOptionDefaultToSpeaker error:nil];
    
    
#pragma mark 也可以通过AVAudioSessionPortOverride选择音频输出
    //不要覆盖输出音频端口。使用此选项将音频输出设备返回到当前音频类别的默认状态。
    [auSess overrideOutputAudioPort:AVAudioSessionPortOverrideNone error:nil];
    //覆盖当前输入和输出，设置音频输出设备为内置扬声器和麦克风。仅适用于AVAudioSessionCategoryPlayAndRecord类别。
    [auSess overrideOutputAudioPort:AVAudioSessionPortOverrideSpeaker error:nil];
    
    
#pragma mark AVAudioSessionMode 前人总结的类别组合方案，可直接选择，并会进行约束，特定模式只能使用特定Category
    /*  可以在设置完 Category 后再设置 mode
     
     Default    所有类别
     
     GameChat
     游戏录制，由GKVoiceChat自动设置，无需手动调用:AVAudioSessionCategoryPlayAndRecord
     适用于游戏App的采集和播放，比如“GKVoiceChat”对象，一般不需要手动设置
     
     VideoChat
     视频通话:AVAudioSessionCategoryPlayAndRecord
     主要用于视频通话，比如QQ视频、FaceTime。时系统也会选择最佳的输入设备，比如插上耳机就使用耳机上的麦克风进行采集并且会设置类别的选项为"AVAudioSessionCategoryOptionAllowBluetooth" 和 "AVAudioSessionCategoryOptionDefaultToSpeaker"
     
     VoiceCha
     VoIP: AVAudioSessionCategoryPlayAndRecord
     此时系统会选择最佳的输入设备，比如插上耳机就使用耳机上的麦克风进行采集。此时有个副作用，他会设置类别的选项为"AVAudioSessionCategoryOptionAllowBluetooth"从而支持蓝牙耳机。
     
     Measurement    最小系统:AVAudioSessionCategoryPlayAndRecord/Record/Playback
     SpokenAudio
     MoviePlayback  视频播放:AVAudioSessionCategoryPlayback
     VideoRecording 录制视频时:AVAudioSessionCategoryPlayAndRecord/Record
     */
    [auSess setMode:AVAudioSessionModeVideoRecording error:nil];
    
    
#pragma makr 通过NSNotificationCenter 监听 AVAudioSession 事件
    // InterruptionNotification 打断事件监听
    /*
     其他APP或者电话会中断我们的APP音频，所以相应的我们要做出处理。
     我们可以通过监听AVAudioSessionInterruptionNotification这个key获取音频中断事件
     
     回调回来Userinfo有键值:
     AVAudioSessionInterruptionTypeKey：
     取值AVAudioSessionInterruptionTypeBegan表示中断开始
     取值AVAudioSessionInterruptionTypeEnded表示中断结束
     中断开始：我们需要做的是保存好播放状态，上下文，更新用户界面等
     中断结束：我们要做的是恢复好状态和上下文，更新用户界面，根据需求准备好之后选择是否激活我们session。
     
     选择不同的音频播放技术，处理中断方式也有差别，具体如下:
     
     System Sound Services：使用 System Sound Services 播发音频，系统会自动处理，不受APP控制，当中断发生时，音频播放会静音，当中断结束后，音频播放会恢复。
     
     AV Foundation framework：AVAudioPlayer 类和 AVAudioRecorder 类提供了中断开始和结束的 Delegate 回调方法来处理中断。中断发生，系统会自动停止播放，需要做的是记录播放时间等状态，更新用户界面，等中断结束后，再次调用播放方法，系统会自动激活session。
     
     Audio Queue Services, I/O audio unit：使用aduio unit这些技术需要处理中断，需要做的是记录播放或者录制的位置，中断结束后自己恢复audio session。
     
     OpenAL：使用 OpenAL 播放时，同样需要自己监听中断。管理 OpenAL上下文，用户中断结束后恢复audio session。
     
     需要注意的是：
     1. 有中断开始事件，不一定对应有中断结束事件，所以需要在用户进入前台，点击UI操作的时候，需要保存好播放状态和对Audio Session管理，以便不影响APP的音频功能。
     2.音频资源竞争上，一定是电话优先。
     3. AVAudioSession同样可以监听外设音频状态，比如耳机拔入拔出。
     
     */
    NSNotificationCenter* nc = [NSNotificationCenter defaultCenter];
    [nc addObserver:self selector:@selector(adInterruption:) name:AVAudioSessionInterruptionNotification object:auSess];
    
    // InterruptionNotification 设备改变事件监听
    [nc addObserver:self selector:@selector(adRouteChange:) name:AVAudioSessionRouteChangeNotification object:auSess];
    
    if(err){
        NSLog(@"Error creating session: %@", [err description]);
    }else{
        [auSess setActive:YES error:nil];
    }
    
}


@end
