//
//  ViewController.swift
//  signUp
//
//  Created by Venigalla, Sai on 16/07/19.
//  Copyright © 2019 Random Inc. All rights reserved.
//

import UIKit

protocol DetailViewControllerDelegate: AnyObject {
    func update(_ employee: Employee)
}

class DetailViewController: UIViewController {
    
    @IBOutlet weak var firstName: UILabel!
    @IBOutlet weak var lastName: UILabel!
    @IBOutlet weak var phoneNo: UILabel!
    @IBOutlet weak var emailId: UILabel!
    @IBOutlet weak var empId: UILabel!
    
    var finalName = ""
    
    var employee: Employee?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.showDetails()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    func showDetails() {
        firstName?.text = employee?.firstName
        lastName?.text = employee?.lastName
        phoneNo?.text = employee?.phoneNo
        emailId?.text = employee?.emailId
        empId?.text = employee?.empId
    }
    
    func textFieldShouldClear(_ textField: UITextField) {
    }
    
    @IBAction func dismissDetailView(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
