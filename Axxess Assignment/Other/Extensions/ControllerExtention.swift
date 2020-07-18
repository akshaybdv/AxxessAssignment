//
//  ControllerExtention.swift
//  Axxess Assignment
//
//  Created by Badve, Akshay on 7/18/20.
//  Copyright © 2020 Badve, Akshay. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {

  func showAlert(withTitle title: String, message : String) {
    let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
    let OKAction = UIAlertAction(title: Constants.Alerts.okay, style: .default) { action in
    }
    alertController.addAction(OKAction)
    self.present(alertController, animated: true, completion: nil)
  }
}
