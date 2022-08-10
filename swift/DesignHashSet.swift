// https://leetcode.com/problems/design-hashset/

class MyHashSet {
    
    private let hashBase: Int
    private var hashTable: [[Int]]
    
    init() {
        hashBase = 997
        hashTable = [[Int]](repeating: [Int](), count: hashBase)
    }
    
    private func hash(_ key: Int) -> Int {
        return key % 997
    }
    
    func add(_ key: Int) {
        if hashTable[hash(key)].first { $0 == key } == nil {
            hashTable[hash(key)].append(key)
        }
    }
    
    func remove(_ key: Int) {
        if let index = hashTable[hash(key)].firstIndex(of: key) {
            hashTable[hash(key)].remove(at: index)
        }
    }
    
    func contains(_ key: Int) -> Bool {
        return hashTable[hash(key)].first { $0 == key } != nil
    }
}

