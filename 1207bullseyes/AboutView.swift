//
//  aboutView.swift
//  1207bullseyes
//
//  Created by Yahsuan on 22/12/2020.
//  Copyright © 2020 Yahsuan. All rights reserved.
//

import SwiftUI


struct HeadingStyle : ViewModifier {
    func body(content: Content) -> some View {
        return content
            .foregroundColor(.black)
            .font(Font.custom("Arial Rounded MT Bold", size: 30))
            .padding(.vertical, 15)
    }
}

struct TextViewsStyle : ViewModifier {
    func body(content: Content) -> some View {
        return content
            .foregroundColor(.black)
            .font(Font.custom("Arial Rounded MT Bold", size: 16))
            .padding(.horizontal, 40)
            .padding(.bottom,20)
    }
}

struct AboutView: View {
    var body: some View {
        
        ZStack {
            Color("bgColor").ignoresSafeArea()
            
            VStack {
                Text("🎯 BULLSEYE 🎯").modifier(HeadingStyle())
                
                Text("This is Bullseye, the game where you can win points and earn fame by dragging a slider.").modifier(TextViewsStyle())
                
                Text("Your goal is to place the slider as close as possible to the target value. The closer you are, the more points you score.").modifier(TextViewsStyle())
                
                Text("Enjoy 💕").modifier(TextViewsStyle())
             
            }
            .navigationBarTitle("About Bullseye")
            .background(Color("textColor").cornerRadius(20))
            .padding(20)

        }
    }

}

struct aboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView().previewLayout(.fixed(width: 896, height: 414))
    }
}
