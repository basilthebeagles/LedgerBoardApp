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
            if content.characters.count == 64{
                performSegue(withIdentifier: "searchToPost", sender: content)
            

            }else if content.characters.count == 128{
                performSegue(withIdentifier: "searchToBroadcasterPost", sender: content)
            }else{
                performSegue(withIdentifier: "searchToBlock", sender: content)
            }
            
            
            view.endEditing(true)
            
            
        }
        
        view.endEditing(true)

        
        
        
        
        
        
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar){
        
        searchBar.text = ""
        view.endEditing(true)
    }
    
    
    
    
    


}

