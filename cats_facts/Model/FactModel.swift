//
//  FactModel.swift
//  cats_facts
//
//  Created by Angelina on 1/16/19.
//  Copyright © 2019 Angelina Friz. All rights reserved.
//

import Foundation

class Fact {

    var text = ""
    var firstName = ""
    var lastName = ""


    init(factDict: Dictionary<String, AnyObject>) {

        if let text = factDict["text"] as? String {
            self.text = text
        }

        if let userData = factDict["user"] as? Dictionary<String, AnyObject> {

            if let name = userData["name"] as? Dictionary<String, String> {
                self.firstName = name["first"] ?? ""
                self.lastName = name["last"] ?? ""
            }
        }
    }
}
