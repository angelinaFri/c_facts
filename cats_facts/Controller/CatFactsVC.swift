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

    var usersData: [UserModel] = []


    override func viewDidLoad() {
        super.viewDidLoad()


        let cellNib = UINib(nibName: "TableViewCell", bundle: nil)
        self.tableView.register(cellNib, forCellReuseIdentifier: "cell")
//        self.tableView.estimatedRowHeight = 100.0
//        self.tableView.rowHeight = UITableView.automaticDimension

        fetchUserData()
    }

    func fetchUserData() {
        DispatchQueue.main.async {
            Alamofire.request("https://cat-fact.herokuapp.com/facts").responseJSON(completionHandler: { (response) in
                switch response.result {
                case .success(let value):
                    let json = JSON(value)
                    print(json)
//                    let data = json["all"]
//                    data["_id"].array?.forEach({(id) in
//                        let id = UserModel(firstName: id["first"].stringValue, lastName: id["last"].stringValue, text: id["text"].stringValue )
//                        self.usersData.append(id)
//                    })
//                    self.tableView.reloadData()
                case .failure(let error):
                    print(error.localizedDescription)
                }
        })
    }
}
    

//        func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return self.usersData.count
     return 2
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
//        cell.firstNameLbl.text = self.usersData[indexPath.row].firstName
//        cell.lastNameLbl.text = self.usersData[indexPath.row].lastName
//        cell.textLbl.text = self.usersData[indexPath.row].text
        return cell
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 155.0
    }
    
}






