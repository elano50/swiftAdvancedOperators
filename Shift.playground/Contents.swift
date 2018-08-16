//: Playground - noun: a place where people can play

import UIKit

let monday: Int8 = 1
let tuesday: Int8 = monday << 1
let wednesday: Int8 = monday << 2
let thursday: Int8 = monday << 3
let friday: Int8 = monday << 4
let saturday: Int8 = monday << 5
let sunday: Int8 = monday << 6

let schedule = saturday | sunday // 0b01100000

let isSaturday = (schedule & saturday) >> 5
let isSunday = (schedule & sunday) >> 6
let isFriday = (schedule & friday) >> 4
