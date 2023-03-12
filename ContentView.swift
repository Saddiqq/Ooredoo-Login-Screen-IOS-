//
//  ContentView.swift
//  LoginScreenUI
//
//  Created by Sadiq Al-LAWATI on 09/03/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var username = ""
    @State private var Password = ""
    @State private var wrongUsername = 0
    @State private var wrongPassword = 0
    @State private var showingLoginScreen = false
    var body: some View {
        NavigationView {
            ZStack{
                Color.red.ignoresSafeArea()
                Circle()
                    .scale(1.7)
                    .foregroundColor(.white.opacity(0.15))
                Circle()
                    .scale(1.35)
                    .foregroundColor(.white)
                
                VStack {
                    Text("Login")
                        .font(.largeTitle)
                        .bold()
                        .padding()
                    TextField("Username", text: $username)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                        .border(Color.red, width: CGFloat(wrongUsername))
                    if (wrongUsername != 0) {
                                           Text("Wrong username entered")
                                               .foregroundColor(.red)
                                       }
                    
                    SecureField("Password", text: $Password)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                        .border(Color.red, width: CGFloat(wrongPassword))
                    if (wrongPassword != 0) {
                                           Text("Wrong password entered")
                                               .foregroundColor(.red)
                                       }

                    Button("Login"){
                        authinticateUser(username: username, password: Password)
                    }
                    .foregroundColor(.white)
                    .frame(width: 300, height: 50)
                    .background(Color.red)
                    .cornerRadius(10)
                    
                    NavigationLink(destination: Text("Login Successful @\(username)"), isActive: $showingLoginScreen) {
                        EmptyView()
                        
                        }
                    
                }
                
                    
    }
            .navigationBarHidden(true)
    }
      
        
}
    func authinticateUser(username:String, password:String) {
        if username.lowercased() == "sadiq511" {
        wrongUsername = 0
            if password.lowercased() == "password123" {
                wrongPassword = 0
                showingLoginScreen = true

    } else {
    wrongPassword = 2
    }
        } else {
    wrongUsername = 2
    }
}
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
