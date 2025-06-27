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
        operatorMap()
    }
    
    
    // MARK: - Transforming Operators
    // Allow us to manipulate the values that comes from publisher into a format that is usable for the downstream subscribers. It has similarities with Swift map and flatmap. Transforming operator converts input into output
    
    var subscriptions = Set<AnyCancellable>()
    
    // Scan Operator
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
    
    
    // Collect Operator
    func operatorCollect() {
        var subscriptions = Set<AnyCancellable>()
        
        let publisher = PassthroughSubject<Int, Never>()
        
        // Subscriber one
        publisher
            .collect()
            .sink { valueArray in
                print("all values as array: ")
                print(valueArray)
            }
            .store(in: &subscriptions)
        
        // Subscriber two
        publisher
            .collect(2)
            .sink(receiveValue: {
                print("array elements limited by 2: ")
                print($0)
            }).store(in: &subscriptions)
        
        publisher.send(1)
        publisher.send(2)
        publisher.send(3)
        publisher.send(completion: .finished)
    }
    
    // Map and FlatMap
    func operatorMap() {
        struct User {
            let name: String
            let lastName: String
        }
        
        var userArray = [
            User(name: "Ariya", lastName: "Stak"),
            User(name: "Sansa", lastName: "Stak"),
            User(name: "Tony", lastName: "Stak")
        ]
        
        var subscriber = Set<AnyCancellable>()
        
        let publisher: PassthroughSubject = PassthroughSubject<User, Never>()
        
        let userArrayPublisher = PassthroughSubject<[User], Never>()
        
        
        publisher
            .map { $0 }
            .sink { user in
                print("User name: \(user.name)")
                print("User last name: \(user.lastName)")
            }
            .store(in: &subscriber)
        
        publisher
            .map(\.name, \.lastName)
            .sink(receiveValue: { name, lastName in
                print("name: \(name)")
                print("last name: \(lastName)")
            })
            .store(in: &subscriptions)
        
        let user = User(name: "John", lastName: "Snow")
        publisher.send(user)
        
        
        
        func makeUserTuple(_ user: [User]) -> [String] {
            return user.map({$0.name})
        }
        
        func intoFullname(_ input: User) -> AnyPublisher<String, Never> {
            return Just("Name: \(input.name) \(input.lastName)").eraseToAnyPublisher()
        }
        
        userArrayPublisher
            .map(makeUserTuple(_:))
            .sink { items in
                print(items)
            }
            .store(in: &subscriber)
        
        
        userArray
            .publisher
            .flatMap(intoFullname)
            .sink(receiveValue: { name in
                print(name)
            })
            .store(in: &subscriptions)
            
        userArrayPublisher.send(userArray)
        
    }
    
}
