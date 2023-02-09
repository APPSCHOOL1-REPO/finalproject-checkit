//
//  LottieView.swift
//  CheckIt
//
//  Created by 류창휘 on 2023/02/09.
//

import Lottie
import SwiftUI
import UIKit
 
struct LottieView: UIViewRepresentable {
    //5.
    var filename: String
    let animationView = LottieAnimationView()

    func makeUIView(context: Context) -> UIView {
        //3.
        let view = UIView(frame: .zero)

        animationView.animation = .named(filename)

        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .playOnce

        animationView.play()
        
        animationView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(animationView)
        

        NSLayoutConstraint.activate([

            animationView.widthAnchor.constraint(equalTo: view.widthAnchor),
            animationView.heightAnchor.constraint(equalTo: view.heightAnchor)
        ])
        
        
        return view
    }

    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<LottieView>) {

    }
    
}