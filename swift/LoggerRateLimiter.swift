// https://leetcode.com/problems/logger-rate-limiter/

class Logger {
    
    var map = [String: Int]()

    init() { }
    
    func shouldPrintMessage(_ timestamp: Int, _ message: String) -> Bool {
        if map[message] == nil {
            map[message] = timestamp
            return true
        } else {
            if timestamp - map[message]! >= 10 {
                map[message] = timestamp
                return true
            } else {
                return false
            }
        }
    }
}