//
//  EditNoteViewController.swift
//  SimpleDaily
//
//  Created by 고정근 on 2022/06/25.
//

import Foundation
import UIKit

class EditNoteViewController: UIViewController {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 24)
        return label
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    
    private let contentTextView: UITextView = UITextView()
    
    
//    MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
