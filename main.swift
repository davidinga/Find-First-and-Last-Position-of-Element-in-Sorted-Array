/*
Given an array of integers nums sorted in non-decreasing order, find the starting and ending position of a given target value.

If target is not found in the array, return [-1, -1].

You must write an algorithm with O(log n) runtime complexity.

Example 1:

Input: nums = [5,7,7,8,8,10], target = 8
Output: [3,4]

Example 2:

Input: nums = [5,7,7,8,8,10], target = 6
Output: [-1,-1]

Example 3:

Input: nums = [], target = 0
Output: [-1,-1]

Constraints:

0 <= nums.length <= 10^5
-10^9 <= nums[i] <= 10^9
nums is a non-decreasing array.
-10^9 <= target <= 10^9
*/

func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
    // Search for firstIdx
    var startIdx = 0, endIdx = nums.count - 1
    while startIdx <= endIdx {
        let midIdx = startIdx + (endIdx - startIdx) / 2
        if nums[midIdx] < target {
            startIdx = midIdx + 1
        } else {
            endIdx = midIdx - 1
        }
    }

    guard startIdx < nums.count, nums[startIdx] == target else { return [-1, -1] }
    let firstIdx = startIdx

    // Search for lastIdx
    startIdx = firstIdx
    endIdx = nums.count - 1
    while startIdx <= endIdx {
        let midIdx = startIdx + (endIdx - startIdx) / 2
        if nums[midIdx] <= target {
            startIdx = midIdx + 1
        } else {
            endIdx = midIdx - 1
        }
    }
    return [firstIdx, endIdx]
}