//
//  AccountView.swift
//
//  Created by Никита Костин on 13.08.2020.
//  Copyright © 2020 Никита Костин. All rights reserved.
//

import SwiftUI
import UIKit
import MessageUI

struct CircleImage: View {
    var body: some View {
        Image("Me").resizable()
            .clipShape(Circle())
            .overlay(
                Circle().stroke(Color.orange, lineWidth: 4))
            .shadow(radius: 10)
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage()
    }
}
let phoneNumber = "+79171404450"

struct AccountView: View {
    @State var result: Result<MFMailComposeResult, Error>? = nil
    @State var isShowingMailView = false
    
    var body: some View {
        ZStack{
            Color.white
            .edgesIgnoringSafeArea(.all)
        VStack {
            Text("Nikita Kostin")
                .font(.title)
                .foregroundColor(.orange)
            HStack(alignment: .top) {
                Text("Male" + " | ")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                Text("Born  06.11.1998")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            Spacer()
            .frame(height: 20)
            CircleImage()
               .frame(width: 210.0, height: 180.0)
            Spacer()
                .frame(height: 20)
            Button(action: {
                if let url = URL(string: "tel://79171404450"), UIApplication.shared.canOpenURL(url) {
                        UIApplication.shared.open(url)
                }
            }, label: {
                    Image(systemName: "phone")
                    Text(phoneNumber)
            })
            
            Spacer()
            .frame(height: 20)
            

           Button(action: {
                self.isShowingMailView.toggle()
            }) {
                Text("nick.antony.koston@gmail.com")
                }
                .disabled(!MFMailComposeViewController.canSendMail())
                .sheet(isPresented: $isShowingMailView) {
                MailView(result: self.$result)
            }
        }
        }
    .padding()
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
