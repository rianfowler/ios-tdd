//
//  Answer.h
//  MyBrowseOverflow
//
//  Created by Rian Fowler on 2013-12-08.
//  Copyright (c) 2013 Rian Fowler. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

@interface Answer : NSObject

@property NSString * text;
@property Person * person;
@property NSInteger score;
@property (getter=isAccepted)BOOL accepted;

-(NSComparisonResult)compare:(Answer*)otherAnswer; 


@end
