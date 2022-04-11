//
//  map.swift
//  progettoFinale
//
//  Created by Mario Di Marino on 29/01/21.
//

import Foundation
import SwiftUI
import UIKit



struct mapView: View{
   
    let nearbyService = NearbyService(serviceType: "demo")
    
    @State private var isShowPhotoLibrary = false
    @State private var isShowCamera = false
   
       @State private var image = UIImage(named: "defaultMap")
    
  
    var body: some View {

        NavigationView {
            ZStack {
                    Image("background")
                        .resizable()
                        .edgesIgnoringSafeArea(.all)
            VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 30){
//                MARK: ANTEPRIMA MAPPA
                if let imageData = UserDefaults.standard.object(forKey: "prova"),
                   let im = UIImage(data: imageData as! Data) {
                    Image(uiImage: im)
                        .resizable()
                        .frame(width: 200, height: 200, alignment: .center)
                        .cornerRadius(10)
                        .onAppear{
                            image = im
                        }
                    
                        
                }else{
                Image(uiImage: self.image!)
                    .resizable()
                    .frame(width: 200, height: 200, alignment: .center)
                    .cornerRadius(10)
                }
//                MARK: NOME MAPPA
               
                
//                MARK: FOTOCAMERA
                Button(action: {
                    self.isShowCamera = true
                    galleryKey = true
                    
                }) {
                    Text("Camera")
//                        .foregroundColor(.purple)
                        .frame(width: 200, height: .none, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .padding()
                        .background(Color.init(red: 47/255, green: 31/255, blue: 22/255))
                        .cornerRadius(40)
                        .foregroundColor(Color.init(red: 241/255, green: 215/255, blue: 153/255))
                        .font(.system(size: 18, weight: .heavy, design: .default))
                }
                .sheet(isPresented: $isShowCamera) {
                    ImagePicker(selectedImage: Binding(self.$image)!, sourceType: .camera)}
                
//                MARK: GALLERIA
                Button(action: {
                    self.isShowPhotoLibrary = true
                    galleryKey = true
                }) {
                    Text("Gallery")
                        .frame(width: 200, height: .none, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .padding()
                        .background(Color.init(red: 47/255, green: 31/255, blue: 22/255))
                        .cornerRadius(40)
                        .foregroundColor(Color.init(red: 241/255, green: 215/255, blue: 153/255))
                        .font(.system(size: 18, weight: .heavy, design: .default))
                }
                Spacer()
                    .sheet(isPresented: $isShowPhotoLibrary) {
                        ImagePicker(selectedImage: Binding(self.$image)!, sourceType: .photoLibrary)
                        
                    }
                   
             
                Button(action: {
                    
                    nearbyService.send(object: self.image?.jpegData(compressionQuality: 0.3), type: DataType.image.rawValue)
                   
                }) {
                    Text("Send")
                        .frame(width: 200, height: .none, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .padding()
                        .background(Color.init(red: 47/255, green: 31/255, blue: 22/255))
                        .cornerRadius(40)
                        .foregroundColor(Color.init(red: 241/255, green: 215/255, blue: 153/255))
                        .font(.system(size: 18, weight: .heavy, design: .default))
                }
                   
            }
           
            .padding(60)
        }
            .navigationBarTitle("Map")
            .onAppear{
            self.nearbyService.nearbyServiceDelgate = self
        }
        }
    }
}
extension mapView: NearbyServiceDelegate{
    func multiPeer(didReceiveData data: Data, ofType type: UInt32, from peerID: MCPeerID) {
        switch type {
            case DataType.string.rawValue:
              let string = data.convert() as! String
              // do something with the received string
              break
                      
            case DataType.image.rawValue:
              let image = UIImage(data: data)
              print("image sent")
               
                break
                      
            default:
              break
          }
    }
    
    
    
    
}
