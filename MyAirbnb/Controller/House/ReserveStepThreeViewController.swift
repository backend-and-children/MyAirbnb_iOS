//
//  ReserveStepThreeViewController.swift
//  MyAirbnb
//
//  Created by Solji Kim on 02/08/2019.
//  Copyright © 2019 Alex Lee. All rights reserved.
//

import UIKit
import SnapKit

class ReserveStepThreeViewController: UIViewController {

    let topView: TableviewTopView = {
        let view = TableviewTopView()
        view.backgroundColor = .white
        view.backButton.setImage(UIImage(named: "backBlack"), for: .normal)
        view.shareButton.isHidden = true
        view.heartButton.isHidden = true
        
        view.layer.masksToBounds = false
        view.layer.shadowOpacity = 0.1
        view.layer.shadowOffset = CGSize(width: 0, height: 1.0)
        view.layer.shadowRadius = 0
        view.layer.shadowColor = UIColor.gray.cgColor
        return view
    }()
    
    let tableView: UITableView = {
        let tableView = UITableView()
//        tableView.separatorInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        tableView.separatorStyle = .none
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 100
        
        tableView.register(StepThreeTitleTableCell.self, forCellReuseIdentifier: StepThreeTitleTableCell.identifier)
        tableView.register(AddPaymentTableCell.self, forCellReuseIdentifier: AddPaymentTableCell.identifier)
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
        setAutolayout()
    }
    
    private func configure() {
        view.backgroundColor = .white
        
        topView.delegate = self
        view.addSubview(topView)
        
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
    }
    
    private func setAutolayout() {
        topView.snp.makeConstraints { (make) in
            make.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            make.height.equalToSuperview().multipliedBy(0.07)
        }
        
        tableView.snp.makeConstraints { (make) in
            make.top.equalTo(topView.snp.bottom)
            make.leading.bottom.trailing.equalTo(view.safeAreaLayoutGuide)
        }
    }
}


// MARK: - UITableViewDataSource

extension ReserveStepThreeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let stepThreeTitleCell = tableView.dequeueReusableCell(withIdentifier: StepThreeTitleTableCell.identifier, for: indexPath) as! StepThreeTitleTableCell
            tableView.separatorStyle = .singleLine
            stepThreeTitleCell.separatorInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
            return stepThreeTitleCell
        case 1:
            let addPaymentCell = tableView.dequeueReusableCell(withIdentifier: AddPaymentTableCell.identifier, for: indexPath) as! AddPaymentTableCell
            addPaymentCell.delegate = self
            return addPaymentCell
        default:
            return UITableViewCell()
        }
    }
    
    
}

// MARK: - UITableViewDelegate

extension ReserveStepThreeViewController: UITableViewDelegate {
}

// MARK: - TableviewTopViewDelegate

extension ReserveStepThreeViewController: TableviewTopViewDelegate {
    func popView() {
        navigationController?.popViewController(animated: true)
    }
}

// MARK: - AddPaymentTableCellDelegate

extension ReserveStepThreeViewController: AddPaymentTableCellDelegate {
    func presentSelectPayVC() {
        let selectPayVC = SelectPayMethodViewController()
        let navi = UINavigationController(rootViewController: selectPayVC)
        present(navi, animated: true)
    }
}
