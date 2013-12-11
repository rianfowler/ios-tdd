//
//  Answer.m
//  MyBrowseOverflow
//
//  Created by Rian Fowler on 2013-12-08.
//  Copyright (c) 2013 Rian Fowler. All rights reserved.
//

#import "Answer.h"

@implementation Answer

-(instancetype)init {
    if (self = [super init]) {
        _accepted = NO;
    }
    
    return self; 
}

-(NSComparisonResult)compare:(Answer *)otherAnswer {
    if (_accepted && !(otherAnswer.accepted)) {
        return NSOrderedAscending;
    } else if (!_accepted && otherAnswer.accepted) {
        return NSOrderedDescending;
    }
    
    if (_score > otherAnswer.score) {
        return NSOrderedAscending;
    } else if (_score < otherAnswer.score) {
        return NSOrderedDescending;
    } else {
        return NSOrderedSame;
    }
}

@end
