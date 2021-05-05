//
//  ContentView.swift
//  SwiftUIBulleyeV2
//
//  Created by RelMac User Exercise2 on 2021/05/06.
//

import SwiftUI

struct ContentView: View {
    @State var alertIsVisible: Bool = false
    var body: some View {
        VStack{
            Text("Welcome to my first App")
                .fontWeight(.semibold)
                .foregroundColor(Color.gray)
                .padding()
            
            Button(action: {
                print("Button pressed")
                self.alertIsVisible = true
            }) {
                Text("Hit me!")
                    .foregroundColor(Color.red)
            }
            
            .alert(isPresented: self.$alertIsVisible){
                Alert(title: Text("Hello there!"),
                      message: Text("This is my first pop-up."),
                      dismissButton: .default(Text("Awesome!"))) // alertIsVisible = false
            } // End of .alert()
        } // End of VStack
    } // End of body
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
