//
//  Student.swift
//  exmaple
//
//  Created by Edward on 7/13/16.
//  Copyright © 2016 Edward. All rights reserved.
//

import Foundation
import Firebase

class Student {
    
    
    private var _studentRef: FIRDatabaseReference!
    
    private var _studentKey: String!
    private var _studentDescription: String!
//    private var _studentVotes: Int!
//    private var _username: String!
    
    var studentKey: String {
        return _studentKey
    }
    
    var studentDescription: String {
        return _studentDescription
    }
    
//    var studentVotes: Int {
//        return _studentVotes
//    }
    
//    var username: String {
//        return _username
//    }
    
    // Initialize the new Joke
    init(description: String, username: String) {
        self._studentDescription = description
//        self._username = username
    }
    
    init(key: String, dictionary: Dictionary<String, AnyObject>) {
        self._studentKey = key
        
        // Within the Joke, or Key, the following properties are children
        
//        if let votes = dictionary["votes"] as? Int {
//            self._jokeVotes = votes
//        }
        
        if let desc = dictionary["description"] as? String {
            self._studentDescription = desc
        }
        
//        if let user = dictionary["author"] as? String {
//            self._username = user
//        } else {
//            self._username = ""
//        }
        
        // The above properties are assigned to their key.
        
        self._studentRef = DataService.dataService.STUT_REF.childByAppendingPath(self._studentKey)
    }
    
    func addSubtractVote(addVote: Bool) {
        
 //       let uid = FIRAuth.auth()?.currentUser?.uid
        if addVote{            
 /*           let desc = FIRDatabase.database().reference().child("users").child(uid!).child("desc").childByAutoId()
            desc.setValue(_studentDescription)*/
            DataService.dataService.STUT_REF.childByAppendingPath(self._studentKey).removeValue()
           
        }else{
            
            DataService.dataService.CURRENT_USER_REF.child("student").childByAppendingPath(self._studentKey).removeValue()
        }
        
 
        
        
    }
}