#line 1 "Tweak.xm"
#import <AudioToolbox/AudioToolbox.h>
#import <AVFoundation/AVFoundation.h>

@interface SBFAuthenticationRequest : NSObject;

@property (nonatomic,copy,readonly) NSString *passcode;


-(long long)_evaluateAuthenticationAttempt:(SBFAuthenticationRequest *)arg1 outError:(id)arg2;

-(void)removeTachanka;
@end


#define CONFIG_PATH "/var/mobile/Library/Preferences/com.panjaco.tachankadeniedpreferences"
static id getConfigValue(NSString *key){
	return [[[NSUserDefaults standardUserDefaults] persistentDomainForName:@(CONFIG_PATH)] valueForKey:key];
}

UIImage *tachankaImage;
UIImageView *imageView;
AVAudioPlayer *player = nil;




#include <substrate.h>
#if defined(__clang__)
#if __has_feature(objc_arc)
#define _LOGOS_SELF_TYPE_NORMAL __unsafe_unretained
#define _LOGOS_SELF_TYPE_INIT __attribute__((ns_consumed))
#define _LOGOS_SELF_CONST const
#define _LOGOS_RETURN_RETAINED __attribute__((ns_returns_retained))
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif

@class SBFUserAuthenticationController; 
static long long (*_logos_orig$_ungrouped$SBFUserAuthenticationController$_evaluateAuthenticationAttempt$outError$)(_LOGOS_SELF_TYPE_NORMAL SBFUserAuthenticationController* _LOGOS_SELF_CONST, SEL, SBFAuthenticationRequest *, id); static long long _logos_method$_ungrouped$SBFUserAuthenticationController$_evaluateAuthenticationAttempt$outError$(_LOGOS_SELF_TYPE_NORMAL SBFUserAuthenticationController* _LOGOS_SELF_CONST, SEL, SBFAuthenticationRequest *, id); static void _logos_method$_ungrouped$SBFUserAuthenticationController$removeTachanka(_LOGOS_SELF_TYPE_NORMAL SBFUserAuthenticationController* _LOGOS_SELF_CONST, SEL); 

#line 26 "Tweak.xm"

static long long _logos_method$_ungrouped$SBFUserAuthenticationController$_evaluateAuthenticationAttempt$outError$(_LOGOS_SELF_TYPE_NORMAL SBFUserAuthenticationController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, SBFAuthenticationRequest * arg1, id arg2){
	
	long long success = (_logos_orig$_ungrouped$SBFUserAuthenticationController$_evaluateAuthenticationAttempt$outError$(self, _cmd, arg1, arg2) == 2);
	




	
	
	bool isEnabled = [getConfigValue(@"isEnabled") boolValue];
	if(isEnabled){
		
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
	return _logos_orig$_ungrouped$SBFUserAuthenticationController$_evaluateAuthenticationAttempt$outError$(self, _cmd, arg1, arg2);
}

static void _logos_method$_ungrouped$SBFUserAuthenticationController$removeTachanka(_LOGOS_SELF_TYPE_NORMAL SBFUserAuthenticationController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd){
	[imageView removeFromSuperview];
	imageView = nil;
}

static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$SBFUserAuthenticationController = objc_getClass("SBFUserAuthenticationController"); MSHookMessageEx(_logos_class$_ungrouped$SBFUserAuthenticationController, @selector(_evaluateAuthenticationAttempt:outError:), (IMP)&_logos_method$_ungrouped$SBFUserAuthenticationController$_evaluateAuthenticationAttempt$outError$, (IMP*)&_logos_orig$_ungrouped$SBFUserAuthenticationController$_evaluateAuthenticationAttempt$outError$);{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$SBFUserAuthenticationController, @selector(removeTachanka), (IMP)&_logos_method$_ungrouped$SBFUserAuthenticationController$removeTachanka, _typeEncoding); }} }
#line 68 "Tweak.xm"
