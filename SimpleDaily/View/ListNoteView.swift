//
//  ListNoteView.swift
//  SimpleDaily
//
//  Created by 고정근 on 2022/06/29.
//

import Foundation
import UIKit
import SnapKit

class ListNoteView: UIView {

    private let dateMonthLabel: UILabel = {
        let date = UILabel()
        let nowDate = Date()
        
        let myDateFormatter = DateFormatter()
        myDateFormatter.dateFormat = "yyyy-MM"
        myDateFormatter.locale = Locale(identifier:"ko_KR")
        let convertNowStr = myDateFormatter.string(from: nowDate)
        
        date.text = convertNowStr
        
        return date
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configureSubViews()
        self.configureUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.configureSubViews()
        self.configureUI()
    }
}
private extension ListNoteView {
    
    func configureSubViews(){
        self.addSubview(dateMonthLabel)
    }
    
    func configureUI() {
        
        dateMonthLabel.snp.makeConstraints { make in
            make.top.bottom.equalTo(self.safeAreaLayoutGuide)
            make.leading.equalTo(self.safeAreaLayoutGuide).offset(30)
        }
        
    }
}

