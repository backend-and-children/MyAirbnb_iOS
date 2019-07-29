//
//  SearchBarTableView.swift
//  MyAirbnb
//
//  Created by 행복한 개발자 on 16/07/2019.
//  Copyright © 2019 Alex Lee. All rights reserved.
//

import UIKit

class SearchBarTableView: UIView {

    let tableView = UITableView()
    
    var locationData = ["서울", "파리", "런던", "로마", "인천", "여수", "속초"]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setAutoLayout()
        configureViewsOptions()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setAutoLayout() {
        self.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
    
    private func configureViewsOptions() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(SearchBarTableCell.self, forCellReuseIdentifier: SearchBarTableCell.identifier)
        tableView.rowHeight = 60
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        tableView.allowsSelection = false
        
    }

}

extension SearchBarTableView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return locationData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SearchBarTableCell.identifier, for: indexPath) as! SearchBarTableCell
        cell.locationTextLabel.text = locationData[indexPath.row]
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("tableview select")
    }
}
