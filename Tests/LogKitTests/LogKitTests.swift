import StoreKit
import XCTest
@testable import LogKit

@available(OSX 10.12, *)
final class LogKitTests: XCTestCase {
    private var log: LogKit.Log.Type {
        let log = Log.self
        log.enabledLogging = [
               .deinit,
               .function,
               .networking,
               .default,
               .expiration,
               .inAppPurchase,
               .error
        ]
        return log
    }
    
    func testLogDeinit() {
        log.deinit(of: self)
    }
    
    func testLogFunctionIn() {
        log.function(#function, in: #file)
        log.function(#function, text: "text")
    }
    
    func testLogDefault() {
        log.default("default")
    }
    
    func testLogRequestCalled() {
        log.requestCalled(function: #function)
    }
    
    func testLogExpiration() {
        log.expiration(date: .init())
    }
    
    func testLogRequest() {
        log.request(URLRequest(url: URL(string: "https://github.com/marekpridal/LogKit")!, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 30))
    }
    
    func testLogResponse() {
        struct Foo: Encodable {
            let bar: String
        }
        
        let encoded = try? JSONEncoder().encode(Foo(bar: "Hello world"))
        
        log.response(URLResponse(url: URL(string: "https://github.com/marekpridal/LogKit")!, mimeType: nil, expectedContentLength: 30, textEncodingName: "application/json"), data: encoded)
    }
    
    func testLogInAppPurchase() {
        log.inAppPurchase("Purchasing...")
    }
    
    func testLogError() {
        log.error(NSError(domain: "logkit.tests", code: 0, userInfo: nil))
    }
    
    func testLogSKRequest() {
        log.products(request: .init(productIdentifiers: ["logkit_product_identifier"]))
    }
    
    func testLogSKProductsResponse() {
        log.products(response: .init())
    }
    
    func testLogSKProductsRequest() {
        log.products(request: SKRequest())
    }
    
    func testLogPaymentQueue() {
        log.paymentQueue(.default())
    }
    
    func testLogPayment() {
        log.payment(transactions: [.init()])
    }
}
