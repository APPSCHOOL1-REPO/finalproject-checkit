//
//  GroupScheduleView.swift
//  CheckIt
//
//  Created by 조현호 on 2023/01/18.
//

import SwiftUI
import AlertToast

struct GroupScheduleView: View {
    var group: Group
    @EnvironmentObject var scheduleStore: ScheduleStore
    @EnvironmentObject var groupStore: GroupStore
    @EnvironmentObject var userStore: UserStore
    @EnvironmentObject var memberStore: MemberStore
    @State private var showToast = false
    
    @State private var isAddSheet: Bool = false
    @Binding var isGroupManager: Bool
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Spacer()
                    
                    Button {
                        isAddSheet.toggle()
                    } label: {
                        Image(systemName: "plus")
                            .resizable()
                            .frame(width:20, height:20)
                            .foregroundColor(.black)
                            .padding([.bottom, .trailing], 5)
                    }
                }
                .opacity(isGroupManager ? 1 : 0)
                .disabled(isGroupManager ? false : true)
                
                VStack {
                    ScrollView {
                        ForEach(scheduleStore.scheduleList) { schedule in
                            ScheduleDetailView(schedule: schedule)
                        }
                    }
                }
                .onAppear {
                }
                .onDisappear{
//                    // 다른 동아리의 일정이 나타나는 현상 때문에 초기화
//                    scheduleStore.scheduleList = []
                }
                .refreshable {
                    await scheduleStore.fetchSchedule(groupName: groupStore.groupDetail.name)
                }
            }
            .padding(.horizontal, 30)
        }
        .sheet(isPresented: $isAddSheet) {
            AddScheduleView(showToast: $showToast, group: group)
        }
        
        .toast(isPresenting: $showToast){
            
            // .alert is the default displayMode
            AlertToast(displayMode: .banner(.slide), type: .complete(Color.myGreen), title: "성공적으로 일정을 만들었어요!")
            
            //Choose .hud to toast alert from the top of the screen
            //AlertToast(displayMode: .hud, type: .regular, title: "Message Sent!")
            
            //Choose .banner to slide/pop alert from the bottom of the screen
            //AlertToast(displayMode: .banner(.slide), type: .regular, title: "Message Sent!")
        }
    }
    
}


//struct GroupScheduleView_Previews: PreviewProvider {
//    static var previews: some View {
//        GroupScheduleView(group: Group.sampleGroup)
//    }
//}
