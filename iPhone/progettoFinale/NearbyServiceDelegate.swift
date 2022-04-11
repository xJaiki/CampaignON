//
//  NearbyServiceDelegate.swift
//  progettoFinale
//
//  Created by Alessandro Volpe on 06/02/21.
//

import Foundation
import MultipeerConnectivity

public typealias MCPeerID = MultipeerConnectivity.MCPeerID
protocol NearbyServiceDelegate {
    func multiPeer(didReceiveData data: Data, ofType type: UInt32, from peerID: MCPeerID)
}
