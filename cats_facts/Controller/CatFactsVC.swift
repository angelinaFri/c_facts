//
//  CatFactsVC.swift
//  cats_facts
//
//  Created by Angelina on 1/14/19.
//  Copyright © 2019 Angelina Friz. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON


class CatFactsVC: UITableViewController {

    var usersData = [AnyObject]()


    override func viewDidLoad() {
        super.viewDidLoad()


        let cellNib = UINib(nibName: "TableViewCell", bundle: nil)
        self.tableView.register(cellNib, forCellReuseIdentifier: "cell")

        fetchUserData()


    }

    func fetchUserData() {
        Alamofire.request("https://cat-fact.herokuapp.com/facts").responseJSON { (response) in
            let result = response.result
            if let dict = result.value as? Dictionary<String,AnyObject> {
                if let innerDict = dict["all"] {
                    self.usersData = innerDict as! [AnyObject]
                    self.tableView.reloadData()
                }
            }
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return usersData.count
        

    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell


        let text = usersData[indexPath.row]["text"]
        cell.textLbl.text = text as? String

        
        let firstName = usersData[indexPath.row]["user"]["name"]["first"]
        cell.firstNameLbl.text = firstName as? String


        let lastName = usersData[indexPath.row]["last"]
        cell.lastNameLbl.text = lastName as? String

        return cell
    }


}







