//
//  Z1LevelManager.h
//  Z1_game
//
//  Created by Doug Whitmore on 9/16/11.
//  Copyright 2011 Good Doug. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface Z1LevelManager : NSObject
{
    NSArray* _levelList;
    int _currentLevelIndex;
}

@property (nonatomic, retain) NSArray* levelList;
@property int currentLevelIndex;

+ (NSArray*) defaultLevels;
+ (Z1LevelManager*) sharedLevelManager;

- (id) initWithLevelListFile:(NSString*)inFile;
- (id) initWithLevels:(NSArray*)inLevels;

- (CCScene*) levelSceneAtIndex:(int)whichIndex;

- (BOOL) moveToNextLevel;
- (CCScene*) nextGameScreen;

@end
