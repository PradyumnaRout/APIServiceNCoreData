//
//  PublisherAndSubscribers.swift
//  APIServiceNCoreData
//
//  Created by hb on 26/06/25.
//

import Foundation
import Combine

// MARK: -  COMBINE PUBLISHER, SUBSCRIBERS AND OPERATORS
// https://medium.com/bumble-tech/understanding-publishers-in-swiftui-and-combine-27806aa78ba1
// https://medium.com/@lucaspedrazoli/a-handy-list-of-swift-combine-operators-e7b5d640761c (Great)
//https://nikunj-joshi.medium.com/swift-combine-introduction-to-combine-operators-filtering-operators-510d962b95f2

//https://www.swiftbysundell.com/articles/building-custom-combine-publishers-in-swift/
// https://thoughtbot.com/blog/lets-build-a-custom-publisher-in-combine
// https://forums.swift.org/t/combine-creating-a-custom-publisher-by-wrapping-another-publisher-and-operating-on-it/48812


class CombineOperators {
    
    init() {
        operatorScan()
    }
    
    
    // MARK: - Transforming Operators
    // Allow us to manipulate the values that comes from publisher into a format that is usable for the downstream subscribers. It has similarities with Swift map and flatmap. Transforming operator converts input into output
    
    var subscriptions = Set<AnyCancellable>()
    
    // Same as reduce in swift.
    func operatorScan() {
        ["a", "b", "c"]
            .publisher
            .scan("X ->") { latest, current in
                "\(latest) + \(current)"
            }
            .sink(receiveValue: {
                print("sink \($0)")
            })
            .store(in: &subscriptions)
    }
    
}
