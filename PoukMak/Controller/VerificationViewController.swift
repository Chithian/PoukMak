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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Navigation Titl
        self.title = "+855 12 666 666"

        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for:.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.layoutIfNeeded()
        
     //Remove Boder Navigation
        self.navigationController?.navigationBar.layoutIfNeeded()
 
    }
    
}
