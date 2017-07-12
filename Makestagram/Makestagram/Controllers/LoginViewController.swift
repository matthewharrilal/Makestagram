//
//  LoginViewController.swift
//  Makestagram
//
//  Created by Matthew on 7/10/17.
//  Copyright © 2017 Matthew Harrilal. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseAuthUI
import FirebaseDatabase

typealias FIRUser = FirebaseAuth.User
//When Lena goes over steps ask her questions about alias' or not even aliases ask a question such as why would we originally make a user optional instead of makinga firebase auth user optional because arent all our user passwords and usernames saving to firebases backed server

class LoginViewController: UIViewController {
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        print ("Login Button Tapped")
        guard let authUI = FUIAuth.defaultAuthUI()
            else { return}
        
        authUI.delegate = self
        // you still have to go over what this line of code does and what exactly the functionality does
        
        let authViewController = authUI.authViewController()
        present(authViewController, animated: true)
        
        
    }
    
    //    if let user = Auth.auth().currentUser() {
    //        let rootRef = Database.database().reference()
    //        let userRef = rootRef.child("users").child(user.uid)
    //  So the following lines ofcode go from a general to a more specific order and this starts with the first line of code. Essentially what the first line of code does is that we are unwrapping the let constant user to see if its nil or not and if it is nil it essentially means that the user is not logged in and if it is not nil or there is data that means the user is logged in
    // Now the second line of code only gets executed if the first line of code gets executed if the first line of code gets run and in the second line we declare a let constant create a userRef and this creates a database reference to the genreal location to where our user's credentials are stored and again this just brings us to the general location of the users credentials and since the order of this code goes from general to more specific and the third line of code basically uses that reference we made in the previous line of code and assigns it to a new let constant called userRef anf pinpoint in te database that we previously made a reference to and find the users identification and we do all this when we want to create a reference or set a relative location or path in our fire base serves or even back end servers
    
    
    // And on a side note we can tell by the let constant names what each one tracks to for example the let constant root ref tracks us to the roots of the data base where the user credentials are located but still not very accurate and since we are looking for the user that is logged in and we know the user is logged in beccauase the code wouldnt be run if the user was nil or when translated to the functionality of our application when the user is not logged in , but basically if the user wasnt logged in the other two lines of code wouldnt be executed, then the third line of code declares a let constant called userRef and this makes sense that it would be called that because since our code goes in the order from general to more specific we have finally got the general location in our firebase database where our user credentials are stored and not that we have arrived at our final line of code where we can now pinpoint the logged in user's exact credentials
    
}

// When user is nil does that mean that the user is creating a new account or their is no one is logged in with those user credentials ? It can even be both the other one being that the user is creating a new account ask Lena about this
// Singletons or static structures are not always a good thing because they can be a sign of bad code architecture, think about it becuase if everyhting is static then that just shows tight coupling and hard to follow code

extension LoginViewController: FUIAuthDelegate
{
    /** @fn authUI:didSignInWithUser:error:
     @brief Message sent after the sign in process has completed to report the signed in user or
     error encountered.
     @param authUI The @c FUIAuth instance sending the message.
     @param user The signed in user if the sign in attempt was successful.
     @param error The error that occurred during sign in, if any.
     */
    
    func authUI(_ authUI: FUIAuth, didSignInWith user: FIRUser?, error: Error?){
        // This is required when conforming to the delegate protocols
        //  lets say you have a class and you want to inherit from more than one superclass and since you can not inherit from more than one superclass you can add more functionality by creating an extension,the only drawback to extensions is that you can not override functions while using extensions, now to the second part of this is what is happening with the parameters, so we can tell the first argument label is null but I do not see the point of having it null and it is a type of FUIAuth and if we option click it we can see that it is a class function that it is static therefore it can not be overwritten which makes sense beacause why would we want to overwrite our protocols, now the second parameter which happens to be didSignInWithUser and that is of type user and since it is optional if it is nil meaning it has no data or value that can translate to a user making a new account and if there is data that translates to the user logging in to their account, and lastly the last parameter is error and it is of optional type error and what that translates to in our application is that if it has data and it still an error which it is it is going to be probably a wrong username attempt and if it is nil that means that the user is probably creating a new account but used a email that is already associated with an account
        
        if let error = error {
            assertionFailure("Error signing in: \(error.localizedDescription)")
            return
            
        }
        
        guard let user = user
            else {return}
        let userRef = Database.database().reference().child("users").child(user.uid)
        
        userRef.observeSingleEvent(of: .value, with: {
            (snapshot) in
            if let user = User(snapshot:snapshot) {
                print ("Welcome back, \(user.username).")
            } else {
                self.performSegue(withIdentifier: "CreateUsername", sender: self)// Why did we need to do this programmatically ?
                print("New user!")
                
            } // So now that we have refactored our code we now have to talk about it as per usual therefore lets start with the first line of code and that first line of cod eis our user reference with the dot operator and after that dot operator we see we trying to contain that pinpoint data within the database by taking a snapshot as well so we can type cast it to the data type we want to retrieve that specified data after this we then want to safely unwrap the let constant user  to see if the data we contained through the snapshot is nil or not and to do that of course we would use a if let statement and once we do that we set it equal to a class User instantce that is desginated to retrie
            
            
            
            
            print("handle user signup/ login")
            
        })
    }
        
}
// now when we use the observe single event use we would most probably use it when we are the exact pinpoint location that we wanted to end up at and this basically reads the data at that location, so basically they coincide together and we need both of them to get that pinpoint location and the observe code to read the data of what is going on in there, and we use the observe single event for a specific reason, this sepcific reason being that usually we only use observe single events when we have code that only needs to be loaded once and isnt expected to change so when we implement that in our application and when we our checking our user's credentials we only want to load it once and we arent expecting them to change their credentials since theyhave no notice of us viewing their credentials




