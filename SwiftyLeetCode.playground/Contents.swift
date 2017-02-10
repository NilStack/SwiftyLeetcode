// Leetcode solutions in Swift.
// Some solutions are from:
// https://github.com/soapyigu/LeetCode_Swift

import UIKit

class Solution {}

/**
 * 1. Two Sum
 * https://leetcode.com/problems/two-sum/
 */

extension Solution {
    class func twoSum(nums: [Int], _ target: Int) -> [Int] {
        
        guard nums.count > 1 else { return [] }
        
        var map = [Int:Int]()
        
        for i in 0..<nums.count {
            if let value = map[nums[i]] {
                return [value + 1, i + 1]
            }
            
            map[target - nums[i]] = i
        }
        
        return []
    }
}

/*:
 ### Usage
 */

let twoSumNums = [2, 7, 11, 15]
let target = 9

Solution.twoSum(nums: twoSumNums, target)

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

/*:
 ### Usage
 */

let nums1 = [1, 5, 27, 8, 3, 186, 12, 22, 8, 962]
Solution.containsDuplicate(nums: nums1)

let nums2 = [3, 9, 32, 16, 0, 125, 1457, 83]
Solution.containsDuplicate(nums: nums2)

/**
 * 219. Contains Duplicate
 * https://leetcode.com/problems/contains-duplicate-ii/
 */

extension Solution {
    class func containsDuplicateII(nums: [Int]?,  _ k: Int) -> Bool {
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

/*:
 ### Usage
 */

Solution.containsDuplicateII(nums: nums1, 3)
Solution.containsDuplicateII(nums: nums1, 5)
Solution.containsDuplicateII(nums: nums2, 2)

