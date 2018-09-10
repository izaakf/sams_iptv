//
//  Home.swift
//  IPTV
//
//  Created by Freeman Zak on 27/08/2018.
//  Copyright © 2018 Freeman Zak. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

class Home: UIViewController {
    @IBOutlet weak var xmltvUrl: UITextField!
    @IBOutlet weak var epgUrl: UITextField!
    
    @IBAction func signIn(_ sender: UIButton) {
        makeXmlRequest(url: xmltvUrl.text!)
        makeEpgRequest(url: epgUrl.text!)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func makeEpgRequest(url: String) {
        if url.isEmpty {
            return
        }
        let response = makeRequest(url: url)
    }
    
    func makeXmlRequest(url: String) {
        if url.isEmpty {
            self.present(Alerts().displayEmptyUrlAlert(), animated: true, completion: nil)
            return
        }
        let response = makeRequest(url: url)
    }
    
    func makeRequest(url: String) -> DataRequest {
       let res =  Alamofire.request(url, method: .get).responseString {response in
            if response.response?.statusCode != 200 {
                if response.response?.statusCode == nil {
                    self.present(Alerts().displayInvalidUrlAlert(response: response), animated: true, completion: nil)
                    return
                }
                self.present(Alerts().displayInvalidResponseAlert(response: response), animated: true, completion: nil)
            }
        }
        return res
    }
}
