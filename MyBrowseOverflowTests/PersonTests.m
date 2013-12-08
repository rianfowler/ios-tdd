//
//  PersonTests.m
//  MyBrowseOverflow
//
//  Created by Rian Fowler on 2013-12-08.
//  Copyright (c) 2013 Rian Fowler. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Person.h"

@interface PersonTests : XCTestCase {
    Person * person;
}

@end

@implementation PersonTests

- (void)setUp
{
    [super setUp];
    
    person = [[Person alloc] initWithName: @"Graham Lee" avatarLocation: @"http://example.com/avatar.png"];
    // Put setup code here; it will be run once, before the first test case.
}

-(void)testThatPersonHasRightName {
    XCTAssertEqualObjects(person.name, @"Graham Lee", @"expecting a peson to provide its name");
}

-(void)testThatPersonHasAnAvatarURL {
    NSURL * url = person.avatarLocation;
    XCTAssertEqualObjects([url absoluteString], @"http://example.com/avatar.png", @"The Person's avatar should be represented by a URL");
}

- (void)tearDown
{
    // Put teardown code here; it will be run once, after the last test case.
    [super tearDown];
}


@end
