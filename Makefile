PROJECT = AQSEventAggregator
TARGET = AQSEventAggregator
IOS_VERSION = 8.1
DEVICE = iPhone 6

test:
	xcodebuild \
	-workspace $(PROJECT).xcworkspace \
	-scheme $(TARGET) \
	-destination 'platform=iOS Simulator,name=$(DEVICE),OS=$(IOS_VERSION)' \
	GCC_INSTRUMENT_PROGRAM_FLOW_ARCS=YES \
	GCC_GENERATE_TEST_COVERAGE_FILES=YES \
	test | xcpretty -c && exit ${PIPESTATUS[0]}
coveralls:
	coveralls -r ./ -e Pods -e $(PROJECT)Tests
doc:
	appledoc \
	--prefix-merged-sections \
	--template "~/RubymineProjects/SwiftyDoc" \
	--ignore ".m" \
 	--ignore "Pods" \
 	--keep-undocumented-objects \
 	--keep-undocumented-members \
 	--create-html \
 	--no-create-docset \
 	--index-desc "README.md" \
 	--company-id "org.openaquamarine" \
 	--project-name="$(PROJECT)" \
 	--project-company "Aquamarine" \
 	--output "~/dropbox/Public/___doc___$(PROJECT)" \
 	$(PROJECT)/Classes | exit 0
