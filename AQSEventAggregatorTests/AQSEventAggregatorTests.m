//
//  AQSEventAggregatorTests.m
//  AQSEventAggregatorTests
//
//  Created by kaiinui on 2014/11/26.
//  Copyright (c) 2014年 Aquamarine. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import <OCMock.h>

#import "AQSEventAggregator.h"
#import <AQSEvent.h>

@interface AQSEventAggregatorTests : XCTestCase

@property AQSEventAggregator *aggregatorInstance;

@end

@implementation AQSEventAggregatorTests

- (void)setUp {
    [super setUp];
    
    _aggregatorInstance = [AQSEventAggregator sharedAggregator];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testItInvokesDidReceiveEventForPassingEvents {
    id mockAggregator = [OCMockObject partialMockForObject:_aggregatorInstance];
    NSArray *passingEvents = @[
                               @"whoa"
                               ];
    OCMStub([mockAggregator passingEvents]).andReturn(passingEvents);
    OCMExpect([mockAggregator didReceiveEvent:@"whoa" arg:@{}]);
    [mockAggregator startAggregation];
    
    [AQSEvent event:@"whoa" args:@{}];
    
    OCMVerifyAll(mockAggregator);
}

- (void)testItInvokesDidReceiveEventWithArgsForPassingEvents {
    id mockAggregator = [OCMockObject partialMockForObject:_aggregatorInstance];
    NSArray *passingEvents = @[
                               @"whoa"
                               ];
    OCMStub([mockAggregator passingEvents]).andReturn(passingEvents);
    OCMExpect([mockAggregator didReceiveEvent:@"whoa" arg:@{
                                                            @"arg": @"value"
                                                            }]);
    [mockAggregator startAggregation];
    
    [AQSEvent event:@"whoa" args:@{
                                   @"arg": @"value"
                                   }];
    
    OCMVerifyAll(mockAggregator);
}

- (void)testItDoesNotInvokeDidReceiveEventForPassingEvents {
    id mockAggregator = [OCMockObject partialMockForObject:_aggregatorInstance];
    NSArray *passingEvents = @[
                               @"notwhoa"
                               ];
    OCMStub([mockAggregator passingEvents]).andReturn(passingEvents);
    [[mockAggregator reject] didReceiveEvent:@"whoa" arg:@{}];
    [mockAggregator startAggregation];
    
    [AQSEvent event:@"whoa" args:@{}];
    
    OCMVerifyAll(mockAggregator);
}

@end
