//
//  AnswerTests.m
//  MyBrowseOverflow
//
//  Created by Rian Fowler on 2013-12-08.
//  Copyright (c) 2013 Rian Fowler. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Answer.h"
#import "Person.h"

@interface AnswerTests : XCTestCase {
    Answer * answer;
    Answer * otherAnswer;
}

@end

@implementation AnswerTests

- (void)setUp
{
    [super setUp];
    answer = [[Answer alloc] init];
    answer.text = @"The answer is 42";
    answer.person = [[Person alloc] initWithName:@"Graham Lee" avatarLocation:@"http://example.com/avatar.png"];
    answer.score = 42;
    
    otherAnswer = [[Answer alloc] init];
    otherAnswer.text = @"I have the answer you need";
    otherAnswer.score = 42;
    // Put setup code here; it will be run once, before the first test case.
}

-(void)testAnswerHasSomeText {
    XCTAssertEqualObjects(answer.text, @"The answer is 42", @"Answers need to contain some text");
}

-(void)testSomeoneProvidedTheAnswer {
    XCTAssertTrue([answer.person isKindOfClass: [Person class]], @"A Person gave the Answer");
}

-(void)testAnswersNotAcceptedByDefault {
    XCTAssertFalse(answer.accepted, @"Answer not accepted by default");
}

-(void)testAnswerCanBeAccepted {
    XCTAssertNoThrow(answer.accepted = YES, @"It is possible to accept an answer.");
}

-(void)testAnswerHasAScore {
    XCTAssertTrue(answer.score == 42, @"Answer's score can be retrieved");
}

-(void)testAcceptedAnswerComesBeforeUnaccepted {
    otherAnswer.accepted = YES;
    otherAnswer.score = answer.score + 10;
    
    XCTAssertEqual([answer compare: otherAnswer], NSOrderedDescending, @"Accepted answer should come first");
    
    XCTAssertEqual([otherAnswer compare: answer], NSOrderedAscending, @"Unaccepted answer should come last");
}

-(void)testAnswersWithEqualScoresCompareEqually {
    XCTAssertEqual([answer compare: otherAnswer], NSOrderedSame, @"Both ansewrs of equal rank");
    
    XCTAssertEqual([otherAnswer compare: answer], NSOrderedSame, @"Each answer has the same rank");
}

-(void)testLowerScoringAnswerComesAfterHigher {
    otherAnswer.score = answer.score + 10;
    XCTAssertEqual([answer compare: otherAnswer], NSOrderedDescending	, @"Higher score comes first");
    XCTAssertEqual([otherAnswer compare: answer], NSOrderedAscending, @"Lower score comes last");
}

- (void)tearDown
{
    // Put teardown code here; it will be run once, after the last test case.
    answer = nil;
    [super tearDown];
}



@end
