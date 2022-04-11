//
//  ViewController.swift
//  MultiPeer_Sample
//
//  Created by Wilson Ding on 3/20/18.
//  Copyright © 2018 Wilson Ding. All rights reserved.
//

import UIKit
import SwiftUI


enum DataType: UInt32 {
    case message = 1
    case image = 2
}

final class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    
    // Image Picker
    let imagePicker = UIImagePickerController()
    
    // Dismiss keyboard on tap
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.delegate = self
        imagePicker.delegate = self

        MultiPeer.instance.delegate = self

        MultiPeer.instance.initialize(serviceType: "sample-app")
        MultiPeer.instance.autoConnect()
    }

    override func viewWillDisappear(_ animated: Bool) {
        MultiPeer.instance.disconnect()

        super.viewWillDisappear(animated)
    }

    @IBAction func didPressLoadButton(_ sender: Any) {
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        
        present(imagePicker, animated: true, completion: nil)
    }

    @IBAction func didPressSendButton(_ sender: Any) {
        // Advertising/Browsing while sending data in MultiPeerConnectivity causes disconnects
        // see here: https://stackoverflow.com/questions/22720247/multipeer-connectivity-random-disconnects
        // Device will stop advertising/browsing until after MultiPeer has sent data
        MultiPeer.instance.stopSearching()
        
        defer {
            MultiPeer.instance.autoConnect()
        }
        
        if let message = textField.text {
            MultiPeer.instance.send(object: message, type: DataType.message.rawValue)
        }
        
        if let image = imageView.image {
            guard let imageData = image.pngData() else { return }
            
            MultiPeer.instance.send(object: imageData, type: DataType.image.rawValue)
        }
    }

}

extension ViewController: MultiPeerDelegate {
    
    func multiPeer(didReceiveData data: Data, ofType type: UInt32, from peerID: MCPeerID) {
        switch type {
           case DataType.message.rawValue:
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
    
    
    

   

    func multiPeer(connectedDevicesChanged devices: [String]) {
        print("Connected devices changed: \(devices)")
    }
}

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
// Local variable inserted by Swift 4.2 migrator.
let info = convertFromUIImagePickerControllerInfoKeyDictionary(info)

        
        if let pickedImage = info[convertFromUIImagePickerControllerInfoKey(UIImagePickerController.InfoKey.originalImage)] as? UIImage {
            imageView.image = pickedImage
        }
        
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertFromUIImagePickerControllerInfoKeyDictionary(_ input: [UIImagePickerController.InfoKey: Any]) -> [String: Any] {
	return Dictionary(uniqueKeysWithValues: input.map {key, value in (key.rawValue, value)})
}

// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertFromUIImagePickerControllerInfoKey(_ input: UIImagePickerController.InfoKey) -> String {
	return input.rawValue
}

extension ViewController: UIViewControllerRepresentable{
   public typealias UIViewControllerType = ViewController
   public func makeUIViewController(context: Context) -> ViewController {
        return ViewController()
    }
    public func updateUIViewController(_ uiViewController: ViewController, context: Context) {
        
    }
    
}
