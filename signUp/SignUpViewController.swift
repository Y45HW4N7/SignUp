//
//  SignUpViewController.swift
//  signUp
//
//  Created by Venigalla, Sai on 17/07/19.
//  Copyright © 2019 Random Inc. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var firstNameText: UITextField!
    @IBOutlet weak var lastNameText: UITextField!
    @IBOutlet weak var phoneNoText: UITextField!
    @IBOutlet weak var emailIDText: UITextField!
    @IBOutlet weak var empIDText: UITextField!
    
    var firstName = ""
    var lastName = ""
    var phoneNo = ""
    var emailId = ""
    var empId = ""
    
    var employee: Employee?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func signUpAction(_ sender: Any) {
        
    }
    
    func fieldCheck() -> Bool {
        
        let firstName = firstNameText.text ?? ""
        let lastName = lastNameText.text ?? ""
        let phoneNo = phoneNoText.text ?? ""
        let emailId = emailIDText.text ?? ""
        let empId = empIDText.text ?? ""
        
        var fieldsContent: Bool = true
        
        if firstName.isEmpty {
            missingAlert(alertMessage: "Please fill in your First Name")
        }
        else if lastName.isEmpty{
            missingAlert(alertMessage: "Please fill in your Last Name")
        }
        else if phoneNo.isEmpty{
            missingAlert(alertMessage: "Please fill in your Phone Number")
        }
        else if emailId.isEmpty{
            missingAlert(alertMessage: "Please fill in your Email ID")
        }
        else if empId.isEmpty{
            missingAlert(alertMessage: "Please fill in your Emp ID")
        }
        else {
            fieldsContent = true
        }
        
        return fieldsContent
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        let shouldPerformSegue = self.fieldCheck()
        return shouldPerformSegue
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! DetailViewController
        vc.finalName = self.firstName
        
        super.prepare(for: segue, sender: sender)
        
        let firstName = firstNameText.text ?? ""
        let lastName = lastNameText.text ?? ""
        let phoneNo = phoneNoText.text ?? ""
        let emailId = emailIDText.text ?? ""
        let empId = empIDText.text ?? ""
        
        self.employee = Employee.init(firstName: firstName, lastName: lastName, phoneNo: phoneNo, emailId: emailId, empId: empId)
        
        if let detailVC = segue.destination as? DetailViewController {
            detailVC.employee = self.employee
        }
    }
    
    func missingAlert(alertMessage: String) {
        let alert = UIAlertController(title: "Missing Info", message: alertMessage, preferredStyle: .alert)
        let dismissAction = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default) { (_) in
            print("Dismissed")
        }
        
        alert.addAction(dismissAction)
        self.present(alert, animated: true)
    }
}
