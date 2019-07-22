//
//  UIStoryboardSegueViewController.swift
//  signUp
//
//  Created by Venigalla, Sai on 19/07/19.
//  Copyright © 2019 Random Inc. All rights reserved.
//

import UIKit

extension UIStoryboardSegue {
    func forward(_ employee: Employee?, to destination: UIViewController) {
        if let navigationController = destination as? UINavigationController {
            let root = navigationController.viewControllers[0]
            forward(employee, to: root)
        }
        if let detailViewController = destination as? DetailViewController {
            detailViewController.employee = employee
        }
    }
}
