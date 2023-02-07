//
//  Group.swift
//  CheckIt
//
//  Created by 이학진 on 2023/01/31.
//

import Foundation

struct Group: Identifiable, Hashable {
    var id: String
    var name: String
    var invitationCode: String
    var image: String
    var hostID: String
    var description: String    
    var scheduleID: [String]
    var memberLimit: Int
    
    static let sampleGroup: Group = Group(id: "1",
                                          name: "허미니의 또구동아리",
                                          invitationCode: "ㅇㄴㅁㅇㅁㄴㅇ",
                                          image: "",
                                          hostID: "",
                                          description: "야구동아리입니다",
                                          scheduleID: [],
                                          memberLimit: 0
    )
}
