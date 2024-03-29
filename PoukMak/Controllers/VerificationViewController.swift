//
//  VerificationViewController.swift
//  PoukMak
//
//  Created by Chithian on 21/2/21.
//

import UIKit
import SVPinView


class VerificationViewController: UIViewController {
    
    @IBOutlet weak var pinView: SVPinView!
    @IBOutlet weak var pinViewView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()

        //Change KeyboardType
        pinView.keyboardType = .numberPad

        //Navigation Title
        self.title = "+855 12 666 666"
        
        //Remove Navifation bar & background
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for:.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.layoutIfNeeded()
        
        //Remove Boder Navigation
        self.navigationController?.navigationBar.layoutIfNeeded()
 
        
        pinView.didFinishCallback = { [weak self] pin in
            print("The Pin Code is \(pin)")
        }

    }
    override func viewWillAppear(_ animated: Bool) {
        pinViewView.layer.cornerRadius = 10
    }
    
   
    
    
}
