//
//  AttendanceCellView.swift
//  CheckIt
//
//  Created by 이학진 on 2023/01/18.
//

import SwiftUI

struct AttendanceCellView: View {
    @EnvironmentObject var attendanceStore: AttendanceStore
    var schedule: Schedule
    
    var body: some View {
        HStack {
            VStack(alignment:.leading, spacing: 0) {
                Text(Date().yearMonthDayHourMinuteToString(date: schedule.startTime)) // 출석 날짜
                    .font(.system(size: 13, weight: .medium))
                    .foregroundColor(.black)
                    .padding(.bottom, 11)
                    .padding(.leading, 21)
                
                HStack {
                    HStack {
                        Text("출석")
                        Text("\(schedule.attendanceCount)")   //출석 횟수
                            .foregroundColor(.myGreen)
                            .bold()
                    }
                    
                    Divider().frame(height:20)
                    
                    HStack {
                        Text("지각")
                        Text("\(schedule.lateCount)")   //지각 횟수
                            .foregroundColor(.myOrange)
                            .bold()
                    }
                    
                    Divider().frame(height:20)
                    
                    HStack {
                        Text("결석")
                        Text("\(schedule.absentCount)")   //결석 횟수
                            .foregroundColor(.myRed)
                            .bold()
                    }
                    
                    Divider().frame(height:20)
                    
                    HStack {
                        Text("공결")
                        Text("\(schedule.officiallyAbsentCount)")   //공결 횟수
                            .foregroundColor(.myBlack)
                            .bold()
                    }
                }
                .foregroundColor(.black)
                .font(.system(size: 16, weight: .medium))
                .padding(.leading, 21)
            }
            
            Spacer()
            
            Image(systemName: "greaterthan")
                .resizable()
                .frame(width: 10, height: 15)
                .foregroundColor(.gray)
                .padding(.trailing, 21)
        }
        .background {
            RoundedRectangle(cornerRadius: 18)
                .foregroundColor(.myLightGray)
                .frame(height: 90)
                .overlay {
                    RoundedRectangle(cornerRadius: 18)
                        .stroke(Color.myGray)
                        .frame(height: 90)
                }
            
        }
        .offset(y:1)
        .frame(height: 90)
        .onAppear {
            print(attendanceStore.entireAttendanceList, "dd")
        }
    }
}

//struct AttendanceCellView_Previews: PreviewProvider {
//    static var previews: some View {
//        AttendanceCellView(, schedule: <#Schedule#>)
//    }
//}
