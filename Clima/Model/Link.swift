//
//  Link.swift
//  Clima
//
//  Created by Daniil Yarovyi on 6/26/21.
//  Copyright © 2021 dyarovyi. All rights reserved.
//

import Foundation


class Link {
    
    func getLink() -> String {
        
        let file = "key.txt"
        var text: String = ""

        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {

            let fileURL = dir.appendingPathComponent(file)

            do {
                text = try String(contentsOf: fileURL, encoding: .utf8)
            }
            catch {
                
            }
        }
        
        return text
    }
}
