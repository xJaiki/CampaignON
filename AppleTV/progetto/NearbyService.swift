//
//  NearbyService.swift
//  progettoFinale
//
//  Created by Alessandro Volpe on 06/02/21.
//

import Foundation
import MultipeerConnectivity

class NearbyService: NSObject {
    var nearbyServiceDelgate: NearbyServiceDelegate?
    var isConnected = false
    
    private var serviceType = "nearby"
    
    private let peerID = MCPeerID(displayName: UIDevice.current.name)
    private let nearbyServiceAdvertiser: MCNearbyServiceAdvertiser
    private let nearbyServiceBrowser: MCNearbyServiceBrowser
    
    lazy var session: MCSession = {
        let session = MCSession(peer: peerID, securityIdentity: nil, encryptionPreference: .required)
        session.delegate = self
        return session
    }()
    
    override init() {
        nearbyServiceAdvertiser = MCNearbyServiceAdvertiser(peer: peerID, discoveryInfo: nil, serviceType: serviceType)
        nearbyServiceBrowser = MCNearbyServiceBrowser(peer: peerID, serviceType: serviceType)
        super.init()
        nearbyServiceAdvertiser.delegate = self
        nearbyServiceAdvertiser.startAdvertisingPeer()
        print("\(peerID.displayName) started advertising peer...")
        
        nearbyServiceBrowser.delegate = self
        nearbyServiceBrowser.startBrowsingForPeers()
        print("\(peerID.displayName) started browsing for peers...")
        
    }
    convenience init(serviceType: String){
        self.init()
        self.serviceType = serviceType
    }

    deinit {
        nearbyServiceAdvertiser.stopAdvertisingPeer()
        nearbyServiceBrowser.stopBrowsingForPeers()
    }
    public func send(object: Any, type: UInt32) {
        if isConnected {
            do{
            let data = try NSKeyedArchiver.archivedData(withRootObject: object, requiringSecureCoding: false)

            send(data: data, type: type)
            }catch let error{
                print(error.localizedDescription)
            }
        }
    }
    public func send(data: Data, type: UInt32) {
        if isConnected {
            do {
                let container: [Any] = [data, type]
                let item = try NSKeyedArchiver.archivedData(withRootObject: container, requiringSecureCoding: false)
                try session.send(item, toPeers: session.connectedPeers, with: MCSessionSendDataMode.reliable)
            } catch let error {
                print(error.localizedDescription)
            }
        }
    }
    
}

extension NearbyService: MCSessionDelegate {
    func session(_ session: MCSession, peer peerID: MCPeerID, didChange state: MCSessionState) {
        switch state {
        case .connecting:
            print("connecting: \(peerID.displayName)")
        case .connected:
            print("connected: \(peerID.displayName)")
            isConnected = true
        case .notConnected:
            print("not connected: \(peerID.displayName)")
       @unknown default:
            print("Unknown state: \(state)")
        }
    }
    
    func session(_ session: MCSession, didReceive data: Data, fromPeer peerID: MCPeerID) {
        print("Did Receive Data: \(data)")
       
      

        guard let container = data.convert() as? [Any] else { return }
        guard let item = container[0] as? Data else { return }
        guard let type = container[1] as? UInt32 else { return }

        DispatchQueue.main.async {
            self.nearbyServiceDelgate?.multiPeer(didReceiveData: item, ofType: type, from: peerID)
        }
    }
    
    func session(_ session: MCSession, didReceive stream: InputStream, withName streamName: String, fromPeer peerID: MCPeerID) {
        
    }
    
    func session(_ session: MCSession, didStartReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, with progress: Progress) {
        
    }
    
    func session(_ session: MCSession, didFinishReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, at localURL: URL?, withError error: Error?) {
        
    }
    
    
}

extension NearbyService: MCNearbyServiceAdvertiserDelegate {
    func advertiser(_ advertiser: MCNearbyServiceAdvertiser, didReceiveInvitationFromPeer peerID: MCPeerID, withContext context: Data?, invitationHandler: @escaping (Bool, MCSession?) -> Void) {
        invitationHandler(true, session)
        
    }
    
    
}
extension NearbyService: MCNearbyServiceBrowserDelegate {
    func browser(_ browser: MCNearbyServiceBrowser, foundPeer peerID: MCPeerID, withDiscoveryInfo info: [String : String]?) {
        browser.invitePeer(peerID, to: session, withContext: nil, timeout: 60)
    }
    
    func browser(_ browser: MCNearbyServiceBrowser, lostPeer peerID: MCPeerID) {
        print("lost peer \(peerID.displayName)")
    }
    
    
}
extension Data {

    /// Unarchive data into an object and return as type `Any`.
    public func convert() -> Any {
        return NSKeyedUnarchiver.unarchiveObject(with: self)!
    }
  

    /// Converts an object into Data using NSKeyedArchiver
    public static func toData(object: Any) -> Data {
        return NSKeyedArchiver.archivedData(withRootObject: object)
    }

}

