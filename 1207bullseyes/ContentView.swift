//
//  ContentView.swift
//  1207bullseyes
//
//  Created by Yahsuan on 07/12/2020.
//  Copyright © 2020 Yahsuan. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var alertIsVisible = false
    @State var sliderValue = 50.0
    @State var target = Int.random(in: 1...100)
    @State var score = 0
    @State var currentRound = 1
    
    
    struct LabelStyle : ViewModifier {
        func body(content: Content) -> some View {
            return content
                .foregroundColor(Color("textColor"))
                .font(Font.custom("Arial Rounded MT Bold", size: 18))
        }
    }
    
    struct ButtonLgTextStyle : ViewModifier {
        func body(content: Content) -> some View {
            return content
                .foregroundColor(.black)
                .font(Font.custom("Arial Rounded MT Bold", size: 16))
        }
    }
    
    struct ButtonSmTextStyle : ViewModifier {
        func body(content: Content) -> some View {
            return content
                .foregroundColor(.black)
                .font(Font.custom("Arial Rounded MT Bold", size: 10))
        }
    }
    
    struct ValueStyle : ViewModifier {
        func body(content: Content) -> some View {
            return content
                .foregroundColor(Color("numColor"))
                .font(Font.custom("Arial Rounded MT Bold", size: 24))
        }
    }
    

    
    var body: some View {
        
        
        
        VStack {
            
            
            Spacer()
            
            //target row
            HStack {
                
                Text("Put the bullseye as close as you can to :").modifier(LabelStyle())
                Text("\(target)").modifier(ValueStyle())
                
                
            }
            Spacer()
            
            //slider row
            HStack {
                Text("1").modifier(LabelStyle())
                Slider(value: $sliderValue, in: 1...100)
                    .accentColor(.orange)
                Text("100").modifier(LabelStyle())
                
            }
            
            
            
            Spacer()
            
            //button row
            Button(action: {
                print("Button pressed!!!!")
                alertIsVisible = true
                
            }) {
                Text("Hit me 👊🏽").modifier(ButtonLgTextStyle())
            }
            .alert(isPresented: $alertIsVisible) { () ->
                Alert in
                //let roundedValue: Int = Int(sliderValue.rounded())
                return Alert (title: Text(alertTitle()), message: Text(
                    "The slider's value is \(sliderValueRounded()).\n" + "You scored \(PointsForCurrentRound()) points this round."
                ), dismissButton: .default(Text("AWESOME!!")) {
                    self.score = self.score + self.PointsForCurrentRound()
                    self.target = Int.random(in:1...100)
                    self.currentRound = 1 + self.currentRound
                })
            }
            .padding(10)
            .background(
                Color("buttonBgColor")
                    .cornerRadius(8)
            )
            
            Spacer()
            //score row
            HStack {
                Button(action: {
                    
                    self.score = 0
                    self.currentRound = 1
                    self.target = Int.random(in:1...100)
                    self.sliderValue = 50.0
                    
                }) {
                    HStack {
                        
                        Image(systemName: "arrow.counterclockwise")
                            .foregroundColor(.black)
                        
                        Text("START OVER").modifier(ButtonSmTextStyle())
                    }
                    .padding()
                    
                }
                .frame(height: 40)
                .background(
                    Color("buttonBgColor")
                        .cornerRadius(8)
                )
                
                
                
                
                
                
                Spacer()
                Text("score:").modifier(LabelStyle())
                Text("\(score)").modifier(ValueStyle())
                Spacer()
                Text("round:").modifier(LabelStyle())
                Text("\(currentRound)").modifier(ValueStyle())
                Spacer()
                
                NavigationLink(
                    destination: AboutView(),
                    label: {
                        
                        HStack {
                            Image(systemName: "info.circle")
                                .foregroundColor(.black)
                            Text("INFO").modifier(ButtonSmTextStyle())
                        }
                        .padding()
                        .frame(height: 40)
                        .background(
                            Color("buttonBgColor")
                                .cornerRadius(8)
                        )

                    })
                
             
                
                
                
            }
            .padding(.bottom, 20)
            
            
        }
        .padding(.horizontal, 20)
        .background(Color("bgColor"))
        .navigationBarTitle("Bullseye")
    }
    
    func sliderValueRounded() -> Int {
        return Int(sliderValue.rounded())
        
    }
    
    func amountOff() -> Int {
        return abs(target-sliderValueRounded())
    }
    
    
    func PointsForCurrentRound() -> Int {
        
        let awardedPoints = 100 - amountOff()
        var bonus : Int
        let difference = amountOff()
        
        if difference == 0 {
            bonus = 100
        } else if difference == 1 {
            bonus = 50
        } else {
            bonus = 0
        }
        
        return awardedPoints+bonus
    }
    
    func alertTitle() -> String {
        let difference = amountOff()
        let title : String
        
        if difference == 0 {
            title = "Perfect🎉🎉🎉"
        } else if difference < 5 {
            title = "Almost there😉😉😉"
        } else if difference <= 10 {
            title = "Not bad😇"
        } else {
            title = "Are U even trying???🤷🏼‍♀️"
        }
        return title
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        ContentView()
            .previewLayout(.fixed(width: 2532 / 3.0, height: 1170 / 3.0))
            .environment(\.horizontalSizeClass, .regular)
            .environment(\.verticalSizeClass, .compact)
        
    }
}





