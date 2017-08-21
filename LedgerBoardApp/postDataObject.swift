//
//  postDataObject.swift
//  LedgerBoardApp
//
//  Created by JohnJoe Stack on 21/08/2017.
//  Copyright © 2017 FStack. All rights reserved.
//

import Foundation

class postDataObject{
    
    let postHash: String
    
    let postBroadcaster: String
    
    let postTime: Int
    
    let postConfirmations: Int
    
    let postBlockIndex: Int
    
    let postContent: String
    
    
    let postSignature: String
    
    var verified: Bool
    
    var error: String
    

    
    
    init(postHash: String, postBroadcaster: String, postTime: Int, postBlockIndex: Int, postContent: String, postSignature: String, currentHeight: Int){
        
        self.postHash = postHash
        self.postBroadcaster = postBroadcaster

        self.postTime = postTime

        self.postBlockIndex = postBlockIndex
        
        self.postContent = postContent
        
        self.postSignature = postSignature
        
        self.postConfirmations = (currentHeight - postBlockIndex) + 1
        self.verified = false
        self.error = ""
        verifyPost()
        
        
        
        
        
    }
    
    
    
    
    private func verifyPost(){
        
        var totalPostContent: String = postBroadcaster + String(postTime) + postContent
        
        var selfCalculatedPostHash = totalPostContent.get_sha256_String()
        
        if selfCalculatedPostHash != postHash{
            self.error = "Posthash does not match recieved data."
            self.verified = false
            return
        }
        
        self.verified = true
        //verify signature
        
        
        return
        
        
        
    }
    
    
        
}

    
