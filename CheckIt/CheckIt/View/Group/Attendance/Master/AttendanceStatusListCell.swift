//
//  AttendanceStatusLIstCell.swift
//  CheckIt
//
//  Created by 류창휘 on 2023/02/01.
//

import SwiftUI

struct AttendanceStatusListCell: View {
    var schedule: Schedule?
    var attendance: Attendance?
    
    var body: some View {
        ZStack {
            VStack {
                RoundedRectangle(cornerRadius: 18)
                    .foregroundColor(Color.myLightGray)
                    .frame(height:100)
                    .overlay {
                        RoundedRectangle(cornerRadius: 18)
                            .stroke(Color.myGray)
                            .frame(height:100)
                    }
            }
            VStack(alignment: .leading) {
                HStack {
                    Text(Date().yearMonthDayDateToString(date: schedule?.startTime ?? Date()))
                        .foregroundColor(.black)
                        .font(.headline)
                        .bold()
                    
                    Spacer()
                    
                    if attendance?.attendanceStatus == "출석" {
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 45, height: 25)
                            .foregroundColor(.white)
                            .overlay{
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.myGreen, lineWidth: 1)
                                Text(attendance?.attendanceStatus ?? "")
                                    .foregroundColor(Color.myGreen)
                                    .font(.caption)
                                    .bold()
                            }
                    }
                    
                    if attendance?.attendanceStatus == "지각" {
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 45, height: 25)
                            .foregroundColor(.white)
                            .overlay{
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.myOrange, lineWidth: 1)
                                Text(attendance?.attendanceStatus ?? "")
                                    .foregroundColor(Color.myOrange)
                                    .font(.caption)
                                    .bold()
                            }
                    }
                    
                    if attendance?.attendanceStatus == "결석" {
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 45, height: 25)
                            .foregroundColor(.white)
                            .overlay{
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.myRed, lineWidth: 1)
                                Text(attendance?.attendanceStatus ?? "")
                                    .foregroundColor(Color.myRed)
                                    .font(.caption)
                                    .bold()
                            }
                    }
                    
                    if attendance?.attendanceStatus == "공결" {
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 45, height: 25)
                            .foregroundColor(.white)
                            .overlay{
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.myBlack, lineWidth: 1)
                                Text(attendance?.attendanceStatus ?? "")
                                    .foregroundColor(Color.myBlack)
                                    .font(.caption)
                                    .bold()
                            }
                    }
                }
                
                Spacer()
                
                HStack {
                    Text("\(Date().hourMinuteDateToString(date: schedule?.startTime ?? Date())) ~ \(Date().hourMinuteDateToString(date: schedule?.endTime ?? Date()))")
                        .foregroundColor(.black)
                        .font(.subheadline)
                    Spacer()
                    
                    Text(String("\(schedule?.lateFee ?? 0) 원" ?? "0 원"))
                        .foregroundColor(.black)
                        .bold()
                }
            }
            .padding(20)
        }
        .offset(y:1)
        //.padding(.horizontal, 20)
    }
}

struct AttendanceStatusListCell_Previews: PreviewProvider {
    static var previews: some View {
        AttendanceStatusListCell()
    }
}
