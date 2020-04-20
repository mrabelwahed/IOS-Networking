//
//  CustomCourseCell.swift
//  IOSNetworkingI
//
//  Created by MahmoudRamadan on 4/18/20.
//  Copyright © 2020 MahmoudRamadan. All rights reserved.
//

import UIKit

class CustomCourseCell: UITableViewCell {
       var nameLabel:UILabel!
       var author:UILabel!
    
       
       let padding: CGFloat = 8
       let imageHeight : CGFloat = 16
       let imageWidth: CGFloat = 16
       let nameLabelHeight : CGFloat =  16
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
             nameLabel = UILabel()
             nameLabel.translatesAutoresizingMaskIntoConstraints = false
             nameLabel.font =  UIFont.systemFont(ofSize: 14)
             nameLabel.textColor = .black
             contentView.addSubview(nameLabel)
             // rating label
             author = UILabel()
             author.translatesAutoresizingMaskIntoConstraints = false
             author.font =  UIFont.systemFont(ofSize: 12)
             nameLabel.textColor = .black
             contentView.addSubview(author)
          
             
             
             setupConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func config(course : Course){
        nameLabel.text = course.name
        author.text = course.instructor
    }
    
    func setupConstraints(){
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            nameLabel.heightAnchor.constraint(equalToConstant: padding+5)
            
        ])
        
        NSLayoutConstraint.activate([
            author.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor, constant: 0),
            author.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            author.heightAnchor.constraint(equalTo: nameLabel.heightAnchor)
        ])
    }

}
