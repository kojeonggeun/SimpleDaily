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
        
        dateLabel.text = note.lastUpdated?.toString()
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
        note.lastUpdated = Date()
        CoreDataManager.shared.save()
        
    }
    private func deleteNote(){
        print("awd")
//        note.lastUpdated = Date()
//        CoreDataManager.shared.save()
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.contentTextView.resignFirstResponder()
    }
    
}
extension EditNoteViewController: UITextViewDelegate {
    func textViewDidEndEditing(_ textView: UITextView) {
        note.content = contentTextView.text
        if note.title?.isEmpty ?? true {
            deleteNote()
        } else {
            updateNote()
        }
    }
    
}
