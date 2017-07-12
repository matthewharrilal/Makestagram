//
//  CreateUsernameViewController.swift
//  Makestagram
//
//  Created by Matthew on 7/12/17.
//  Copyright © 2017 Matthew Harrilal. All rights reserved.
//

import Foundation
import UIKit
import FirebaseAuth
import FirebaseDatabase
class CreateUsernameViewController: UIViewController {
    
    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBAction func nextButtonTapped(_sender:UIButton){
    
        guard let firUser = Auth.auth().currentUser,
        let username = usernameTextField.text,
        !username.isEmpty else { return }
        // So the reaason multiple errors appeared because with guard statements you can guard multiple statements but you have to use commas to seperate and differentiate between them
        // And if you have noticed the reason we dont import Firebase AuthUI and just Firebase Auth as opposed to the log in view controller is becasue you have already encountered this when you first log in you are greeted with multiple screens and that is all in part of the frameworks imported with the Firebase AuthUI
        let userAttrs = ["username": username]
        // What this line of code essentially does is that it we create a new let cosntant that is assigned the, but first that syntax looks so familiar for a reason and we know this beacuse anything in those brackets we are assigning data to a key and we witness that the let constant called username that we declared in the guard statement which is equal to the usernameTextfield.text, so basically what ever the user puts in as their username in the create username view controller is being assigned to the username key therefore when we create a relative pathway to location in the database or the reference in the database we are creating that is where we are going to be seeing all the users credentials
    }
    // This is essentially going to create the user account here, this nextButtonTapped is represented by the next button in the CreateUsernameViewController and when a new user signs up that next button is from what I believe is true to occur is that it is going to reference us or create a relative location to where this new users credentials are going to be stored
    // We are going to need certain things though to create a relative path to that users location in the fire base data, in all honesty I think their credentials would be run through the authentication servers and then their credentials will be stored in the relative pathway we are making in the fire base data base 
    
    // So what I am about to write is in reference to what we want to happen when the user clicks on the next button in their create username view controller
    // We want to check if the user has typed in text for their username and since we are creating a reference to a database where other usernames are stored if they choose a username that another user has created their uid would be the same, the uid's is actually what distinguishes the user therefore if the username is the same their uids would be the same and that would cause an error, SECONDLY THESE ARE NOT IN ANY SPECIFIC ORDER we want to create a relative pathway to where we want to store the data and then later when we create a user reference to that location we have easy accesibility, THIRDLY we want to type cast the location at where we are storing this data into type dictionary so we have a kay value pair for the username and password, and LASTLY we want to be able to diferrentiate between a success or a failure but the code is able to handle that when referencing the correct key value pairs in our database
    
    
    
    
    
    
    

}
