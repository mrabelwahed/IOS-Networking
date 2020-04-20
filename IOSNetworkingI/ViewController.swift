//
//  ViewController.swift
//  IOSNetworkingI
//
//  Created by MahmoudRamadan on 4/18/20.
//  Copyright © 2020 MahmoudRamadan. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    var tableView : UITableView!
    let cellReusableIdentifier = "courses_cell"
    var courses : [Course] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Courses List"
        
        tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)

        
        tableView.register(CustomCourseCell.self, forCellReuseIdentifier: cellReusableIdentifier)
        
        setupConstrainst()
        
        getCourses()
    }
    
    func  getCourses(){
        NetworkManager.getClasses { courses in
            self.courses = courses
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    func setupConstrainst(){
        tableView.snp.makeConstraints { (make) in
            make.top.bottom.trailing.leading.equalToSuperview()
        }
    }
    
    
}

extension ViewController : UITableViewDelegate{
    
}

extension ViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return courses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReusableIdentifier, for: indexPath) as! CustomCourseCell
        cell.config(course: courses[indexPath.row])
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
}

