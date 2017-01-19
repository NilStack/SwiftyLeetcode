//: Playground - noun: a place where people can play

import UIKit

/**
 * 217. Contains Duplicate
 * https://leetcode.com/problems/contains-duplicate/
 */

class Solution {
    class func containsDuplicate(nums: [Int]?) -> Bool {
        guard let nums = nums, nums.count != 0, nums.count != 1 else { return false }
        
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
