//
//  TopicTests.m
//  MyBrowseOverflow
//
//  Created by Rian Fowler on 2013-12-07.
//  Copyright (c) 2013 Rian Fowler. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Topic.h"

@interface TopicTests : XCTestCase {
    Topic * topic;
}

@end

@implementation TopicTests

- (void)setUp
{
    [super setUp];
    
    topic = [[Topic alloc] initWithName:@"iPhone" tag:@"iphone"];
    // Put setup code here; it will be run once, before the first test case.
}

-(void)testThatTopicExists {
    XCTAssertNotNil(topic, @"should be able to create a Topic instance");
}

-(void)testThatTopicCanBeNamed {
    XCTAssertEqualObjects(topic.name, @"iPhone", @"the Topic should have the name I gave it");
}

-(void)testThatTopicHasATag {
    XCTAssertEqualObjects(topic.tag, @"iphone", @"Topics needs to have tags");
}

-(void)testForAListOfQuestions {
    XCTAssertTrue([[topic recentQuestions] isKindOfClass:[NSArray class]], @"Topics should provide a list of recent questions");
}

- (void)tearDown
{
    topic = nil;
    // Put teardown code here; it will be run once, after the last test case.
    [super tearDown];
}

//- (void)testExample
//{
//    XCTFail(@"No implementation for \"%s\"", __PRETTY_FUNCTION__);
//}

@end
