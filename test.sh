#!/bin/bash

set -e 
set -o pipefail

xcodebuild -showsdks

# xcodebuild -project CloudyCider.xcodeproj -scheme CloudyCider -sdk iphonesimulator13.0 build | xcpretty
# xcodebuild test -enableCodeCoverage YES -project CloudyCider.xcodeproj -scheme CloudyCider -sdk iphonesimulator13.0 | xcpretty