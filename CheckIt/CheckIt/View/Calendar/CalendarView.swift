//
//  CalendarView.swift
//  CheckIt
//
//  Created by 윤예린 on 2023/01/18.
//

import SwiftUI

struct CalendarView: View {
    
    @State var currentDate: Date = Date()
    
    var body: some View {
        VStack {
            //달력섹션
            CustomDatePickerView(currentDate: $currentDate)
            //일정섹션
            ScheduleView()
            Spacer()
        }
        .padding(.vertical)
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}
