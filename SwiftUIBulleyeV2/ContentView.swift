//
//  ContentView.swift
//  SwiftUIBulleyeV2
//
//  Created by RelMac User Exercise2 on 2021/05/06.
//

import SwiftUI

struct ContentView: View {
    //Properties
    //==========
    
    //stage for User Interface views
    @State var alertIsVisible: Bool = false
    @State var sliderValue: Double = 50.0
    @State var target: Int = Int.random(in: 1...100)
    @State var score = 0
    @State var round = 1
    
    var sliderValueRounded: Int {
        Int(self.sliderValue.rounded())
    }
    var body: some View {
        VStack{
            HStack {
                Text("Put the bull eye as close as you can do:")
                Text("100")
                    .fontWeight(.semibold)
                    .foregroundColor(Color.gray)
                    .padding()
                
                
            }
            Spacer()
            
            //Slider row
            //TODO: Add view for the Slider row here
            HStack {
                Text("1")
                Slider(value: self.$sliderValue, in:1...100)
                Text("100")
                    .fontWeight(.semibold)
                    .foregroundColor(Color.black)
                    .padding()
            }
            Spacer()
            
            //Button row
            Button(action: {
                print("Points awarded: \(self.pointsForCurrentRound())")
                self.alertIsVisible = true
                
            }) {
                Text("Hit me!")
                    .foregroundColor(Color.red)
            }
            //State for alert
            .alert(isPresented: self.$alertIsVisible){
                Alert(title: Text("Hello there!"),
                        message: Text(self.scoringMessage()),
                        dismissButton: .default(Text("Awesome!")){ // alertIsVisible = false
                        self.score = self.score + self.pointsForCurrentRound()
                        self.target = Int.random(in: 1...100)
                        self.round += 1
                }) // End of .alert()
            }
            Spacer()
            
            //Score row
            //TODO: Add view for the score, rounds, and start over and info button
            HStack {
                Button(action:{}){
                    Text("Start over")
                }
                Spacer()
                Text("Score:")
                Text("\(self.score)")
                Spacer()
                Text("Round:")
                Text("\(self.round)")
                Spacer()
                Button(action:{}){
                    Text("Inform")
                }
            }.padding(.bottom, 20)
        } // End of VStack
    } // End of body
    
    //Methods
    func pointsForCurrentRound() -> Int {

        let maximumScore = 100
        let difference = abs(self.sliderValueRounded - self.target)
        return maximumScore - difference
    }
    
    func scoringMessage() -> String {
        return "The slider's value is \(self.sliderValueRounded).\n" +
                "The target value is \(self.target).\n" +
                "You scored \(pointsForCurrentRound()) points this round."
    }
}// End of struct


//Preview
//=============
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
