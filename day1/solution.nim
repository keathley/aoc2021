import std/strutils
import std/sequtils
import std/sugar

proc countIncreasing(list: seq[int]): int =
  result = 0
  var previous = list[0]
  for item in list:
    if item > previous:
      result += 1
    previous = item

let input = readFile("input.txt")
let nums = input
  .splitLines()
  .filter(x => x != "")
  .map(x => parseInt(x))

let part1 = countIncreasing(nums)
echo "Part 1: ", part1


var windows: seq[int]
let l = len(nums)

for i in 0..l:
  echo "Length: ", l, ", i: ", i
  if i+2 > l-1:
    break

  windows.add(nums[i] + nums[i+1] + nums[i+2])

let part2 = countIncreasing(windows)

echo "Part 2: ", part2
