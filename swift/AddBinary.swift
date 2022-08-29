// https://leetcode.com/problems/add-binary/

class Solution {
    func addBinary(_ a: String, _ b: String) -> String {
        var az = a.count - 1
        var bz = b.count - 1
        
        var carry = 0
        var result = ""
        
        for i in stride(from: max(az, bz), to: -1, by: -1) {
            if az >= 0 {
                carry += Int(String(a[a.index(a.startIndex, offsetBy: az)]))!
                az -= 1
            }
            if bz >= 0 {
                carry += Int(String(b[b.index(b.startIndex, offsetBy: bz)]))!
                bz -= 1
            }
            result.append(carry == 1 || carry == 3 ? "1" : "0")
            carry = carry > 1 ? 1 : 0
        }
        result.append(carry == 1 ? "1" : "")
        return String(result.reversed())
    }
}