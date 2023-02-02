//
//  Ex+Date.swift
//  CheckIt
//
//  Created by 이학진 on 2023/02/01.
//

import Foundation

extension Date {
    /// date 인스턴스를 시간과 분으로 반환하는 메소드
    func getTimeString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        
        return dateFormatter.string(from: self)
    }
    /// date 인스턴스를 연도-월-일로 반환하는 메소드
    func getDateString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "y-m-d"
        
        return dateFormatter.string(from: self)
    }
}