//
//  Regex.swift
//  IPTV
//
//  Created by Freeman Zak on 05/10/2018.
//  Copyright © 2018 Freeman Zak. All rights reserved.
//

import Foundation
import Regex

class M3u {
    public func m3uParser(m3uData: String) -> [String: String] {
        let pattern =   "\\#EXTINF.*tvg-name=\"([^\"]*)\".*tvg-id=\"([^\"]*)\".*tvg-logo=\"([^\"]*)\".*group-title=\"([^\"]*)\".*(http://[^\\s]+)"
        let regex = try? Regex(pattern: pattern,
                               groupNames:"name", "id", "logo", "group", "url")
        
        var dict: [String: String] = [:]
        let match = regex?.findFirst(in: m3uData)
        if let match = match {
            dict["name"]    = match.group(named: "match")
            dict["id"]      = match.group(named: "id")
            dict["logo"]    = match.group(named: "logo")
            dict["group"]   = match.group(named: "group")
            dict["url"]     = match.group(named: "url")
        }
        return dict
    }
}
