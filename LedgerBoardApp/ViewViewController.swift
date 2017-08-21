//
//  ViewViewController.swift
//  LedgerBoardApp
//
//  Created by JohnJoe Stack on 19/07/2017.
//  Copyright © 2017 FStack. All rights reserved.
//

import UIKit

class ViewViewController: UIViewController, UISearchBarDelegate {

    
    @IBOutlet weak var searchBar: UISearchBar!
    
    var searchContent: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        searchBar.delegate = self
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar){
        
        if let content = searchBar.text{
            searchContent = content

            if content.characters.count == 64{
                performSegue(withIdentifier: "searchToPost", sender: self)
            

            }else if content.characters.count == 128{
                performSegue(withIdentifier: "searchToBroadcasterPost", sender: self)
            }else{
                performSegue(withIdentifier: "searchToBlock", sender: self)
            }
            
            
            view.endEditing(true)
            
            
        }
        
        view.endEditing(true)

        
        
        
        
        
        
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar){
        
        searchBar.text = ""
        view.endEditing(true)
    }
    
    
    
     func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        

        
        if segue.identifier! == "searchToPost"{
            let destinationView = segue.destination as! PostViewController
            destinationView.postHash = searchContent!
        }
        
        
        
    }

    


}

