//
//  GDMenuScreen.m
//  Z1_game
//
//  Created by Doug Whitmore on 7/17/11.
//  Copyright 2011 Good Doug. All rights reserved.
//

#import "Z1MenuScreen.h"
#import "Z1CreditsScreen.h"


@implementation Z1MenuScreen

+(CCScene*) scene
{
    CCScene *scene = [CCScene node];
	
	Z1MenuScreen *layer = [Z1MenuScreen node];
	
	[scene addChild: layer];
	
	return scene;
}

- (id) init
{
    if ((self = [self initWithEffectNames:[NSArray arrayWithObjects:@"GDParticleGalaxy", nil]] ))
    {
        // now add buttons
        CCLabelTTF* menuLabelPlay = [CCLabelTTF labelWithString:@"Play" fontName:@"Helvetica" fontSize:48];
        CCMenuItemLabel* menuItemPlay = [CCMenuItemLabel itemWithLabel:menuLabelPlay block:^(id sender)
                                       {
                                           /*CCTransitionScene* trans = [CCTransitionFade transitionWithDuration:1 
                                                                                                         scene:[GameTestLayer scene]
                                                                                                     withColor:ccWHITE];
                                           [[CCDirector sharedDirector] pushScene:trans];*/
                                           NSLog(@"start new game");
                                       }];
        CCLabelTTF* menuLabelQuit = [CCLabelTTF labelWithString:@"Quit" fontName:@"Helvetica" fontSize:32];
        CCMenuItemLabel* menuItemQuit = [CCMenuItemLabel itemWithLabel:menuLabelQuit block:^(id sender)
                                       {
                                           [NSApp terminate:self];
                                       }];
        
        CCLabelTTF* menuLabelUDG = [CCLabelTTF labelWithString:@"uDevGames" fontName:@"Helvetica" fontSize:32];
        CCMenuItemLabel* menuItemUDG = [CCMenuItemLabel itemWithLabel:menuLabelUDG block:^(id sender)
                                      {
                                          [[NSWorkspace sharedWorkspace] openURL:[NSURL URLWithString:@"http://www.udevgames.com"]];
                                      }];
        
        CCLabelTTF* menuLabelCredits = [CCLabelTTF labelWithString:@"Credits" fontName:@"Helvetica" fontSize:32];
        CCMenuItemLabel* menuItemCredits = [CCMenuItemLabel itemWithLabel:menuLabelCredits block:^(id sender)
                                            {
                                                CCTransitionScene* trans = [CCTransitionFade transitionWithDuration:1 
                                                                                                             scene:[Z1CreditsScreen scene]
                                                                                                         withColor:ccWHITE];
                                                [[CCDirector sharedDirector] pushScene:trans];
                                                NSLog(@"credits screen");
                                            }];
        
        CCMenu* aMenu = [CCMenu menuWithItems:menuItemPlay, menuItemQuit, menuItemCredits, menuItemUDG, nil];
		[aMenu alignItemsVertically];
        self.isMouseEnabled = YES;
        CGSize size = [[CCDirector sharedDirector] winSize];
        
        aMenu.position = ccp(200.0f, size.height / 2.0);
        [self addChild:aMenu z:10];

    }
    return self;
}

@end