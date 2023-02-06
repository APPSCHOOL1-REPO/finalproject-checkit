//
//  LateCostView.swift
//  CheckIt
//
//  Created by 이학진 on 2023/01/18.
//

import SwiftUI

struct LateCost: Identifiable, Hashable {
    var id = UUID().uuidString
    let name: String
    var attendance: String
    let cost: Int
}

struct AttendanceDetailView: View {
    @State private var selectedTap: AttendanceCategory = .attendanced
    @EnvironmentObject var attendanceStore: AttendanceStore
    
    var schedule: Schedule
    var body: some View {
        VStack {
            AttendancePickerView(selectedTap: $selectedTap, schedule: schedule)
                .padding()
                .padding(.top, UIScreen.main.bounds.height / 30)
            
            AttendanceCategoryView(selection: selectedTap, schedule: schedule)
            
            Spacer()
        }
        .navigationTitle("\(Date().yearMonthDayDateToString(date: schedule.startTime)) 출석부")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            print(schedule.id, "스케줄 아이디")
            attendanceStore.fetchAttendance(scheduleID: schedule.id)
        }
        
    }
}

//struct LateCostView_Previews: PreviewProvider {
//    static var previews: some View {
//        AttendanceDetailView()
//    }
//}
