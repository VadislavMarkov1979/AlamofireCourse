//
//  NetWorkManager.swift
//  TestCourse
//
//  Created by Владимир Макаров on 05.03.2022.
//

import Foundation
import Alamofire

struct NetWorkManager {

    let uriAF = "https://swiftbook.ru//wp-content/uploads/api/api_courses"
    
    func alamofireGetResponse(_ completion: @escaping ([Course]) -> Void) {
        AF.request(uriAF)
            .validate()
            .responseJSON { dataResponse in
                switch dataResponse.result {
                case .success(let value):
                    let courses = Course.getCorse(from: value)
                    completion(courses)
                case .failure(let error):
                    print(error)
                }
                
            }
    }
    
}
