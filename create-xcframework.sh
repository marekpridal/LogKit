swift package generate-xcodeproj

xcodebuild archive \
-project LogKit.xcodeproj \
-scheme LogKit-Package \
-destination "generic/platform=iOS" \
-archivePath "archives/LogKit-iOS" \
SKIP_INSTALL=NO \
BUILD_LIBRARY_FOR_DISTRIBUTION=YES

xcodebuild archive \
-project LogKit.xcodeproj \
-scheme LogKit-Package \
-destination "generic/platform=iOS Simulator" \
-archivePath "archives/LogKit-iOS-Simulator" \
SKIP_INSTALL=NO \
BUILD_LIBRARY_FOR_DISTRIBUTION=YES

xcodebuild archive \
-project LogKit.xcodeproj \
-scheme LogKit-Package \
-destination "generic/platform=watchOS" \
-archivePath "archives/LogKit-watchOS" \
SKIP_INSTALL=NO \
BUILD_LIBRARY_FOR_DISTRIBUTION=YES

xcodebuild archive \
-project LogKit.xcodeproj \
-scheme LogKit-Package \
-destination "generic/platform=watchOS Simulator" \
-archivePath "archives/LogKit-watchOS-Simulator" \
SKIP_INSTALL=NO \
BUILD_LIBRARY_FOR_DISTRIBUTION=YES

xcodebuild archive \
-project LogKit.xcodeproj \
-scheme LogKit-Package \
-destination "generic/platform=tvOS" \
-archivePath "archives/LogKit-tvOS" \
SKIP_INSTALL=NO \
BUILD_LIBRARY_FOR_DISTRIBUTION=YES

xcodebuild archive \
-project LogKit.xcodeproj \
-scheme LogKit-Package \
-destination "generic/platform=tvOS Simulator" \
-archivePath "archives/LogKit-tvOS-Simulator" \
SKIP_INSTALL=NO \
BUILD_LIBRARY_FOR_DISTRIBUTION=YES

xcodebuild archive \
-project LogKit.xcodeproj \
-scheme LogKit-Package \
-destination "generic/platform=macOS" \
-archivePath "archives/LogKit-macOS" \
SKIP_INSTALL=NO \
BUILD_LIBRARY_FOR_DISTRIBUTION=YES

xcodebuild -create-xcframework \
-framework "Archives/LogKit-iOS.xcarchive/Products/Library/Frameworks/LogKit.framework" \
-framework "Archives/LogKit-iOS-Simulator.xcarchive/Products/Library/Frameworks/LogKit.framework" \
-framework "Archives/LogKit-watchOS.xcarchive/Products/Library/Frameworks/LogKit.framework" \
-framework "Archives/LogKit-watchOS-Simulator.xcarchive/Products/Library/Frameworks/LogKit.framework" \
-framework "Archives/LogKit-tvOS.xcarchive/Products/Library/Frameworks/LogKit.framework" \
-framework "Archives/LogKit-tvOS-Simulator.xcarchive/Products/Library/Frameworks/LogKit.framework" \
-framework "Archives/LogKit-macOS.xcarchive/Products/Library/Frameworks/LogKit.framework" \
-output LogKit.xcframework
