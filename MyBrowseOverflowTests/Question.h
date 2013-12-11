//
//  Question.h
//  MyBrowseOverflow
//
//  Created by Rian Fowler on 2013-12-07.
//  Copyright (c) 2013 Rian Fowler. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Answer;
@interface Question : NSObject

@property (retain) NSDate * date;
@property (copy) NSString * title;
@property NSInteger score;
@property (readonly) NSArray * answers;

-(void)addAnswer: (Answer *)answer;

@end
