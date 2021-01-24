//
//  Course.swift
//  basv
//
//  Created by Ranjeet Singh on 27/11/20.
//

import Foundation

class Course
{
    var course: String
    var fee: Int
    var hours: Int
    init(course:String, hours:Int, fee:Int) {
        self.course = course
        self.hours = hours
        self.fee = fee
    }
}
