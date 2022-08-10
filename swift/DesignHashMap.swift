// https://leetcode.com/problems/design-hashmap/

class MyHashMap {
    
    private let hashBase: Int
    private var hashTable: [[(key: Int, val: Int)]]

    init() {
        hashBase = 997
        hashTable = [[(key: Int, val: Int)]](repeating: [(key: Int, val: Int)](), count: hashBase)
    }
    
    private func hash(_ key: Int) -> Int {
        return key % 997
    }
    
    func put(_ key: Int, _ value: Int) {
        if let index = hashTable[hash(key)].firstIndex { $0.key == key } {
            hashTable[hash(key)][index] = (key, value)
        } else {
            hashTable[hash(key)].append((key, value))
        }
    }
    
    func get(_ key: Int) -> Int {
        hashTable[hash(key)].first { $0.key == key }?.val ?? -1
    }
    
    func remove(_ key: Int) {
        if let index = hashTable[hash(key)].firstIndex { $0.key == key } {
            hashTable[hash(key)].remove(at: index)
        }
    }
}