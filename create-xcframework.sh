xcodebuild archive \
-project LogKit.xcodeproj \
-scheme LogKit-Package \
-configuration Release \
-destination "generic/platform=iOS" \
-archivePath "$PWD/archives/LogKit-iOS" \
SKIP_INSTALL=NO \
BUILD_LIBRARY_FOR_DISTRIBUTION=YES \
APPLICATION_EXTENSION_API_ONLY=YES

xcodebuild archive \
-project LogKit.xcodeproj \
-scheme LogKit-Package \
-configuration Release \
-destination "generic/platform=iOS Simulator" \
-archivePath "$PWD/archives/LogKit-iOS-Simulator" \
SKIP_INSTALL=NO \
BUILD_LIBRARY_FOR_DISTRIBUTION=YES \
APPLICATION_EXTENSION_API_ONLY=YES

xcodebuild archive \
-project LogKit.xcodeproj \
-scheme LogKit-Package \
-configuration Release \
-destination "generic/platform=watchOS" \
-archivePath "$PWD/archives/LogKit-watchOS" \
SKIP_INSTALL=NO \
BUILD_LIBRARY_FOR_DISTRIBUTION=YES \
APPLICATION_EXTENSION_API_ONLY=YES

xcodebuild archive \
-project LogKit.xcodeproj \
-scheme LogKit-Package \
-configuration Release \
-destination "generic/platform=watchOS Simulator" \
-archivePath "$PWD/archives/LogKit-watchOS-Simulator" \
SKIP_INSTALL=NO \
BUILD_LIBRARY_FOR_DISTRIBUTION=YES \
APPLICATION_EXTENSION_API_ONLY=YES

xcodebuild archive \
-project LogKit.xcodeproj \
-scheme LogKit-Package \
-configuration Release \
-destination "generic/platform=tvOS" \
-archivePath "$PWD/archives/LogKit-tvOS" \
SKIP_INSTALL=NO \
BUILD_LIBRARY_FOR_DISTRIBUTION=YES \
APPLICATION_EXTENSION_API_ONLY=YES

xcodebuild archive \
-project LogKit.xcodeproj \
-scheme LogKit-Package \
-configuration Release \
-destination "generic/platform=tvOS Simulator" \
-archivePath "$PWD/archives/LogKit-tvOS-Simulator" \
SKIP_INSTALL=NO \
BUILD_LIBRARY_FOR_DISTRIBUTION=YES \
APPLICATION_EXTENSION_API_ONLY=YES

xcodebuild archive \
-project LogKit.xcodeproj \
-scheme LogKit-Package \
-configuration Release \
-destination "generic/platform=macOS" \
-archivePath "$PWD/archives/LogKit-macOS" \
SKIP_INSTALL=NO \
BUILD_LIBRARY_FOR_DISTRIBUTION=YES \
APPLICATION_EXTENSION_API_ONLY=YES

xcodebuild -create-xcframework \
-framework "$PWD/archives/LogKit-iOS.xcarchive/Products/Library/Frameworks/LogKit.framework" \
-debug-symbols "$PWD/archives/LogKit-iOS.xcarchive/dSYMs/LogKit.framework.dSYM" \
-framework "$PWD/archives/LogKit-iOS-Simulator.xcarchive/Products/Library/Frameworks/LogKit.framework" \
-debug-symbols "$PWD/archives/LogKit-iOS-Simulator.xcarchive/dSYMs/LogKit.framework.dSYM" \
-framework "$PWD/archives/LogKit-watchOS.xcarchive/Products/Library/Frameworks/LogKit.framework" \
-debug-symbols "$PWD/archives/LogKit-watchOS.xcarchive/dSYMs/LogKit.framework.dSYM" \
-framework "$PWD/archives/LogKit-watchOS-Simulator.xcarchive/Products/Library/Frameworks/LogKit.framework" \
-debug-symbols "$PWD/archives/LogKit-watchOS-Simulator.xcarchive/dSYMs/LogKit.framework.dSYM" \
-framework "$PWD/archives/LogKit-tvOS.xcarchive/Products/Library/Frameworks/LogKit.framework" \
-debug-symbols "$PWD/archives/LogKit-tvOS.xcarchive/dSYMs/LogKit.framework.dSYM" \
-framework "$PWD/archives/LogKit-tvOS-Simulator.xcarchive/Products/Library/Frameworks/LogKit.framework" \
-debug-symbols "$PWD/archives/LogKit-tvOS-Simulator.xcarchive/dSYMs/LogKit.framework.dSYM" \
-framework "$PWD/archives/LogKit-macOS.xcarchive/Products/Library/Frameworks/LogKit.framework" \
-debug-symbols "$PWD/archives/LogKit-macOS.xcarchive/dSYMs/LogKit.framework.dSYM" \
-output artifacts/LogKit.xcframework
