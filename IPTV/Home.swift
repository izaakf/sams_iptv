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
        Requestors().makeXmlRequest(xmltvUrl: xmltvUrl.text!)
        Requestors().makeEpgRequest(epgUrl: epgUrl.text!)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
