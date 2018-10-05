//
//  Requestors.swift
//  IPTV
//
//  Created by Freeman Zak on 05/10/2018.
//  Copyright © 2018 Freeman Zak. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

class Requestors: UIViewController {
    public func makeEpgRequest(epgUrl: String) {
        if epgUrl.isEmpty {
            return
        }
        let response = makeRequest(url: epgUrl)
        print(response)
    }
    
    public func makeXmlRequest(xmltvUrl: String) {
        if xmltvUrl.isEmpty {
            self.present(Alerts().displayEmptyUrlAlert(), animated: true, completion: nil)
            return
        }
        let response = makeRequest(url: xmltvUrl)
        response.responseString { response in
            let responseArray = response.description.components(separatedBy: "\n\n")
            var channels: [[String: String]] = [[:]]
            for channel in responseArray {
                let trimmed = channel.replacingOccurrences(of: "\n", with: " ")
                channels.append(M3u().m3uParser(m3uData: trimmed))
            }
            print(channels)
        }
    }
    
    func makeRequest(url: String) -> DataRequest {
        let res = Alamofire.request(url, method: .get)
        res.responseString {response in
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
