// Not only Leetcode solutions in Swift.
// Some solutions are from:
// https://github.com/soapyigu/LeetCode_Swift

import UIKit

class Solution {}

/**
 * 1. Two Sum
 * https://leetcode.com/problems/two-sum/
 */

extension Solution {
    class func twoSum(nums: [Int]?, _ target: Int) -> [Int]? {

        guard let nums = nums, nums.count > 1 else { return nil }

        var map = [Int: Int]()

        for i in 0 ..< nums.count {
            if let value = map[nums[i]] {
                return [value + 1, i + 1]
            }

            map[target - nums[i]] = i
        }

        return nil
    }
}

// Usage

let twoSumNums = [2, 7, 11, 15]
let twoSumTarget = 9

Solution.twoSum(nums: twoSumNums, twoSumTarget)

/**
 * 15. 3Sum
 * https://leetcode.com/problems/3sum/
 */

extension Solution {
    class func threeSum(nums: [Int]?) -> [[Int]]?{
        guard let nums = nums, nums.count > 2 else { return nil }
        
        var results: [[Int]]?
        let sortedNums = nums.sorted()
        
        for i in 0..<sortedNums.count - 2 {
            
            if (i > 0 && sortedNums[i] == sortedNums[i-1]) {
                continue
            }
            
            var left = i + 1
            var right = sortedNums.count - 1
            let target = -sortedNums[i]
            
            while (left < right) {
                if (sortedNums[left] + sortedNums[right] == target) {

                    if (results != nil) {
                        results!.append([-target, sortedNums[left], sortedNums[right]])
                        
                        left += 1
                        right -= 1
                        
                        while (left < right && sortedNums[left] == sortedNums[left - 1]) {
                            left += 1
                        }
                        
                        while (left < right && sortedNums[right] == sortedNums[right + 1]) {
                            right -= 1
                        }
 
                    } else {
                        results = [[Int]]()
                    }
                    
                    
                } else if (sortedNums[left] + sortedNums[right] < target) {
                    left += 1
                } else {
                    right -= 1
                }
            }

        }
        
        return results
    }
    
}

// usage

let threeSumNums = [-1, 0, 1, 2, -1, -4]
Solution.threeSum(nums: threeSumNums)
/**
 * 167. Two Sum II - Input array is sorted
 * https://leetcode.com/problems/two-sum-ii-input-array-is-sorted/
 */

//: ![Two Sum II](TwoSumII.png)

extension Solution {
    class func twoSumII(nums: [Int]?, _ target: Int) -> [Int]? {
        guard let nums = nums, nums.count > 1 else { return nil }

        var start = 0
        var end = nums.count - 1

        while start < end {
            if nums[start] + nums[end] == target {
                return [start + 1, end + 1]
            }

            if nums[start] + nums[end] < target {
                start += 1
            } else {
                end -= 1
            }
        }

        return nil
    }
}

// Usage

let twoSumIINums = [2, 7, 11, 15]
let twoSumIITarget = 9

Solution.twoSum(nums: twoSumIINums, twoSumIITarget)

/**
 * 170. Two Sum III - Data structure design
 * https://leetcode.com/problems/two-sum-iii-data-structure-design
 */

class TwoSumIII {
    private var map = [Int: Int]()
    private var list = [Int]()

    func add(number: Int) {
        if let numCount = map[number] {
            map[number] = numCount + 1
        } else {
            map[number] = 1
            list.append(number)
        }
    }

    func find(value: Int) -> Bool {

        for number in list {
            if let numCount = map[number], number == value - number, numCount > 1 {
                return true
            }

            if let _ = map[value - number], number != value - number {
                return true
            }
        }

        return false
    }

}

// usage
let twoSumIII = TwoSumIII()
twoSumIII.add(number: 1)
twoSumIII.add(number: 3)
twoSumIII.add(number: 5)
twoSumIII.find(value: 4)
twoSumIII.find(value: 7)

/**
 * Two Sum - Less than or equal to target
 * http://www.lintcode.com/en/problem/two-sum-less-than-or-equal-to-target/
 */

