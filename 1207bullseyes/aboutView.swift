//
//  aboutView.swift
//  1207bullseyes
//
//  Created by Yahsuan on 22/12/2020.
//  Copyright © 2020 Yahsuan. All rights reserved.
//

import SwiftUI

let bground = Color(red: 255/255, green: 214/255, blue: 179/255)


struct HeadingStyle : ViewModifier {
    func body(content: Content) -> some View {
        return content
            .foregroundColor(.black)
            .font(Font.custom("Arial Rounded MT Bold", size: 30))
            .padding(.top,20)
            .padding(.bottom,20)
    }
}

struct TextViewsStyle : ViewModifier {
    func body(content: Content) -> some View {
        return content
            .foregroundColor(.black)
            .font(Font.custom("Arial Rounded MT Bold", size: 16))
            .padding(.leading,60)
            .padding(.trailing,60)
            .padding(.bottom,20)
    }
}

struct aboutView: View {
    var body: some View {
        
        Group {
        VStack {
            Text("🎯 BULLSEYE 🎯").modifier(HeadingStyle())
            
            Text("This is Bullseye, the game where you can win points and earn fame by dragging a slider.").modifier(TextViewsStyle())
            
            Text("Your goal is to place the slider as close as possible to the target value. The closer you are, the more points you score.").modifier(TextViewsStyle())
            
            Text("Enjoy💕").modifier(TextViewsStyle())
         
        }
        .navigationBarTitle("About Bullseye")
        .background(bground)
        }
    .background(Image("Background"))
    }

}

struct aboutView_Previews: PreviewProvider {
    static var previews: some View {
        aboutView().previewLayout(.fixed(width: 896, height: 414))
    }
}
