//
//  GDParticleGalaxy.h
//  MenuTest
//
//  Created by Doug Whitmore on 7/17/11.
//  Copyright 2011 Apple Computer Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface GDParticleGalaxy : CCNode
{
    
}

@property (nonatomic, retain) CCParticleGalaxy* particleEmitter;
@property (nonatomic, retain) CCSprite* center;
@property float rotationalSpeed;

+ (GDParticleGalaxy*) galaxy;

- (id) initWithTotalParticles:(NSUInteger)numberOfParticles;

@end