extension Solution {
    class func twoSum5(nums: [Int]?, _ target: Int) -> Int {
        guard let nums = nums, nums.count > 1 else { return 0 }
        
        let sortedNums = nums.sorted()
        var count = 0
        var left = 0
        var right = nums.count - 1
        
        while left < right {
            let value = sortedNums[left] + sortedNums[right]
            if(value > target) {
                right -= 1
            } else {
                count += right - left
                left += 1
            }
        }
        
        return count
    }
}

let twoSum5Nums = [2, 7, 11, 15]
let twoSum5Target = 24

Solution.twoSum5(nums: twoSum5Nums, twoSum5Target)

/**
 *  Two Sum - Greater than target
 * http://www.lintcode.com/en/problem/two-sum-greater-than-target/
 */

extension Solution {
    class func twoSum6(nums: [Int]?, _ target: Int) -> Int {
        guard let nums = nums, nums.count > 1 else { return 0 }
        
        let sortedNums = nums.sorted()
        var count = 0
        var left = 0
        var right = nums.count - 1
        
        while left < right {
            let value = sortedNums[left] + sortedNums[right]
            if(value <= target) {
                left += 1
            } else {
                count += right - left
                right -= 1
            }
        }
        
        return count
    }
}

let twoSum6Nums = [2, 7, 11, 15]
let twoSum6Target = 24

Solution.twoSum6(nums: twoSum6Nums, twoSum6Target)

/**
 * Two Sum - Difference equals to target
 * http://www.lintcode.com/en/problem/two-sum-difference-equals-to-target/
 */

extension Solution {
    class func twoSum7(nums: [Int]?, _ target: Int) -> [Int]? {
        guard let nums = nums, nums.count > 1 else { return nil }
        
        let localTarget = target > 0 ? target : -target
        
        var map = [Int: Int]()
        for (index, number) in nums.enumerated() {
            map[number] = index
        }
        
        let sortedNums = nums.sorted()
        let count = nums.count - 1
        
        var j = 0
        for i in 0..<count {
            if i == j {
                j += 1
            }
            
            while (j < count && sortedNums[j] - sortedNums[i] < localTarget) {
                j += 1
            }
            
            if (j < count && sortedNums[j] - sortedNums[i] == localTarget) {
                let index0 = map[sortedNums[i]]
                let index1 = map[sortedNums[j]]
                
                if let index0 = index0, let index1 = index1 {
                    
                    return index0 < index1 ? [index0 + 1, index1 + 1] : [index1 + 1, index0 + 1]
                    
                }
            }
        }
        return nil
    }
}

let twoSum7Nums = [2, 7, 11, 15]
let twoSum7Target = 5

Solution.twoSum7(nums: twoSum7Nums, twoSum7Target)

/**
 * 217. Contains Duplicate
 * https://leetcode.com/problems/contains-duplicate/
 */

extension Solution {
    class func containsDuplicate(nums: [Int]?) -> Bool {
        guard let nums = nums, nums.count > 1 else { return false }

        return nums.count > Set(nums).count
    }

}

// Usage

let nums1 = [1, 5, 27, 8, 3, 186, 12, 22, 8, 962]
Solution.containsDuplicate(nums: nums1)

let nums2 = [3, 9, 32, 16, 0, 125, 1457, 83]
Solution.containsDuplicate(nums: nums2)

/**
 * 219. Contains Duplicate II
 * https://leetcode.com/problems/contains-duplicate-ii/
 */

extension Solution {
    class func containsDuplicateII(nums: [Int]?, _ k: Int) -> Bool {
        guard let nums = nums, nums.count > 1 else { return false }

        var dict = [Int: Int]()

        for i in 0 ..< nums.count {
            guard let index = dict[nums[i]], i - index <= k else {
                dict[nums[i]] = i
                continue
            }

            return true
        }

        return false
    }
}

// Usage

Solution.containsDuplicateII(nums: nums1, 3)
Solution.containsDuplicateII(nums: nums1, 5)
Solution.containsDuplicateII(nums: nums2, 2)
