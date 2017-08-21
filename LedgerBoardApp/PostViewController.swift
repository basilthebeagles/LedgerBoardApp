//
//  PostViewController.swift
//  LedgerBoardApp
//
//  Created by JohnJoe Stack on 20/08/2017.
//  Copyright © 2017 FStack. All rights reserved.
//



//remember 1 pix up above normal + bottom insert has no indentation.

import UIKit

class PostViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    @IBOutlet var tableView: UITableView!
    let cellReuseIdentifier = "cell"

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Register the table view cell class and its reuse id
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        
        // This view controller itself will provide the delegate methods and row data for the table view.
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        tableView.alwaysBounceVertical = false


    
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    // create a cell for each table view row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell

        // create a new cell if needed or reuse an old one
        
        
        // set the text from the data model
        
        
        if indexPath.row == 0{
            
            
            cell = tableView.dequeueReusableCell(withIdentifier: "hash", for: indexPath)
        }else if indexPath.row == 1{
            cell = tableView.dequeueReusableCell(withIdentifier: "broadcaster", for: indexPath)
        }else if indexPath.row == 2{
            cell = tableView.dequeueReusableCell(withIdentifier: "time", for: indexPath)

        }else if indexPath.row == 3{
            cell = tableView.dequeueReusableCell(withIdentifier: "confirmations", for: indexPath)
            
        }else if indexPath.row == 4{
            cell = tableView.dequeueReusableCell(withIdentifier: "block", for: indexPath)
            
        }else{
            
        cell = tableView.dequeueReusableCell(withIdentifier: "block", for: indexPath)
        }
        
        
        return cell
    }
    
    // method to run when table view cell is tapped
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You tapped cell number \(indexPath.row).")
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return nil
    }
    
}





//credit: https://stackoverflow.com/a/33234181
