//
//  MoviePlayer.h
//  MPMoviePlayer 视频播放
//
//  Created by 张智 on 2018/8/10.
//  Copyright © 2018年 gvitech. All rights reserved.
//

#import <UIKit/UIKit.h>
//支持库
#import <MediaPlayer/MediaPlayer.h>
#import <AVKit/AVKit.h>
@interface MoviePlayer : UIViewController
{
    MPMoviePlayerViewController* playerVC;
    MPMoviePlayerController* playerC;
    AVPlayerViewController* avPlayerVC;
}
@end
