//
//  ViewController.swift
//  PoukMak
//
//  Created by Chithian on 21/2/21.
//

import UIKit


class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var viewContainer: UIView!
    @IBOutlet weak var countryCode: UIStackView!
    @IBOutlet weak var continueButton: UIButton!
    @IBOutlet weak var phoneNum: UITextField!
    @IBOutlet weak var phoneNumView: UIView!
    
    
    var phoneNumber: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        phoneNumView.layer.cornerRadius = 10.00
        phoneNumView.layer.borderWidth = 0.5
        phoneNumView.layer.borderColor = UIColor.lightGray.cgColor
        
        phoneNum.delegate = self
        countryCode.layer.cornerRadius = 10
        continueButton.layer.cornerRadius = 20
        
        // call the 'keyboardWillShow' function when the view controlelr receive notification that keyboard is going to be shown
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
             // call the 'keyboardWillHide' function when the view controlelr receive notification that keyboard is going to be hidden
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    
    @objc func keyboardWillShow(notification: Notification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            continueButton.layer.cornerRadius = 0
            continueButton.backgroundColor = UIColor.orange

            let constraints = viewContainer.constraints
            
            for constraint in constraints {
                if constraint.identifier == "ContinueBottomConstraint" {
                    constraint.constant = keyboardSize.height
                } else if constraint.identifier == "ContinueLeadingConstraint" || constraint.identifier == "ContinueTrailingConstraint" {
                    constraint.constant = 0
                } else if constraint.identifier == "LogoTopConstraint" {
                    constraint.constant = -10
                }
            }
        }
    }

    @objc func keyboardWillHide(notification: Notification) {

        continueButton.layer.cornerRadius = 20
        continueButton.backgroundColor = UIColor.gray

        let constraints = viewContainer.constraints
        for constrain in constraints {
            if constrain.identifier == "ContinueBottomConstraint" {
                constrain.constant = 50
            } else if constrain.identifier == "ContinueLeadingConstraint" || constrain.identifier == "ContinueTrailingConstraint" {
                constrain.constant = 30
            } else if constrain.identifier == "LogoTopConstraint" {
                constrain.constant = 40
            }
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
        if phoneNum.text!.isEmpty  {
            print("Error Missing")
        }else {
            
            performSegue(withIdentifier: "GoToVerification", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        _ = segue.destination as! VerificationViewController
        
    }
    
    // Navigation(remove Back keep only the icon )
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
