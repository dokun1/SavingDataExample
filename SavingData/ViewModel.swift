//
//  ViewModel.swift
//  SavingData
//
//  Created by David Okun on 5/15/23.
//

import Foundation

public protocol Writeable {
    mutating func write(_ string: String, key: String)
}

public protocol Readable {
    func read(_ key: String) -> String?
}

struct Model: Writeable, Readable {
    mutating func write(_ string: String, key: String) {
        self.value = string
    }
    
    func read(_ key: String) -> String? {
        return self.value
    }
    
    var value: String
}

extension UserDefaults: Writeable {
    public func write(_ string: String, key: String) {
        let defaults = UserDefaults.standard
        defaults.set(string, forKey: key)
        defaults.synchronize()
    }
}

extension UserDefaults: Readable {
    public func read(_ key: String) -> String? {
        UserDefaults.standard.string(forKey: key)
    }
}

public typealias Persistable = Writeable & Readable

class ViewModel: ObservableObject {
  @Published var savedString: String
var storageContainer: Persistable
  
  init(container: Persistable) {
    self.savedString = "Nothing saved yet!"
    self.storageContainer = container
    if let persistedString = loadString() {
      self.savedString = persistedString
    }
  }
  
  func saveString(_ string: String) {
    self.storageContainer.write(string, key: "savedString")
    savedString = string
  }
  
  func loadString() -> String? {
    self.storageContainer.read("savedString")
  }
}
