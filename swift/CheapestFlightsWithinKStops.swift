// https://leetcode.com/problems/cheapest-flights-within-k-stops/

class Solution {
    func findCheapestPrice(_ n: Int, _ flights: [[Int]], _ src: Int, _ dst: Int, _ k: Int) -> Int {
        var nextCitiesAfter: [Int: [Int]] = [:]
        var costOfFlight: [[Int]: Int] = [:]
        for flight in flights {
            nextCitiesAfter[flight[0], default: []].append(flight[1])
            costOfFlight[[flight[0], flight[1]]] = flight[2]
        }

        var minimumCostToCity = Array(repeating: Int.max, count: n)
        minimumCostToCity[src] = 0

        var depth = 0
        var queue: [(Int, Int)] = [(src, 0)]
        while queue.isEmpty == false && depth <= k {
            let queueCount = queue.count
            for i in 0..<queueCount {
                let (currentCity, currentCost) = queue.remove(at: 0)
                for nextCity in nextCitiesAfter[currentCity, default: []] {
                    let costToNextCity = currentCost + costOfFlight[[currentCity, nextCity], default: 0]
                    if costToNextCity < minimumCostToCity[nextCity] {
                        queue.append((nextCity, costToNextCity))
                        minimumCostToCity[nextCity] = costToNextCity
                    }
                }
            }

            depth += 1
        }

        if minimumCostToCity[dst] != Int.max {
            return minimumCostToCity[dst]
        }
        return -1
    }
}