//
//  Log.swift
//
//  Created by Marek Pridal on 22/07/2019.
//  Copyright © 2019 Marek Pridal. All rights reserved.
//

import Foundation
#if os(Android) || os(Windows) || os(Linux)
import AndroidLogging
import FoundationNetworking
#else
import OSLog
import StoreKit
#endif

@available(OSX 11, iOS 10.0, watchOS 3.0, tvOS 10.0, *)
public enum Log {
    public enum Category: String, CaseIterable, Sendable {
        case `deinit`
        case function
        case networking
        case `default`
        case expiration
        case inAppPurchase
        case error
        case database
        case dependencyInjection
    }

#if canImport(Darwin)
    nonisolated(unsafe) public static var subsystem = Bundle.main.bundleIdentifier!
#elseif os(Android)
    nonisolated(unsafe) public static var subsystem = "com.logkit.android"
#endif
    nonisolated(unsafe) public static var enabledLogging: [Category] = Category.allCases
#if canImport(Darwin)
    public static func `deinit`(of object: AnyObject) {
        guard enabledLogging.contains(.deinit) else { return }
        let logger = Logger(subsystem: subsystem, category: Category.deinit.rawValue)
        logger.info("Deinit of \(object.debugDescription ?? "")")
    }
#endif
    public static func function(_ function: String, in file: String) {
        guard enabledLogging.contains(.function) else { return }
#if canImport(Darwin)
        let logger = Logger(subsystem: subsystem, category: Category.function.rawValue)
        logger.debug("\(function) \(file)")
#elseif os(Android)
#endif
    }

    public static func `default`(_ string: String) {
        guard enabledLogging.contains(.default) else { return }
#if canImport(Darwin)
        let logObject = OSLog(subsystem: subsystem, category: Category.default.rawValue)
        os_log("%{PRIVATE}@", log: logObject, type: .debug, string)
#elseif os(Android)
#endif
    }

    public static func requestCalled(function: String) {
        guard enabledLogging.contains(.networking) else { return }
#if canImport(Darwin)
        let logObject = OSLog(subsystem: subsystem, category: Category.networking.rawValue)
        os_log("%{PRIVATE}@ already called", log: logObject, type: .debug, function)
#elseif os(Android)
#endif
    }

    public static func expiration(date: Date) {
        guard enabledLogging.contains(.expiration) else { return }
#if canImport(Darwin)
        let logObject = OSLog(subsystem: subsystem, category: Category.expiration.rawValue)
        os_log("[GMT] Valid until %{PRIVATE}@", log: logObject, type: .debug, date.debugDescription)
#elseif os(Android)
#endif
    }

    public static func request(_ request: URLRequest) {
        guard enabledLogging.contains(.networking) else { return }
#if canImport(Darwin)
        let logObject = OSLog(subsystem: subsystem, category: Category.networking.rawValue)
        var message = "\n---REQUEST------------------\n"
        message.append("URL -> \((request.url?.absoluteString ?? ""))\n")
        message.append("METHOD -> \(request.httpMethod ?? "")\n")
        message.append("HEADERS: {\n")
        for header in request.allHTTPHeaderFields ?? [:] {
            message.append("    \(header.key): \(header.value)\n")
        }
        message.append("}\n")
        if let body = request.httpBody {
            message.append("BODY -> \(String(data: body, encoding: .utf8) ?? "")\n")
        }
        message.append("----------------------------\n")
        os_log("%{PRIVATE}@", log: logObject, type: .debug, message)
#elseif os(Android)
#endif
    }

    public static func response(_ response: URLResponse?, data: Data?) {
        guard enabledLogging.contains(.networking) else { return }
#if canImport(Darwin)
        let logObject = OSLog(subsystem: subsystem, category: Category.networking.rawValue)
        guard let response = response, let data = data else { return }
        var message = "\n---RESPONSE------------------\n"
        message.append("URL -> \(response.url?.absoluteString ?? "")\n")
        message.append("MIMEType -> \(response.mimeType ?? "")\n")
        message.append("Status code -> \((response as? HTTPURLResponse)?.statusCode ?? -1)\n")
        message.append("HEADERS: {\n")
        for header in (response as? HTTPURLResponse)?.allHeaderFields ?? [:] {
            message.append("   \(header.key): \(header.value)\n")
        }
        message.append("}\n")
        message.append("Response data -> \(String(data: data, encoding: .utf8) ?? "")\n")
        message.append("----------------------------\n")
        os_log("%{PRIVATE}@", log: logObject, type: .debug, message)
#elseif os(Android)
#endif
    }

