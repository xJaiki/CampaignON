//
//  ContentView.swift
//  progetto
//
//  Created by Alessandro Volpe on 01/02/21.
//

import SwiftUI
import SpriteKit

struct ContentView: View {
    var scene: SKScene {
        let scene = SKScene(fileNamed: "GameScene")
        scene!.size = CGSize(width: 1920, height: 1080)
        scene?.scaleMode = .aspectFit
        return scene!
            
    }
    

var body: some View {
    SpriteView(scene: scene)
        
        .edgesIgnoringSafeArea(.all)
 }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
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
                
              print("image sent")
                
               
                break
                      
            default:
              break
          }
    }
    
    
}
