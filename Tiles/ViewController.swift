//
//  ViewController.swift
//  Tiles
//
//  Created by Michael Yuzhou Fu on 3/3/21.
//

import UIKit
import AVFoundation
import MultipeerConnectivity

class ViewController: UIViewController {

    
    //var peerID: MCPeerID!
    //var session: MCSession!
    //var advertiserAssistant: MCAdvertiserAssistant!
    

    @IBOutlet weak var TilesTitle: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      //  peerID = MCPeerID(displayName: UIDevice.current.name)
        //session = MCSession(peer: peerID)
        //session.delegate = self
        
        // Do any additional setup after loading the view.
        print(myMain())
        
        
    }
    
    @IBAction func CreateButton(_ sender: Any) {
        print("Game Created")
    }
    

    @IBAction func JoinGame(_ sender: Any) {
        print("Game Joined")
    }
    
}
/*
extension ViewController: MCSessionDelegate{
    func session(_ session: MCSession, peer peerID: MCPeerID, didChange state: MCSessionState) {
        switch state {
        case .connected:
            print("connected: \(peerID.displayName)")
        case .connecting:
            print("connecting: \(peerID.displayName)")
        default:
            print("not connected: \(peerID.displayName)")
        }
    }
    
    func session(_ session: MCSession, didReceive data: Data, fromPeer peerID: MCPeerID) {
    }
    
    func session(_ session: MCSession, didReceive stream: InputStream, withName streamName: String, fromPeer peerID: MCPeerID) {
    }
    
    func session(_ session: MCSession, didStartReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, with progress: Progress) {
    }
    
    func session(_ session: MCSession, didFinishReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, at localURL: URL?, withError error: Error?) {
    }
}

extension ViewController: MCBrowserViewControllerDelegate{
    func browserViewControllerDidFinish(_ browserViewController: MCBrowserViewController) {
        dismiss(animated: true)
    }
    
    func browserViewControllerWasCancelled(_ browserViewController: MCBrowserViewController) {
        dismiss(animated: true)
    }
}
*/
