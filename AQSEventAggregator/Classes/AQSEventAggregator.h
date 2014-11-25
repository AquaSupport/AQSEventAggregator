//
//  AQSEventAggregator.h
//  AQSEventAggregator
//
//  Created by kaiinui on 2014/11/26.
//  Copyright (c) 2014 Aquamarine. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  @subclass
 *
 *  This class should be subclassed to be used.
 *
 *  This class aggregates posted `AQSEvent`s with filters (`- passingEvents`) and you can write your code to process the passing events with `- didReceiveEvent:arg:`
 *
 *  Common use case is to do track the passing events in `- didReceiveEvent:arg:`.
 */
@interface AQSEventAggregator : NSObject

# pragma mark - Instantiation
/** @name Instantiation */

/**
 *  @return Singleton instance
 */
+ (instancetype)sharedAggregator;

# pragma mark - Starting Observation
/** @name Starting Observation */

/**
 *  Start event observation
 */
- (void)startAggregation;

# pragma mark - Override methods
/** @name Override Methods */

/**
 *  @override
 *
 *  This method is invoked when the aggregator recieves events that passing tests (`- passingEvents`)
 *  This method should send the event to tracking tool.
 *
 *  @param eventName Event's name
 *  @param eventArgs Event's args or empty dictionary.
 */
- (void)didReceiveEvent:(NSString *)eventName arg:(NSDictionary *)eventArgs;

/**
 *  @override
 *
 *  This method should return a list of event names as `NSString` that you want to track.
 *  For events that passing the list, `- didReceiveEvent:arg:` is called.
 *
 *  @return whitelisted event names
 */
- (NSArray /* NSString */ *)passingEvents;

@end
