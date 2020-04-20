//
//  Course.swift
//  IOSNetworkingI
//
//  Created by MahmoudRamadan on 4/18/20.
//  Copyright © 2020 MahmoudRamadan. All rights reserved.
//

import Foundation
struct Course  : Codable{
    var name : String
    var instructor : String
    var code : Int
    var enrolled : Bool
    
    init(name : String ,author : String , code : Int , enrolled : Bool) {
        self.name = name
        self.instructor = author
        self.code = code
        self.enrolled  = enrolled
    }
}


struct CoursesDataResponse : Codable {
    var classes: [Course]
}

struct  CourseResponse : Codable {
    var data : CoursesDataResponse
}
