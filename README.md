# LogKit

LogKit is logging framework for simplify work with `os.log` API provided by Apple.

## Requirements
- iOS 10.0+ 
- watchOS 3.0+
- macOS 10.2+
- tvOS 10.0+

## Installation

LogKit support SwiftPM and it's integration using Xcode or manually using Package.swift.

### [Xcode](https://developer.apple.com/documentation/xcode/adding_package_dependencies_to_your_app)

To add a package dependency to your Xcode project, select File > Swift Packages > Add Package Dependency and enter its repository URL. You can also navigate to your target’s General pane, and in the “Frameworks, Libraries, and Embedded Content” section, click the + button. In the “Choose frameworks and libraries to add” dialog, select Add Other, and choose Add Package Dependency.

Instead of adding a repository URL, you can search for a package on [GitHub](https://github.com/) or [GitHub Enterprise](https://github.com/enterprise). Add your [GitHub](https://github.com/) or [GitHub Enterprise](https://github.com/enterprise) account in Xcode’s preferences, and a list of package repositories appears as you type. The following screenshot shows the list of repositories for the search term ExamplePackage.

### [Swift Package Manager](https://github.com/apple/swift-package-manager)

Create a `Package.swift` file.

```swift
// swift-tools-version:5.0

import PackageDescription

let package = Package(
  name: "LogKitExample",
  dependencies: [
    .package(url: "https://github.com/marekpridal/LogKit", from: "1.0.0")
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

// 

Log.default("")

//

Log.error(error)

//


Log.function(#function, in: #file)

//


Log.requestCalled(function: #function)

// 

Log.expiration(date: expiresDate)

//

Log.request(request)

//

Log.response(response, data: data)

// 

Log.function(#function, text: "Log function")

//

Log.inAppPurchase("Purchasing")

//

Log.error(error)

//

Log.products(request: request)

//

Log.products(response: response)

//

Log.products(request: request)

//

Log.paymentQueue(queue)

//

Log.payment(transactions: transactions)

//

```