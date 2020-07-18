//
//  ViewController.swift
//  Axxess Assignment
//
//  Created by Badve, Akshay on 7/18/20.
//  Copyright © 2020 Badve, Akshay. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {

    
    private var tableView: UITableView!
    private var listViewModel: ListViewModel = ListViewModel()
            
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        listViewModel.listViewModelProtocol = self
        listViewModel.fetchListData()
    }
    
    /// Function to perform detail view navigation
    /// - Parameter listObjcet: list object instance
    func navigateToDetailsViewController(listObjcet: ListObject) {
        let detailsViewController = DetailViewController()
        detailsViewController.listObject = listObjcet
        
        self.navigationController?.pushViewController(detailsViewController, animated: true)
    }
    
    /// Function to configure table view
    func configureTableView() {
        tableView = UITableView(frame: .zero)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(ListTableViewCell.self, forCellReuseIdentifier: ListTableViewCell.cellIdentifier)
        view.addSubview(tableView)
        
        addTableViewConstraints()
    }
    
    /// Function to add table view constraints
    func addTableViewConstraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
}

extension ListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let listObject = listViewModel.listObjects[indexPath.row]
        navigateToDetailsViewController(listObjcet: listObject)
    }
}

extension ListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return listViewModel.listObjects.count
       }
       
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           let cell = tableView.dequeueReusableCell(withIdentifier: ListTableViewCell.cellIdentifier, for: indexPath) as! ListTableViewCell
           let listObject = listViewModel.listObjects[indexPath.row]
           
           cell.idLabel.text = Constants.ControllerStaticConstants.id + listObject.id
           cell.typeLabel.text = Constants.ControllerStaticConstants.type + listObject.type
           cell.dateLabel.text = Constants.ControllerStaticConstants.date + listObject.date
           cell.dataLabel.text = Constants.ControllerStaticConstants.data + String(listObject.data.filter { !" \n".contains($0) })
           
           return cell
       }
}

extension ListViewController: ListViewModelProtocol {
    //this methods will get called when view model will get response
    func showNoDataMessage() {
        self.showAlert(withTitle: Constants.Alerts.alert, message: Constants.Alerts.noData)
    }
    
    func reloadTableView() {
        tableView.reloadData()
    }
}

