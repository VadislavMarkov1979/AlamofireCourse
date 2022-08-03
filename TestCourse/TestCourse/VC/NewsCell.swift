//
//  NewsCell.swift
//  TestCourse
//
//  Created by Владимир Макаров on 05.03.2022.
//

import UIKit

class NewsCell: UITableViewCell {

    @IBOutlet weak var imageOutlet: UIImageView!
    @IBOutlet weak var courseName: UILabel!
    @IBOutlet weak var numberCourse: UILabel!
    @IBOutlet weak var lessonsOfCourse: UILabel!
    
    func configure(with label: Course) {
        courseName.text = label.name
        numberCourse.text = "Number of course: \(label.namberOfTests)"
        lessonsOfCourse.text = "Number of : \(label.numberOfLessons)"
        
        DispatchQueue.global().async {
            guard let stringURL = label.imageUrl else { return }
            guard let imageURL = URL(string: stringURL) else { return }
            guard let imageData = try? Data(contentsOf: imageURL) else { return }
            
            DispatchQueue.main.async {
                self.imageOutlet.image = UIImage(data: imageData)
            }
        }
    }
}
