//
//  GroupScheduleView.swift
//  CheckIt
//
//  Created by 조현호 on 2023/01/18.
//

import SwiftUI

struct GroupScheduleView: View {
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Spacer()
                    
                    NavigationLink {
                        AddScheduleView()
                    } label: {
                        Image(systemName: "plus")
                            .foregroundColor(.black)
                    }
                }
                .padding(.horizontal, 30)
                .padding(.bottom)
                
                ScrollView {
                    ZStack{
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(Color.myLightGray)
                            .frame(width: .infinity, height:150)
                        
                        HStack {
                            VStack(alignment: .leading){
                                //날짜
                                HStack {
                                    Image(systemName: "calendar")
                                        .foregroundColor(Color.myGreen)
                                    Text("3월 17일")
                                }
                                
                                //시간
                                HStack {
                                    Image(systemName: "clock")
                                        .foregroundColor(Color.myGreen)
                                    Text("오후 3:00 ~ 오후 7:00")
                                }
                                .padding(.vertical, 5)
                                
                                //장소
                                HStack {
                                    Image(systemName: "mappin.and.ellipse")
                                        .foregroundColor(Color.myGreen)
                                    Text("신촌 베이스볼클럽")
                                }
                            }
                            
                            Spacer()
                        }
                        .padding(.leading, 20)
                    }
                    .padding(.vertical, 10)
                    .padding(.horizontal, 40)
                    
                    ZStack{
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(Color.myLightGray)
                            .frame(width: .infinity, height:150)
                        
                        HStack {
                            VStack(alignment: .leading){
                                //날짜
                                HStack {
                                    Image(systemName: "calendar")
                                        .foregroundColor(Color.myGreen)
                                    Text("3월 10일")
                                }
                                
                                //시간
                                HStack {
                                    Image(systemName: "clock")
                                        .foregroundColor(Color.myGreen)
                                    Text("오후 3:00 ~ 오후 7:00")
                                }
                                .padding(.vertical, 5)
                                
                                //장소
                                HStack {
                                    Image(systemName: "mappin.and.ellipse")
                                        .foregroundColor(Color.myGreen)
                                    Text("신촌 베이스볼클럽")
                                }
                            }
                            
                            Spacer()
                        }
                        .padding(.leading, 20)
                    }
                    .padding(.vertical, 10)
                    .padding(.horizontal, 40)
                    
                    ZStack{
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(Color.myLightGray)
                            .frame(width: .infinity, height:150)
                        
                        HStack {
                            VStack(alignment: .leading){
                                //날짜
                                HStack {
                                    Image(systemName: "calendar")
                                        .foregroundColor(Color.myGreen)
                                    Text("3월 3일")
                                }
                                
                                //시간
                                HStack {
                                    Image(systemName: "clock")
                                        .foregroundColor(Color.myGreen)
                                    Text("오후 3:00 ~ 오후 7:00")
                                }
                                .padding(.vertical, 5)
                                
                                //장소
                                HStack {
                                    Image(systemName: "mappin.and.ellipse")
                                        .foregroundColor(Color.myGreen)
                                    Text("신촌 베이스볼클럽")
                                }
                            }
                            
                            Spacer()
                        }
                        .padding(.leading, 20)
                    }
                    .padding(.vertical, 10)
                    .padding(.horizontal, 40)
                }
            }
        }
    }
}


struct GroupScheduleView_Previews: PreviewProvider {
    static var previews: some View {
        GroupScheduleView()
    }
}
