//
//  ListTableViewCell.swift
//  Axxess Assignment
//
//  Created by Badve, Akshay on 6/25/20.
//  Copyright © 2020 Badve, Akshay. All rights reserved.
//

import UIKit
import SnapKit

class ListTableViewCell: UITableViewCell {

    static let cellIdentifier: String = Constants.CellIdentifiers.listTableViewCell

     var idLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
     var typeLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
     var dateLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
     var dataLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureViews()
        self.selectionStyle = .none
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureViews()
    }
    
    /// Function to setup Id Label constrints
    func setupIdLabelConstraints(){
        let marginGuide = contentView.layoutMarginsGuide

        idLabel.translatesAutoresizingMaskIntoConstraints = false
        idLabel.leadingAnchor.constraint(equalTo: marginGuide.leadingAnchor).isActive = true
        idLabel.topAnchor.constraint(equalTo: marginGuide.topAnchor).isActive = true
        idLabel.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor).isActive = true
        idLabel.numberOfLines = 0
    }
    
    /// Function to setup Type Label constrints
    func setupTypeLabelConstraints(){
        let marginGuide = contentView.layoutMarginsGuide

        typeLabel.translatesAutoresizingMaskIntoConstraints = false
        typeLabel.leadingAnchor.constraint(equalTo: marginGuide.leadingAnchor).isActive = true
        typeLabel.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor).isActive = true
        typeLabel.topAnchor.constraint(equalTo: idLabel.bottomAnchor).isActive = true
        typeLabel.numberOfLines = 0
    }
    
    /// Function to setup Date Label constrints
    func setupDateLabelConstraints(){
        let marginGuide = contentView.layoutMarginsGuide

        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.leadingAnchor.constraint(equalTo: marginGuide.leadingAnchor).isActive = true
        dateLabel.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor).isActive = true
        dateLabel.topAnchor.constraint(equalTo: typeLabel.bottomAnchor).isActive = true
        dateLabel.numberOfLines = 0
    }
    
    /// Function to setup Data Label constrints
    func setupDataLabelConstraints() {
        let marginGuide = contentView.layoutMarginsGuide

        dataLabel.translatesAutoresizingMaskIntoConstraints = false
        dataLabel.leadingAnchor.constraint(equalTo: marginGuide.leadingAnchor).isActive = true
        dataLabel.bottomAnchor.constraint(equalTo: marginGuide.bottomAnchor).isActive = true
        dataLabel.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor).isActive = true
        dataLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor).isActive = true
        dataLabel.numberOfLines = 0
    }
    
    /// Function to Configure views
    func configureViews() {
        
        contentView.addSubview(idLabel)
        setupIdLabelConstraints()
        
        contentView.addSubview(typeLabel)
        setupTypeLabelConstraints()

        contentView.addSubview(dateLabel)
        setupDateLabelConstraints()

        contentView.addSubview(dataLabel)
        setupDataLabelConstraints()
    }
}
