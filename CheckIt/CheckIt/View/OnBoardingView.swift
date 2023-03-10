//
//  OnBoardingView.swift
//  CheckIt
//
//  Created by 황예리 on 2023/02/13.
//

import SwiftUI

struct OnBoardingStep {
    let image: String
    let title: String
    let subTitle: String
    let description: String
    let toFrame: Int
}

private let onBoardingSteps = [
    OnBoardingStep(image: "map-navigation", title: "위치 기반 서비스로 출석하기", subTitle: "QR code 출첵, 길찾기 기능", description: "50m 반경 안에서 출석 버튼이 활성화되어요!", toFrame: 177),
    OnBoardingStep(image: "send-invitation", title: "우리만의 동아리 운영하기", subTitle: "운영진 권한 부여 및 구성원 강퇴 기능", description: "방장은 초대 코드를 공유해서\n동아리에 초대할 수 있어요!", toFrame: 150),
    OnBoardingStep(image: "checklist", title: "일정별 출석부로 정산하기", subTitle: "출결 인정시간 및 지각비 설정 기능", description: "방장은 정산 여부를 체크할 수 있어요!", toFrame: 75)
]

struct OnBoardingView: View {
    @State private var currentStep = 0
    @State private var onBoardingView = false
    
    @AppStorage("onboarding") var isOnboardingViewActive : Bool = true
    
    init() {
        UIScrollView.appearance().bounces = false
    }
    
    var body: some View {
        
        VStack {
            HStack {
                Spacer()
                Button {
                    isOnboardingViewActive = false
                } label: {
                    Text("건너뛰기")
                        .font(.system(size: 18, weight: .medium))
                        .padding(.horizontal, 5)
                        .padding(.vertical, 10)
                        .foregroundColor(.gray)
                }
            }
            
            TabView(selection: $currentStep) {
                ForEach(0..<onBoardingSteps.count) { it in
                    VStack {
                        LottieView(filename: "\(onBoardingSteps[it].image)", toFrame: onBoardingSteps[it].toFrame)
                            .modifier(LottieAnimationFrameModifier(index: it))
                        
                        
                        Text(onBoardingSteps[it].title)
                            .font(.system(size: 22, weight: .bold))
                        
                        VStack(spacing: 5) {
                            Text(onBoardingSteps[it].subTitle)
                                .font(.system(size: 17, weight: .medium))
                                .foregroundColor(Color.myGreen)
                                .padding(.top, 10)
                            
                            Text(onBoardingSteps[it].description)
                                .font(.system(size: 16, weight: .regular))
                                .multilineTextAlignment(.center)
                        }
                    }
                    .tag(it)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            
            HStack {
                ForEach(0..<onBoardingSteps.count) { it in
                    if it == currentStep {
                        Rectangle()
                            .frame(width: 20, height: 10)
                            .cornerRadius(10)
                            .foregroundColor(Color.myGreen)
                    } else {
                        Circle()
                            .frame(width: 10, height: 10)
                            .foregroundColor(.gray)
                    }
                }
                .padding(.bottom, 24)
            }
            
            Button {
                if self.currentStep < onBoardingSteps.count - 1 {
                    self.currentStep += 1
                } else {
                    isOnboardingViewActive = false
                }
            } label: {
                Text(currentStep < onBoardingSteps.count - 1 ? "다음" : "시작하기")
                    .modifier(GruopCustomButtonModifier())
                    .padding(.bottom, 20)
            }
        }
        .padding(.horizontal, 30)
    }
}

struct LottieAnimationFrameModifier: ViewModifier {
    var index: Int
    func body(content: Content) -> some View {
        // 2번째 로티 애니메이션 크기 조절
        if index == 1 {
            content
                .frame(width: UIScreen.screenWidth, height: UIScreen.screenHeight * 0.25)
                .padding(.bottom, 28)
        } else {
            content
                .frame(width: UIScreen.screenWidth * 0.4, height: UIScreen.screenHeight * 0.25)
                .padding(.bottom, 10)
        }
           
    }
}

struct OnBoardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingView()
    }
}
