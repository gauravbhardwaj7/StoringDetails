
//
//  ContentView.swift
//  StoreDetails
//
//  Created by Gaurav Bhardwaj on 10/04/23.
//

import SwiftUI
import FirebaseFirestore



struct ContentView: View {
    
    @State private var userName: String = ""
    @State private var name: String = ""
    @State private var mobileNumber: String = ""
    @State private var email: String = ""
    @State private var dateOfBirth:String = ""
    @State private var presentAlert = false
    @State private var titleText: String = ""
@State private var textInput: String = ""
   
    var body: some View {
        
        ZStack {
            Image("photo").resizable()
                .scaledToFill()
            
            
            VStack(spacing: 20){
                
                Text("Sign Up to Join Our Family")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .font(.system(size: 40))
                    .offset(x: -100, y:50)
                
                
                
                Group{
                    
                    TextField("userName",text: $userName)
                        .foregroundColor(.white)
                        .textFieldStyle(.plain)
                        .placeholder(when: userName.isEmpty) {
                            
                            Text("UserName")
                                .foregroundColor(.white)
                                .font(.system(size: 30))
                                .offset(x: -100, y:60)
                            
                            
                        }
                    
                    Rectangle()
                        .frame(width: 400, height: 1)
                        .foregroundColor(.white)
                        .offset(x: -100, y:60)
                    
                    
                    TextField("name",text: $name)
                        .foregroundColor(.white)
                        .textFieldStyle(.plain)
                        .placeholder(when: name.isEmpty) {
                            Text("Name")
                                .foregroundColor(.white)
                                .font(.system(size: 30))
                                .offset(x: -100, y:60)
                        }
                    
                    
                    
                    Rectangle()
                        .frame(width: 400, height: 1)
                        .foregroundColor(.white)
                        .offset(x: -100, y:60)
                }
                
                Group{
                    
                    TextField("mobileNumber",text: $mobileNumber)
                        .foregroundColor(.white)
                        .textFieldStyle(.plain)
                        .placeholder(when: mobileNumber.isEmpty) {
                            Text("Mobile Number")
                                .foregroundColor(.white)
                                .font(.system(size: 30))
                                .offset(x: -100, y:60)
                        }
                    
                    
                    
                    
                    Rectangle()
                        .frame(width: 400, height: 1)
                        .foregroundColor(.white)
                        .offset(x: -100, y:60)
                    
                    
                    TextField("email",text: $email)
                        .foregroundColor(.white)
                        .textFieldStyle(.plain)
                        .placeholder(when: email.isEmpty) {
                            Text("E-mail")
                                .foregroundColor(.white)
                                .font(.system(size: 30))
                                .offset(x: -100, y:60)
                        }
                    
                    
                    
                    
                    Rectangle()
                        .frame(width: 400, height: 1)
                        .foregroundColor(.white)
                        .offset(x: -100, y:60)
                }
                
                TextField("DateOfBirth",text: $dateOfBirth)
                                    .foregroundColor(.white)
                                    .textFieldStyle(.plain)
                                    .placeholder(when: dateOfBirth.isEmpty) {
                                        Text("date of birth")
                                            .foregroundColor(.white)
                                            .font(.system(size: 30))
                                            .offset(x: -100, y:60)
                                        

                                    }
                Rectangle()
                    .frame(width: 400, height: 1)
                    .foregroundColor(.white)
                    .offset(x: -100, y:60)
                Button {
                    //signup
                    let db = Firestore.firestore()
                                                    let docRef = db.collection("User").document("useruid")
                                                    let subCollectionRef = docRef.collection("basic_data")
                                    let subDocRef = subCollectionRef.document("contact_info")
                    subDocRef.updateData(["name": name])
                    subDocRef.updateData(["PhoneNumber": mobileNumber])
                    subDocRef.updateData(["Username": userName])
                    subDocRef.updateData(["Email_ID": email])
                    subDocRef.updateData(["DateOfBirth" : dateOfBirth])
                    
                                         
                                         
                                         
                                         
                                         
                } label: {
                    Text("Next")
                        
                        .bold()
                        .frame(width: 210, height: 40)
                        .background(RoundedRectangle(cornerRadius: 10,style: .continuous)
                            .fill(.white)
                            
                                    
                                    
                        )
                        .foregroundColor(.black)
                        .offset(x: -90, y:80)
                        
                    
                }
                Button {
                    //login
                } label: {
                    Text("Log-In")
                        .bold()
                        .bold()
                        .frame(width: 125, height: 35)
                        .background(Color.clear)
                        .border(.white)
                        
                }
                .foregroundColor(.white)
                .offset(x: 40, y:-600)
                .padding(.top)


                
            }
            .frame(width:350)
            
        }
        .ignoresSafeArea()
        
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension View {
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {

        ZStack(alignment: alignment) {
            placeholder().opacity(shouldShow ? 1 : 0)
            self
        }
    }
}
