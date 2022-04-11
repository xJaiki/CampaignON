//
//  ContentView.swift
//  progettoFinale
//
//  Created by Mario Di Marino on 29/01/21.
//

import SwiftUI



struct ContentView: View {
    
//    init() {
//        UITabBar.appearance().barTintColor = UIColor(.red)
//    }
    
    var body: some View {
        TabView {
            mapView().tabItem {
                Text("Map")
                Image("map" )
            }.tag(1)
            diceView().tabItem {
                Text("Dice")
                Image("dice")
                
            }.tag(2)
            characterView().tabItem {
                Text("Characters")
                Image("characters")
                
            }.tag(3)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()

        }
    }
}

extension ContentView: NearbyServiceDelegate{
    func multiPeer(didReceiveData data: Data, ofType type: UInt32, from peerID: MCPeerID) {
        switch type {
            case DataType.string.rawValue:
              let string = data.convert() as! String
              // do something with the received string
              break
                      
            case DataType.image.rawValue:
              let image = UIImage(data: data)
              // do something with the received UIImage
              break
                      
            default:
              break
          }
    }
    
    
    
    
}
