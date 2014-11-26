#!/bin/bash

xcodebuild -workspace AQSEventAggregator.xcworkspace -scheme AQSEventAggregator -destination 'platform=iOS Simulator,name=iPhone 6,OS=8.1' GCC_INSTRUMENT_PROGRAM_FLOW_ARCS=YES GCC_GENERATE_TEST_COVERAGE_FILES=YES test | xcpretty -c && exit ${PIPESTATUS[0]}

