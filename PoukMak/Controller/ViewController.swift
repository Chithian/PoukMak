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
        // Do any additional setup after loading the view.
        
        phoneNum.delegate = self
        countryCode.layer.cornerRadius = 10
        continueButton.layer.cornerRadius = 20
        
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        
        
        view.addGestureRecognizer(tap)
        
 
    // call the 'keyboardWillShow' function when the view controller receive the notification that a keyboard is going to be shown
    NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
          
    // call the 'keyboardWillHide' function when the view controlelr receive notification that keyboard is going to be hidden
    NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    deinit {
          NotificationCenter.default.removeObserver(self)
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
    
    
    //Calls this function when the tap is recognized.
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        
        continueButton.layer.cornerRadius = 0
        continueButton.backgroundColor = UIColor.orange
        
        
        guard let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {
           // if keyboard size is not available for some reason, dont do anything
           return
        }
      
      // move the root view up by the distance of keyboard height
      self.view.frame.origin.y = 0 - keyboardSize.height
        
    }

    @objc func keyboardWillHide(notification: NSNotification) {
      // move back the root view origin to zero
        
        continueButton.layer.cornerRadius = 20
        continueButton.backgroundColor = UIColor.lightGray
      self.view.frame.origin.y = 0
    }
    
    
    //Perform Segue to Verification Screen
    @IBAction func continueBottonPressed(_ sender: UIButton) {
        
//        continueButton.backgroundColor = UIColor.yellow
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
    }
    
    


}

