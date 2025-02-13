# LogKit

![Build](https://github.com/marekpridal/LogKit/actions/workflows/build.yml/badge.svg) ![Test](https://github.com/marekpridal/LogKit/actions/workflows/test.yml/badge.svg) ![Publish](https://github.com/marekpridal/LogKit/actions/workflows/Publish.yml/badge.svg) ![platforms](https://img.shields.io/badge/platform-iOS%20%7C%20watchOS%20%7C%20tvOS%20%7C%20macOS%20%7C%20visionOS%20%7C%20Android-333333) [![Swift Package Manager compatible](https://img.shields.io/badge/Swift%20Package%20Manager-compatible-brightgreen.svg)](https://github.com/apple/swift-package-manager) ![GitHub](https://img.shields.io/github/license/marekpridal/LogKit) ![GitHub All Releases](https://img.shields.io/github/downloads/marekpridal/LogKit/total)

LogKit is logging framework to simplify work with `os.log` API provided by Apple.

## Support
- iOS 14.0+ 
- watchOS 7.0+
- macOS 11+
- tvOS 14.0+
- visionOS 1.0+
- Android

## Installation

LogKit supports SwiftPM. You can integrate LogKit using SwiftPM directly via Xcode or manually using Package.swift.

### [Xcode](https://developer.apple.com/documentation/xcode/adding_package_dependencies_to_your_app)

To add a package dependency to your Xcode project, select File > Swift Packages > Add Package Dependency and enter its repository URL. You can also navigate to your target’s General pane, and in the “Frameworks, Libraries, and Embedded Content” section, click the + button. In the “Choose frameworks and libraries to add” dialog, select Add Other, and choose Add Package Dependency.

Instead of adding a repository URL, you can search for a package on [GitHub](https://github.com/) or [GitHub Enterprise](https://github.com/enterprise). Add your [GitHub](https://github.com/) or [GitHub Enterprise](https://github.com/enterprise) account in Xcode’s preferences, and a list of package repositories appears as you type. The following screenshot shows the list of repositories for the search term ExamplePackage.

### [Swift Package Manager](https://github.com/apple/swift-package-manager)

Create a `Package.swift` file.

```swift
// swift-tools-version:6.0

import PackageDescription

let package = Package(
  name: "LogKitExample",
  dependencies: [
    .package(url: "https://github.com/marekpridal/LogKit", from: "3.0.0")
  ],
  targets: [
    .target(name: "LogKitExample", dependencies: ["LogKit"])
  ]
)
```

## Usage
```swift
import LogKit

// Configure what should be logged during session
Log.enabledLogging = [.default, .error, .expiration, .function, .inAppPurchase, .networking]

Log.deinit(of: self)

// 2020-05-10 15:34:17.452379+0200 xctest[10906:217188] [deinit] Deinit of -[LogKitTests testLogDeinit]

Log.default("Hello world")

// 2020-05-10 15:34:17.451431+0200 xctest[10906:217188] [default] Hello world

Log.error(NSError(domain: "logkit.tests", code: 0, userInfo: nil))

// 2020-05-10 15:34:17.454305+0200 xctest[10906:217188] [error] Unable to complete (logkit.tests error 0.)


Log.function(#function, in: #file)

// 2020-05-10 15:34:17.455434+0200 xctest[10906:217188] [function] testLogFunctionIn() LogKitTests/LogKitTests.swift


Log.requestCalled(function: #function)

// 2020-05-10 15:34:17.465002+0200 xctest[10906:217188] [networking] testLogRequestCalled() already called

Log.expiration(date: expiresDate)

// 2020-05-10 15:34:17.454920+0200 xctest[10906:217188] [expiration] [GMT] Valid until 2020-05-10 13:34:17 +0000

Log.request(URLRequest(url: URL(string: "https://github.com/marekpridal/LogKit")!, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 30))

// 2020-05-10 15:34:17.458338+0200 xctest[10906:217188] [networking] 
// ---REQUEST------------------
// URL -> https://github.com/marekpridal/LogKit
// METHOD -> GET
// HEADERS: {
// }
// ----------------------------

Log.response(response, data: data)

// ---RESPONSE------------------
// URL -> https://github.com/marekpridal/LogKit
// MIMEType -> application/octet-stream
// Status code -> -1
// HEADERS: {
// }
// Response data -> {"bar":"Hello world"}
// ----------------------------

Log.function(#function, text: "Log function")

// 2020-05-10 15:34:17.455465+0200 xctest[10906:217188] [function] testLogFunctionIn() Log function

Log.inAppPurchase("Purchasing...")

// 2020-05-10 15:34:17.455969+0200 xctest[10906:217188] [inAppPurchase] Purchasing...

Log.products(request: request)

// 2020-05-10 15:41:25.661150+0200 xctest[11170:222169] [inAppPurchase] 
// ---REQUEST------------------
// <SKProductsRequest: 0x100bb6670>
// ----------------------------

Log.products(response: response)

// 2020-05-10 15:41:48.995140+0200 xctest[11187:222918] [inAppPurchase] 
// ---RESPONSE------------------
// Invalid product identifiers []
// ----------------------------
// Products []
// ----------------------------

Log.products(request: request)

// 2020-05-10 15:42:30.262523+0200 xctest[11204:223751] [inAppPurchase] 
// ---REQUEST------------------
// <SKProductsRequest: 0x100b09130>
// ----------------------------

Log.paymentQueue(queue)

// 2020-05-10 15:42:58.838761+0200 xctest[11254:225150] [inAppPurchase] 
// ---QUEUE------------------
// <SKPaymentQueue: 0x100f07ee0>
// ----------------------------

Log.payment(transactions: transactions)

// 2020-05-10 15:43:17.628385+0200 xctest[11281:225904] [inAppPurchase] 
// ---UPDATED TRANSACTIONS------------------
// [<SKPaymentTransaction: 0x1051040a0>]
// ----------------------------

```
