//
//  ViewController.swift
//  SimpleDaily
//
//  Created by 고정근 on 2022/06/15.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    private var users: [NSManagedObject] = []
    
    
    private let testTableView: UITableView = UITableView()
       
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        setView()
        setConstraints()
        
        fetchUsers()
    }
    
    func setView(){
        testTableView.dataSource = self
        testTableView.delegate = self
        
        testTableView.register(UITableViewCell.self, forCellReuseIdentifier: "TableViewCell")
        
        view.addSubview(testTableView)
    }
    
    func setConstraints(){
        testTableView.translatesAutoresizingMaskIntoConstraints = false
        
        testTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        testTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        testTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        testTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
    
    func fetchUsers() {
        do {
            users = try context.fetch(User.fetchRequest())
            DispatchQueue.main.async {
                self.testTableView.reloadData()
            }
        }
        catch {
            // error
        }
    }

}

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as UITableViewCell
        let user = users[indexPath.row]
        cell.textLabel?.text = user.value(forKey: "name") as? String
        
        return cell
    }
}

extension ViewController: UITableViewDelegate{
}
