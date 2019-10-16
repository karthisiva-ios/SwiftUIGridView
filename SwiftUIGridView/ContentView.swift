//
//  ContentView.swift
//  SwiftUIGridView
//
//  Created by MACBOOKPRO on 16/10/19.
//  Copyright © 2019 Kuwy Technology. All rights reserved.
//

import SwiftUI
let companines = [Companies(id:1,name: "Grifffin Infosystems"),Companies(id:2,name: "Optisol Business Solution"),Companies(id:3,name: "Vishwak solutions"),Companies(id:4,name:  "Kuwy Technology")]

struct ContentView: View {
    var body: some View {
        VStack() {
            //First update to Remote
            Text("List of companies and its status").font(.largeTitle)
            CustomeView()
        }.padding(.top,30)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
struct CustomeView : View {
    @State private var showingAlert = false

    var body: some View {
            List(companines){ company in
                Button(action: {
                    // What to perform
                    print(company.name)
                    self.showingAlert = true
                }) {
                    // How the button looks like
                   if company.id == 4{ Text(company.name).font(.subheadline).foregroundColor(.green)
                       }else{                        Text(company.name).font(.subheadline)
                               .foregroundColor(.red)
                       }
                }.alert(isPresented: self.$showingAlert) {
                    Alert(title: Text("Selected Company"), message: Text(company.name), dismissButton: .default(Text("Got it!")))
                }
//
//                if company.id == 4{ Text(company.name).font(.subheadline).foregroundColor(.green)
//                }else{
//                    Text(company.name).font(.subheadline)
//                        .foregroundColor(.red)
//                }
               
            }
               
       }
}
struct Companies: Identifiable {
    let id : Int
    let name : String
}
