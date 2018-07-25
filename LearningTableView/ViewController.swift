//
//  ViewController.swift
//  LearningTableView
//
//  Created by Hiếu Nguyễn on 7/12/18.
//  Copyright © 2018 Hiếu Nguyễn. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var nodataLabel: UIView!
    @IBOutlet weak var footerView: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    var names: [String] = ["Hieu", "Nam", "Tung"]
    
    var hasNodata: Bool = true {
        didSet {
            nodataLabel.frame = tableView.bounds
            tableView.isScrollEnabled = hasNodata
            tableView.tableFooterView = hasNodata ? footerView : nodataLabel
            
//            if hasNodata {
//                tableView.tableFooterView = nodataLabel
//            } else {
//                tableView.tableFooterView = footfeerView
//            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = names[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete {
            names.remove(at: indexPath.row)
            hasNodata = names.count > 0
            tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.automatic)
        }
    }

    @IBAction func addNewName(_ sender: UIBarButtonItem) {
        let indexPathForInsert = IndexPath(row: names.count, section: 0)
        names.append("\(indexPathForInsert.row) : \(indexPathForInsert.section)")
        hasNodata = names.count > 0
        tableView.insertRows(at: [indexPathForInsert], with: .fade)
    }
    
}

