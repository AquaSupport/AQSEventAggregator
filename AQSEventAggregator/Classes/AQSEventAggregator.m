//
//  AQSEventAggregator.m
//  AQSEventAggregator
//
//  Created by kaiinui on 2014/11/26.
//  Copyright (c) 2014 Aquamarine. All rights reserved.
//

#import "AQSEventAggregator.h"

#import <AQSEvent.h>
#import <AQSEventObserver.h>

@interface AQSEventAggregator ()

@property (nonatomic, strong) AQSEventObserver *observer;

@end

@implementation AQSEventAggregator

# pragma mark - Instantiation

+ (instancetype)sharedAggregator {
    static AQSEventAggregator *_instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[self alloc] init];
    });
    return _instance;
}

# pragma mark - Stating Observation

- (void)startAggregation {
    __weak typeof(self) wSelf = self;
    self.observer = [AQSEventObserver observerWithBlock:^(NSString *eventName, NSDictionary *eventArgs) {
        if ([wSelf isEventPassing:eventName arg:eventArgs] == NO) { return; }
        [wSelf didReceiveEvent:eventName arg:eventArgs];
    }];
}

# pragma mark - Override Methods

- (void)didReceiveEvent:(NSString *)eventName arg:(NSDictionary *)eventArgs {
    NSAssert(false, @"- didReceiveEvent:arg: should be overrided!");
}

- (NSArray *)passingEvents {
    NSAssert(false, @"- passingEvents should be overrided!");
    return @[];
}

# pragma mark - Helpers

- (BOOL)isEventPassing:(NSString *)eventName arg:(NSDictionary *)eventArgs {
    return [[self passingEvents] containsObject:eventName];
}

@end
