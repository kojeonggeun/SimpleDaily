//
//  ListNoteTableViewCell.swift
//  SimpleDaily
//
//  Created by 고정근 on 2022/06/25.
//

import Foundation
import UIKit

class ListNoteTableViewCell: UITableViewCell {
    
    static let identifier = "ListNoteTableViewCell"
    
//    private let titleLabel: UILabel
//    private let descriptionLabel: UILabel
//    private let lastUpdatedTimeLabel: UILabel
    
//    private let lastUpdatedMonLabel: UILabel
//    private let lastUpdatedDayLabel: UILabel
    
    func setup(note: Note) {
        let date = note.value(forKey: "lastUpdated") as? Date
        let dateToString = date?.toString()

    }
}
