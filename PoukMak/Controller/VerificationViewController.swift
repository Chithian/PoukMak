//
//  VerificationViewController.swift
//  PoukMak
//
//  Created by Chithian on 21/2/21.
//

import UIKit
import KAPinField


class VerificationViewController: UIViewController, KAPinFieldDelegate {
    
    func pinField(_ field: KAPinField, didFinishWith code: String) {
        print("didFinishWith : \(code)")
    }

    
    @IBOutlet weak var pinField: KAPinField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        pinField.properties.delegate = self
        pinField.properties.token = "-" // Default to "•"
        pinField.properties.numberOfCharacters = 6 // Default to 4
        pinField.properties.animateFocus = true // Animate the currently focused token

        
        //Navigation Titl
        self.title = "+855 12 666 666"
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for:.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.layoutIfNeeded()
        
     //Remove Boder Navigation
        self.navigationController?.navigationBar.layoutIfNeeded()
 
    }

}
