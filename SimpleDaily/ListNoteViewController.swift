//
//  ViewController.swift
//  SimpleDaily
//
//  Created by 고정근 on 2022/06/15.
//

import UIKit
import CoreData
import SnapKit

class ListNoteViewController: UIViewController {
    private var notes: [Note] = []
    
    private let testTableView: UITableView = UITableView()
    private let createNewNoteButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "square.and.pencil"), for: .normal)
        return button
    }()
    
//    MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        createNewNoteButton.addTarget(self, action: #selector(createNewNoteClicked), for: .touchUpInside)
        
        setView()
        setConstraints()
        
        fetchNotesFromStorage()
    }
    
    func setView(){
        testTableView.dataSource = self
        testTableView.delegate = self
        
        testTableView.register(UITableViewCell.self, forCellReuseIdentifier: "TableViewCell")
        
        view.addSubview(testTableView)
        view.addSubview(createNewNoteButton)
    }
    
    func setConstraints(){
        testTableView.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
        }
        
        createNewNoteButton.snp.makeConstraints { make in
            make.top.equalTo(testTableView.snp.bottom)
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-30)
            make.trailing.equalTo(view).offset(-30)
            
        }
    }
    
    @objc
    func createNewNoteClicked(){
        createNote()
    }
    
    func createNote() -> Note{
        let note = CoreDataManager.shared.createNote()
        
        notes.insert(note, at: 0)
        testTableView.insertRows(at: [IndexPath(row:0, section: 0)], with: .automatic)
        
        return note
    }
    
    func fetchNotesFromStorage(){
        notes = CoreDataManager.shared.fetchNotes()
    }

}

extension ListNoteViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.notes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as UITableViewCell
        let note = notes[indexPath.row]
        
        let date = note.value(forKey: "lastUpdated") as? Date
        
        let dateToString = date?.toString()
        cell.textLabel?.text = dateToString
        
//        cell.textLabel?.text = note.value(forKey: "createDate") as? String
        
        
        return cell
    }
}

extension ListNoteViewController: UITableViewDelegate{
}
