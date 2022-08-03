//
//  Course.swift
//  TestCourse
//
//  Created by Владимир Макаров on 05.03.2022.
//

import Foundation

struct Course {
    let name: String?
    let imageUrl: String?
    let namberOfTests: Int?
    let numberOfLessons: Int?
    
    init(dataCorses: [String: Any]) {
        name = dataCorses["name"] as? String
        imageUrl = dataCorses["imageUrl"] as? String
        namberOfTests = dataCorses["number_of_tests"] as? Int
        numberOfLessons = dataCorses["number_of_lessons"] as? Int
    }
    
    static func getCorse(from value: Any) -> [Course] {
        guard let coursesData = value as? [[String: Any]] else { return [] }
        return coursesData.compactMap { Course(dataCorses: $0)}
    }
}
