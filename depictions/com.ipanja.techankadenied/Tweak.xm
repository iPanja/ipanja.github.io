#import <AudioToolbox/AudioToolbox.h>
#import <AVFoundation/AVFoundation.h>

@interface SBFAuthenticationRequest : NSObject;
//Properties
@property (nonatomic,copy,readonly) NSString *passcode;
//Methods
//-(id)initForPasscode:(NSString *)arg1 source:(id)arg2;
-(long long)_evaluateAuthenticationAttempt:(SBFAuthenticationRequest *)arg1 outError:(id)arg2;
//Custom Methods
-(void)removeTachanka;
@end


#define CONFIG_PATH "/var/mobile/Library/Preferences/com.panjaco.tachankadeniedpreferences"
static id getConfigValue(NSString *key){
	return [[[NSUserDefaults standardUserDefaults] persistentDomainForName:@(CONFIG_PATH)] valueForKey:key];
}

UIImage *tachankaImage;
UIImageView *imageView;
AVAudioPlayer *player = nil;


//My hooks
%hook SBFUserAuthenticationController
-(long long)_evaluateAuthenticationAttempt:(SBFAuthenticationRequest *)arg1 outError:(id)arg2{
	//If orig returns 2, then the user was successfuly authenticated
	long long success = (%orig == 2);
	/*
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:@"%@", arg2] message: @"~Tachanka Denied" delegate: nil cancelButtonTitle: @"RUN" otherButtonTitles: nil];
	[alert show];
	[alert release];
	*/
	
	//Check if the tweak is enabled
	bool isEnabled = [getConfigValue(@"isEnabled") boolValue];
	if(isEnabled){
		//Check if the user was authenticated
		if(!success){
			if(!tachankaImage){
				tachankaImage = [UIImage imageWithContentsOfFile:@"/Library/Application Support/TachankaDenied.bundle/Tachanka.png"];
			}
			if(!imageView){
				imageView = [[UIImageView alloc] initWithImage: tachankaImage];
			}
			[imageView setFrame: CGRectMake(100, 400, 400, 400)];
			[[[UIApplication sharedApplication] keyWindow] addSubview: imageView];
			int duration = [getConfigValue(@"duration") integerValue];
			[self performSelector:@selector(removeTachanka) withObject: nil afterDelay: duration];
			if([getConfigValue(@"isAudioEnabled") boolValue]){
				if(player == nil){
					NSURL *url = [NSURL fileURLWithPath:@"Library/Application Support/TachankaDenied.bundle/audio.mp3"];
					player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
				}
				[player play];
			}
		}
	}
	return %orig;
}
%new
-(void)removeTachanka{
	[imageView removeFromSuperview];
	imageView = nil;
}
%end
