//
//  Alerts.swift
//  IPTV
//
//  Created by Freeman Zak on 10/09/2018.
//  Copyright © 2018 Freeman Zak. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

class Alerts {
    func createAlert(alertTitle: String, alertMessage: String, alertName: String) -> UIAlertController {
        let alert = UIAlertController(title: alertTitle,
                                      message: alertMessage,
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"),
                                      style: .default,
                                      handler: {_ in NSLog("The \"\(alertName)\" alert occured")}))
        return alert
    }
    
    public func displayInvalidResponseAlert(response: DataResponse<String>) -> UIAlertController {
        let invalidResponseAlert = createAlert(alertTitle: "Bad request",
                                               alertMessage: """
                                                                Check the URL and try again.
                                                                Status code: \(String(describing: response.response!.statusCode))
                                                             """,
                                               alertName: "Invalid Response")
        return invalidResponseAlert
    }
    
    public func displayEmptyUrlAlert() -> UIAlertController {
        return createAlert(alertTitle: "No URL entered", alertMessage: "You must enter an XMLTV URL", alertName: "No URL Entered")
    }
    
    public func displayInvalidUrlAlert(response: DataResponse<String>) -> UIAlertController {
        return createAlert(alertTitle: "Invalid URL", alertMessage: "Invalid URL entered.", alertName: "Invalid URL")
    }
    
}
