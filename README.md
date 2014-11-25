AQSEventAggregator
==================

An aggregator for [AQSEvent](https://github.com/AquaSupport/AQSEvent)

Usage
---

At first, subclass `AQSEventAggregator`,

```objc
@interface AppEventAggregator
@end

@implementation

// @override
- (NSArray *)whiteListForEvents {
    return @{
        @"app/run_at_first",
        @"app/did_become_active",
        @"app/permission/photo_library/granted"
    };
}

- (void)didReceiveEvent:(NSString *)eventName args:(NSDictionary *)eventArgs {
    // Do something when it receives AQSEvent.
}

@end
```

Then as follows to start aggregation.

```objc
[[AQSEventAggregator sharedAggregator] start];
```

To handle events more finely, override following methods.

```
// @optional
- (NSArray *)blackListForEvents;
// @optional
- (BOOL)testForEvent:(NSString *)eventName args:(NSDictionary *)eventArgs; 
```
