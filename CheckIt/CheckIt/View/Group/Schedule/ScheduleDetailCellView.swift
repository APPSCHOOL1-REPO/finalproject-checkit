//
//  ScheduleDetailView.swift
//  CheckIt
//
//  Created by 이학진 on 2023/02/08.
//

import SwiftUI

struct ScheduleDetailCellView: View {
    var schedule: Schedule
    
    var body: some View {
        VStack {
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 18)
                    .foregroundColor(Color.myLightGray)
                    .frame(height: UIScreen.screenHeight / 5.5)
                    .overlay {
                        RoundedRectangle(cornerRadius: 18)
                            .stroke(Color.myGray)
                            .frame(height: UIScreen.screenHeight / 5.5)
                    }
                
                VStack(alignment: .leading) {
                    
                    HStack {
                        customSymbols(name: "calendar")
                        // MARK: - 동아리 일정 날짜
                        Text("\(Date().yearMonthDayDateToString(date: schedule.startTime))")
                        .font(.system(size: 15, weight: .regular))
                    }
                    
                    HStack {
                        customSymbols(name: "clock")
                        // MARK: - 동아리 일정 시간
                        Text("\(Date().dotHourMinuteDateToString(date: schedule.startTime))")
                            .font(.system(size: 15, weight: .regular))

                        Text("~")
                        Text("\(Date().dotHourMinuteDateToString(date: schedule.endTime))")
                            .font(.system(size: 15, weight: .regular))
                        
                        Spacer()
                        
                        Image(systemName: "greaterthan")
                            .resizable()
                            .frame(width: 10, height: 15)
                            .foregroundColor(.gray)
                            .offset(x:10)
                    }
                    
                    HStack {
                        customSymbols(name: "mapPin")
                        // MARK: - 동아리 일정 장소
                        Text(schedule.location)
                    }
                }
                .padding(30)
                .foregroundColor(.black)
            }
        }
        .offset(y:1)
    }
}

//struct ScheduleDetailCellView_Previews: PreviewProvider {
//    static var previews: some View {
//        ScheduleDetailView()
//    }
//}
