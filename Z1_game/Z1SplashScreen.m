//
//  HelloWorldLayer.m
//  Z1_game
//
//  Created by Doug Whitmore on 7/17/11.
//  Copyright Good Doug 2011. All rights reserved.
//


#import "Z1SplashScreen.h"
#import "Z1MenuScreen.h"
#import "GDSoundsManager.h"

@interface Z1SplashScreen ()

@property BOOL movedOn;

@end

@implementation Z1SplashScreen

@synthesize movedOn;

+(CCScene *) scene
{
	CCScene *scene = [CCScene node];
	
	Z1SplashScreen *layer = [Z1SplashScreen node];
	
	[scene addChild: layer];
	
	return scene;
}

- (void) dealloc
{
    
    [super dealloc];
}

-(id) init
{
	if(( self = [self initWithEffectNames:[NSArray array]] )) 
    {        
        self.isKeyboardEnabled = YES;
        self.isMouseEnabled = YES;
        [[GDSoundsManager sharedSoundsManager] playSoundForName:@"junivision"];
        
        CGSize size = [[CCDirector sharedDirector] winSize];
		CCSprite* background = [CCSprite spriteWithFile:@"title-screen-start.png"];
        background.position = ccp(size.width / 2.0, size.height /2);
        [self addChild:background z:0];
        
        // add press any key label
        CCLabelTTF* pressKeyLabel = [CCLabelTTF labelWithString:@"Press any key" fontName:@"Helvetica" fontSize:48];
        pressKeyLabel.position = ccp(size.width / 2.0, 60.0);
        pressKeyLabel.opacity = 0.0;
        CCFadeIn* fadeAction = [CCFadeIn actionWithDuration:1.0];
        CCDelayTime* delayAction = [CCDelayTime actionWithDuration:4.5];
        CCCallFunc* moveOnAction = [CCCallFunc actionWithTarget:self selector:@selector(moveOn:)];
        CCDelayTime* delay10Action = [CCDelayTime actionWithDuration:10];
        [pressKeyLabel runAction:[CCSequence actions:delayAction, fadeAction, delay10Action, moveOnAction, nil]];
        [self addChild:pressKeyLabel z:10];
	}
	return self;
}

- (BOOL) ccKeyUp:(NSEvent *)event
{
    [self moveOn:self];
    
    return YES;
}

- (BOOL) ccMouseUp:(NSEvent *)event
{
    [self moveOn:self];
    return YES;
}

- (void) moveOn:(id)sender
{
    self.movedOn = YES;
    CCTransitionScene* trans = [CCTransitionFade transitionWithDuration:1 scene:[Z1MenuScreen scene] withColor:ccWHITE];
    [[CCDirector sharedDirector] replaceScene:trans];
}

@end
