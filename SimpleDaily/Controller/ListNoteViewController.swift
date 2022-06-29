//
//  ViewController.swift
//  SimpleDaily
//
//  Created by 고정근 on 2022/06/15.
//

import UIKit
import CoreData
import SnapKit
import WidgetKit

class ListNoteViewController: UIViewController {
    
    private var notes: [Note] = []
    private let listNoteView = ListNoteView()
    private let testTableView: UITableView = UITableView()
 
//    MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setView()
        setConstraints()
        
        fetchNotesFromStorage()
    }
    
    func setView(){
        testTableView.dataSource = self
        testTableView.delegate = self
        
//        testTableView.register(ListNoteTableViewCell.self, forCellReuseIdentifier: ListNoteTableViewCell.identifier)
        
        testTableView.register(UITableViewCell.self, forCellReuseIdentifier: "TableViewCell")
        
        view.addSubview(listNoteView)
        view.addSubview(testTableView)
        
    }
    
    func setConstraints(){
        listNoteView.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
        }
        
        testTableView.snp.makeConstraints { make in
            make.top.equalTo(listNoteView.snp.bottom)
            make.leading.trailing.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        
    
    }
    
    @objc
    private func createNewNoteTouched(){
        createNote()
    }
    
    private func createNote() -> Note{
        let note = CoreDataManager.shared.createNote()
        
        notes.insert(note, at: 0)
        testTableView.insertRows(at: [IndexPath(row:0, section: 0)], with: .automatic)
        
        return note
    }
    
    private func fetchNotesFromStorage(){
        notes = CoreDataManager.shared.fetchNotes()
    }
    
    private func goToEditNote(_ note: Note) {
        
        let controller = EditNoteViewController()
        controller.modalPresentationStyle = .fullScreen
          controller.note = note
//          controller.delegate = self
        self.navigationController?.pushViewController(controller, animated: true)
          
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
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let note = notes[indexPath.row]
        goToEditNote(note)
    
    }
}
