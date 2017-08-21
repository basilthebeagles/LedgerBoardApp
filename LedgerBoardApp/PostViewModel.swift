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
    
    init(postHash: String, loadingViewController: UIViewController){
        
        self.postHash = postHash
        
        
    }
    
    
     func getStatus() -> String{
        return ""
    }
    
    
    private func getData(){
        let url = URL(string: "http://www.stackoverflow.com") //later make this users set node.
            }
    
    
}
