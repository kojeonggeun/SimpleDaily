//
//  EditNoteViewController.swift
//  SimpleDaily
//
//  Created by 고정근 on 2022/06/25.
//

import Foundation
import UIKit
import SnapKit

class EditNoteViewController: UIViewController {
    
    static let identifier = "EditNoteViewController"
    var note: Note!
    weak var delegate: ListNotesDelegate!
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    
    private let contentTextView: UITextView = UITextView()
    
    
//    MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setView()
        setConstraints()
    }
    
    @objc
    func dismissButtonClicked(){
        self.dismiss(animated: true)
    }
    
    func setView(){
        contentTextView.delegate = self
        
        view.addSubview(dateLabel)
        view.addSubview(contentTextView)
        
        let cal = Calendar.current
        let year = cal.component(.year, from: note.lastUpdated!)
        let month = cal.component(.month, from: note.lastUpdated!)
        let day = cal.component(.day, from: note.lastUpdated!)
        
        dateLabel.text = "\(year)년 \(month)월 \(day)일"
        contentTextView.text = note.content
    }
    
    func setConstraints(){
        dateLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.centerX.equalTo(view)
        }
        
        contentTextView.snp.makeConstraints { make in
            make.top.equalTo(dateLabel.snp.bottom)
            make.leading.trailing.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    private func updateNote(){
        
        CoreDataManager.shared.updateNote(note: note)
        delegate.refreshNotes()
        
    }
    private func deleteNote(){
        delegate.deleteNote(with: note.id)
        CoreDataManager.shared.deleteNote(note: note)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.contentTextView.resignFirstResponder()
    }
}

extension EditNoteViewController: UITextViewDelegate {
    func textViewDidEndEditing(_ textView: UITextView) {
        note.content = contentTextView.text
        if note.content?.isEmpty ?? true {
            deleteNote()
        } else {
            updateNote()
        }
    }
    
}
