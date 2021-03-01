//
//  ViewController.swift
//  PoukMak
//
//  Created by Chithian on 21/2/21.
//

import UIKit


class ViewController: UIViewController, UITextFieldDelegate {

    
    @IBOutlet weak var countryCode: UIStackView!
    
    @IBOutlet weak var continueButton: UIButton!
    
    @IBOutlet weak var phoneNum: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        phoneNum.delegate = self
        countryCode.layer.cornerRadius = 10
        continueButton.layer.cornerRadius = 20
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)

    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height
            }
        }
    }

    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
  
    
    //Limit String input Phone Number MAX 12
    func textField(_ phoneNum: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // get the current text, or use an empty string if that failed
        let currentText = phoneNum.text ?? ""

        // attempt to read the range they are trying to change, or exit if we can't
        guard let stringRange = Range(range, in: currentText) else { return false }

        // add their new text to the existing text
        let updatedText = currentText.replacingCharacters(in: stringRange, with: string)

        // make sure the result is under 12 characters
        return updatedText.count <= 12
    }
    
    
 
    
    //Perform Segue to Verification Screen
    @IBAction func continueBottonPressed(_ sender: UIButton) {
        
        //continueButton.backgroundColor = UIColor.yellow
        performSegue(withIdentifier: "GoToVerification", sender: self)
    }
    
    
    // Navigation
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
      
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        navigationController?.setNavigationBarHidden(false, animated: animated)
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }

}
