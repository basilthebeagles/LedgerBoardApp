//
//  PostViewModel.swift
//  LedgerBoardApp
//
//  Created by JohnJoe Stack on 21/08/2017.
//  Copyright © 2017 FStack. All rights reserved.
//

import Foundation
import UIKit
import Just
import SwiftyJSON


class PostViewModel{
    
    
    
    var postObject: postDataObject?
    
    var loadingViewController: UIViewController
    
    
    
    init(postHash: String, loadingViewController: UIViewController){
        postObject = nil
        self.loadingViewController = loadingViewController
        mainLogic(postHash: postHash)
        

    }
    
    
     func getStatus() -> String{
        return ""
    }
    
    
    private func mainLogic(postHash: String){
        let queue = DispatchQueue(label: "createPostObject")
        
        
        queue.async {
            var feedback = self.getJson(postHash: postHash)
            
            if feedback[0] as! String != ""{
                queue.suspend()
            }
            
            
            
            DispatchQueue.main.async {
                // update prog bar
                
            }
            
            var JSONData = feedback[1] as! JSON
            
            self.postObject = postDataObject(postHash: postHash, postBroadcaster: JSONData["publicKey"] as! String, postTime: JSONData["timeStamp"] as! Int, postBlockIndex: JSONData["blockIndex"] as! Int, postContent: JSONData["content"] as! String, postSignature: JSONData["signature"] as! String, currentHeight: JSONData["currentHeight"] as! Int)
            
        }
        

        
    }
    
    
    
    private func getJson(postHash: String) -> [Any] {
        let params = ["attribute": "Post", "attributeParameter": postHash]
        
        var data = Just.post("myip", data: params).content
        
        
        
        do{
        let json = try JSON(data: data!)
        return ["", json]
        }catch{
            print("error")
        }
        
        return ["error", ""]
    }
    
    
    
    
}


