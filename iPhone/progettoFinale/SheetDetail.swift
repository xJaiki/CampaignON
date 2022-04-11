//
//  SheetDetail.swift
//  progettoFinale
//
//  Created by Alessandro Volpe on 10/02/21.
//

import Foundation
import SwiftUI

struct SheetDetailView: View {
    var image: UIImage
    var name: String
    var race: String
    var Class: String
    var hp: String = ""
    var ac: String = ""
    var sp: String = ""
    var In: String = ""
    var pp: String = ""
    var cr: String = ""
    
    
    var body: some View{
        ZStack {
                Image("background")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
        VStack{
            Image(uiImage: image)
                .resizable()
                .frame(width: 150,height: 150)
                .cornerRadius(100)
            
            VStack{
                Text("Name")
                    .foregroundColor(Color.init(red: 241/255, green: 215/255, blue: 153/255))
                    .font(.system(size: 15, weight: .light, design: .default))
                    .frame(width: 350, height: .none, alignment: .leading)
                Text(name)
                    .foregroundColor(Color.init(red: 241/255, green: 215/255, blue: 153/255))
                    .font(.system(size: 20, weight: .heavy, design: .default))
                    .frame(width: 350, height: .none, alignment: .leading)
                Divider()
                Text("Race")
                    .foregroundColor(Color.init(red: 241/255, green: 215/255, blue: 153/255))
                    .font(.system(size: 15, weight: .light, design: .default))
                    .frame(width: 350, height: .none, alignment: .leading)
                Text(race)
                    .foregroundColor(Color.init(red: 241/255, green: 215/255, blue: 153/255))
                    .font(.system(size: 20, weight: .heavy, design: .default))
                    .frame(width: 350, height: .none, alignment: .leading)
                Divider()
                Text("Class")
                    .foregroundColor(Color.init(red: 241/255, green: 215/255, blue: 153/255))
                    .font(.system(size: 15, weight: .light, design: .default))
                    .frame(width: 350, height: .none, alignment: .leading)
                Text(Class)
                    .foregroundColor(Color.init(red: 241/255, green: 215/255, blue: 153/255))
                    .font(.system(size: 20, weight: .heavy, design: .default))
                    .frame(width: 350, height: .none, alignment: .leading)
            }
            .multilineTextAlignment(.leading)
            .frame(width: 350, height: .none, alignment: .leading)
            .padding()
                .background(Color.init(red: 47/255, green: 31/255, blue: 22/255))
                .cornerRadius(15)
            
//            MARK: PRIMA FILA
            HStack{
                VStack{
                    Text("Health point:")
                        .foregroundColor(Color.init(red: 241/255, green: 215/255, blue: 153/255))
                        .font(.system(size: 15, weight: .light, design: .default))
                        .multilineTextAlignment(.center)
                        .padding(.bottom, 5)
                    Text(hp)
                        .foregroundColor(Color.init(red: 241/255, green: 215/255, blue: 153/255))
                        .font(.system(size: 15, weight: .heavy, design: .default))
                }
                .frame(width: 90, height: .none, alignment: .center)
                    .padding()
                    .background(Color.init(red: 47/255, green: 31/255, blue: 22/255))
                    .cornerRadius(15)
                VStack{
                    Text("Armor point:")
                        .foregroundColor(Color.init(red: 241/255, green: 215/255, blue: 153/255))
                        .font(.system(size: 15, weight: .light, design: .default))
                        .multilineTextAlignment(.center)
                        .padding(.bottom, 5)
                    Text(ac)
                        .foregroundColor(Color.init(red: 241/255, green: 215/255, blue: 153/255))
                        .font(.system(size: 15, weight: .heavy, design: .default))
                }
                    .frame(width: 90, height: .none, alignment: .center)
                    .padding()
                    .background(Color.init(red: 47/255, green: 31/255, blue: 22/255))
                    .cornerRadius(15)
                VStack{
                    Text("Speed point:")
                        .foregroundColor(Color.init(red: 241/255, green: 215/255, blue: 153/255))
                        .font(.system(size: 15, weight: .light, design: .default))
                        .multilineTextAlignment(.center)
                        .padding(.bottom, 5)
                    Text(sp)
                        .foregroundColor(Color.init(red: 241/255, green: 215/255, blue: 153/255))
                        .font(.system(size: 15, weight: .heavy, design: .default))
                }
                    .frame(width: 90, height: .none, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .padding()
                    .background(Color.init(red: 47/255, green: 31/255, blue: 22/255))
                    .cornerRadius(15)
            }
//            MARK: SECONDA FILA
            HStack{
                VStack{
                    Text("Initiative point:")
                        .foregroundColor(Color.init(red: 241/255, green: 215/255, blue: 153/255))
                        .font(.system(size: 15, weight: .light, design: .default))
                        .multilineTextAlignment(.center)
                        .padding(.bottom, 5)
                    Text(In)
                        .foregroundColor(Color.init(red: 241/255, green: 215/255, blue: 153/255))
                        .font(.system(size: 15, weight: .heavy, design: .default))
                }
                .frame(width: 90, height: .none, alignment: .center)
                    .padding()
                    .background(Color.init(red: 47/255, green: 31/255, blue: 22/255))
                    .cornerRadius(15)
                VStack{
                    Text("Passive perception:")
                        .foregroundColor(Color.init(red: 241/255, green: 215/255, blue: 153/255))
                        .font(.system(size: 15, weight: .light, design: .default))
                        .multilineTextAlignment(.center)
                        .padding(.bottom, 5)
                    Text(pp)
                        .foregroundColor(Color.init(red: 241/255, green: 215/255, blue: 153/255))
                        .font(.system(size: 15, weight: .heavy, design: .default))
                }
                    .frame(width: 90, height: .none, alignment: .center)
                    .padding()
                    .background(Color.init(red: 47/255, green: 31/255, blue: 22/255))
                    .cornerRadius(15)
                VStack{
                    Text("Class resource:")
                        .foregroundColor(Color.init(red: 241/255, green: 215/255, blue: 153/255))
                        .font(.system(size: 15, weight: .light, design: .default))
                        .multilineTextAlignment(.center)
                        .padding(.bottom, 5)
                    Text(cr)
                        .foregroundColor(Color.init(red: 241/255, green: 215/255, blue: 153/255))
                        .font(.system(size: 15, weight: .heavy, design: .default))
                }
                    .frame(width: 90, height: .none, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .padding()
                    .background(Color.init(red: 47/255, green: 31/255, blue: 22/255))
                    .cornerRadius(15)
            }
            Spacer()
        }
        }.navigationBarTitle(name)
}
    }

