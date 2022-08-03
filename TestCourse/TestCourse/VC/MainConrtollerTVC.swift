//
//  MainConrtollerTVC.swift
//  TestCourse
//
//  Created by Владимир Макаров on 05.03.2022.
//

import UIKit

class MainConrtollerTVC: UITableViewController {
    
    let networkManager = NetWorkManager()
    var resultCours: [Course] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        networkManager.alamofireGetResponse { courses in
            self.resultCours = courses
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return resultCours.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! NewsCell
        let label = resultCours[indexPath.row]
        cell.configure(with: label)
        return cell
    }
}