    public static func function(_ function: String, text: String) {
        guard enabledLogging.contains(.function) else { return }
#if canImport(Darwin)
        let logObject = OSLog(subsystem: subsystem, category: Category.function.rawValue)
        os_log("%{PRIVATE}@ %{PRIVATE}@", log: logObject, type: .debug, function, text)
#elseif os(Android)
#endif
    }

    public static func inAppPurchase(_ string: String) {
        guard enabledLogging.contains(.inAppPurchase) else { return }
#if canImport(Darwin)
        let logObject = OSLog(subsystem: subsystem, category: Category.inAppPurchase.rawValue)
        os_log("%{PRIVATE}@", log: logObject, type: .debug, string)
#elseif os(Android)
#endif
    }

    public static func error(_ error: Error) {
        guard enabledLogging.contains(.error) else { return }
#if canImport(Darwin)
        let logObject = OSLog(subsystem: subsystem, category: Category.error.rawValue)
        os_log("%{PRIVATE}@", log: logObject, type: .error, error.localizedDescription)
#elseif os(Android)
#endif
    }

    public static func database(_ string: String) {
        guard enabledLogging.contains(.database) else { return }
#if canImport(Darwin)
        let log = OSLog(subsystem: subsystem, category: LogKit.Log.Category.database.rawValue)
        os_log("%{PRIVATE}@", log: log, type: .debug, string)
#elseif os(Android)
#endif
    }

    public static func dependencyInjection(_ string: String) {
        guard enabledLogging.contains(.dependencyInjection) else { return }
#if canImport(Darwin)
        let log = OSLog(subsystem: subsystem, category: LogKit.Log.Category.dependencyInjection.rawValue)
        os_log("%{PRIVATE}@", log: log, type: .debug, string)
#elseif os(Android)
#endif
    }
#if canImport(Darwin)
    @available(watchOS 6.2, *)
    public static func products(request: SKProductsRequest) {
        guard enabledLogging.contains(.inAppPurchase) else { return }
        let logObject = OSLog(subsystem: subsystem, category: Category.inAppPurchase.rawValue)
        var requestMessage = "\n---REQUEST------------------\n"
        requestMessage.append("\(request)")
        requestMessage.append("\n----------------------------\n")
        os_log("%{PRIVATE}@", log: logObject, type: .debug, requestMessage)
    }

    @available(watchOS 6.2, *)
    public static func products(response: SKProductsResponse) {
        guard enabledLogging.contains(.inAppPurchase) else { return }
        let logObject = OSLog(subsystem: subsystem, category: Category.inAppPurchase.rawValue)
        var responseMessage = "\n---RESPONSE------------------\n"
        responseMessage.append("Invalid product identifiers \(response.invalidProductIdentifiers)")
        responseMessage.append("\n----------------------------\n")
        responseMessage.append("Products \(response.products)")
        responseMessage.append("\n----------------------------\n")
        os_log("%{PRIVATE}@", log: logObject, type: .debug, responseMessage)
    }

    @available(watchOS 6.2, *)
    public static func products(request: SKRequest) {
        guard enabledLogging.contains(.inAppPurchase) else { return }
        let logObject = OSLog(subsystem: subsystem, category: Category.inAppPurchase.rawValue)
        var requestMessage = "\n---REQUEST------------------\n"
        requestMessage.append("\(request)")
        requestMessage.append("\n----------------------------\n")
        Log.default(requestMessage)
        os_log("%{PRIVATE}@", log: logObject, type: .debug, requestMessage)
    }

    @available(watchOS 6.2, *)
    public static func paymentQueue(_ queue: SKPaymentQueue) {
        guard enabledLogging.contains(.inAppPurchase) else { return }
        let logObject = OSLog(subsystem: subsystem, category: Category.inAppPurchase.rawValue)
        var requestMessage = "\n---QUEUE------------------\n"
        requestMessage.append("\(queue)")
        requestMessage.append("\n----------------------------\n")
        os_log("%{PRIVATE}@", log: logObject, type: .debug, requestMessage)
    }

    @available(watchOS 6.2, *)
    public static func payment(transactions: [SKPaymentTransaction]) {
        guard enabledLogging.contains(.inAppPurchase) else { return }
        let logObject = OSLog(subsystem: subsystem, category: Category.inAppPurchase.rawValue)
        var responseMessage = "\n---UPDATED TRANSACTIONS------------------\n"
        responseMessage.append("\(transactions)")
        responseMessage.append("\n----------------------------\n")
        os_log("%{PRIVATE}@", log: logObject, type: .debug, responseMessage)
    }
#endif
}
