//
//  PostViewModel.swift
//  LedgerBoardApp
//
//  Created by JohnJoe Stack on 21/08/2017.
//  Copyright © 2017 FStack. All rights reserved.
//

import Foundation
import UIKit
import SwiftHTTP

class PostViewModel{
    
    let postHash: String
    
    let postBroadcaster: String
    
    let postTime: String
    
    let postConfirmations: String
    
    let postBlockIndex: String
    
    
    init(postHash: String, loadingViewController: UIViewController){
        
        self.postHash = postHash
        getData()
        
    }
    
    
     func getStatus() -> String{
        return ""
    }
    
    
    private func getData(){
        let params = ["attribute": "Post", "attributeParameter": self.postHash]
        
        do {
            let opt = try HTTP.POST("http://ledgerboard.f-stack.com:4848", parameters: params) //make the domain not hardcoded
            opt.start { response in
                //do things...
                print(response.text ?? "No data recieved")
                
                
            }
        } catch let error {
            print("got an error creating the request: \(error)")
        }
    
    }
}


