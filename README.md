AQSEventAggregator
==================

![](http://img.shields.io/cocoapods/v/AQSEventAggregator.svg?style=flat) ![](http://img.shields.io/travis/AquaSupport/AQSEventAggregator.svg?style=flat)

An aggregator for [AQSEvent](https://github.com/AquaSupport/AQSEvent)

- [Usage](#usage)
  - [Define your aggregator](#define-your-aggregator)
  - [Starting aggregation](#starting-aggregation)
  - [Handling events more finely](#handling-events-more-finely)
- [Documentation](#documentation)
- [Related Projects](#related-projects)

Usage
---

### Define your aggregator

At first, subclass `AQSEventAggregator`,

```objc
@interface AppEventAggregator : AQSEventAggregator
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
    //
    // Typically, send the event to tracking services such as Google Analytics, MixPanel etc.
}

@end
```

### Starting aggregation

As follows to start aggregation.

```objc
[[AppEventAggregator sharedAggregator] startAggregation];
```

### Handling events more finely

To handle events more finely, override following methods. (These features are currently not supported.)

```objc
// @optional
- (NSArray *)blackListForEvents;
// @optional
- (BOOL)testForEvent:(NSString *)eventName args:(NSDictionary *)eventArgs; 
```

Documentation
---

[appledoc](https://dl.dropboxusercontent.com/u/7817937/___doc___AQSEventAggregator/html/index.html) is provided.

Related Projects
---

- [AQSEvent](https://github.com/AquaSupport/AQSEvent) - Helpers for measurement events.

LICENSE
---

```
The MIT License (MIT)

Copyright (c) 2014 AquaSupport

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```
