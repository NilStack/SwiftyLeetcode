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
 * 167. Two Sum II - Input arary is sorted
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
 * 219. Contains Duplicate
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
