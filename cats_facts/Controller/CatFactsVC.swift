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

    let defaults = UserDefaults.standard
    var factData = [Fact]()


    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Cats Facts"
        

        let cellNib = UINib(nibName: "TableViewCell", bundle: nil)
        self.tableView.register(cellNib, forCellReuseIdentifier: "cell")
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.estimatedRowHeight = 150

        fetchUserData()
    }


    @IBAction func logOutBtnPressed(_ sender: Any) {
        defaults.set(false, forKey: "userLoggedIn")
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = mainStoryboard.instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
        UIApplication.shared.keyWindow?.rootViewController = viewController
        
    }

    func fetchUserData() {

        Alamofire.request("https://cat-fact.herokuapp.com/facts").responseJSON { (response) in
            let result = response.result

            if let dict = result.value as? Dictionary<String,AnyObject> {

                if let facts = dict["all"] as? [Dictionary<String,AnyObject>] {

                    for fact in facts {

                        let fact = Fact(factDict: fact)
                        self.factData.append(fact)
                    }
                    self.tableView.reloadData()
                }
            }
        }
    }

}

extension CatFactsVC {


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return factData.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
        cell.textLbl.text = factData[indexPath.row].text
        cell.firstNameLbl.text = factData[indexPath.row].firstName
        cell.lastNameLbl.text = factData[indexPath.row].lastName
        return cell
    }
}






