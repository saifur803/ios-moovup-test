//
//  ListScreenViewController.swift
//  MoovupTest
//
//  Created by Saifur Rahman on 24/2/2024.
//

import Foundation
import UIKit


class ListScreenViewController: UIViewController {
    
    private let rootView = ListScreenView()
    
    private var peopleList: [People] = []
    
    override func loadView() {
        super.loadView()
        view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        rootView.tableView.dataSource = self
        rootView.tableView.delegate = self
        rootView.tableView.register(PeopleTableViewCell.self, forCellReuseIdentifier: PeopleTableViewCell.identifier)
        
        peopleList = AppDatabase.shared.getPeopleList()
        rootView.tableView.reloadData()
    }
}

extension ListScreenViewController: UITableViewDelegate {
    
}

extension ListScreenViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return peopleList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: PeopleTableViewCell.identifier, for: indexPath
        ) as! PeopleTableViewCell
        cell.selectionStyle = .none
        
        let people = peopleList[indexPath.row]
        
        cell.nameLabel.text = "\(people.firstName) \(people.lastName)"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let people = peopleList[indexPath.row]
        Navigator.shared.openMapDetailScreen(self, people: people)
    }
}
