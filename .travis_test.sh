#!/bin/bash

xcodebuild -workspace AQSEventAggregator.xcworkspace -scheme AQSEventAggregator -destination 'platform=iOS Simulator,name=iPhone 6,OS=8.1' test | xcpretty -c && exit ${PIPESTATUS[0]}

