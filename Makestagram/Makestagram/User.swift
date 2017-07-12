//
//  User.swift
//  Makestagram
//
//  Created by Matthew on 7/11/17.
//  Copyright © 2017 Matthew Harrilal. All rights reserved.
//
// So the word refactor has been coming up lately and basically what it means in terms of code is the changing of the internal structure to make it signifigantly better in addition that it does not change the physical display in the slightest
import Foundation
import FirebaseDatabase.FIRDataSnapshot
    class User {
        let uid: String
        let username: String
        
        init(uid: String, username: String) {
            self.uid = uid
            self.username = username
            
        // So at this moment in time I am not completely able to understand what all of this recently code does but Id be damned if I dont at least try to decipher it,so anyway the last two lines of code use in both lines the property self which means the user is going to be able to atleast have the action to enable that obviously from a different type of view than those of use who are developers, to further elaborate we use self.uid beacsue first of all uid is user identification and that is not to be confused with usernames the uid is set to set out a custom string to which ever database in our case the firebase database and the reason we set it equal to snapshot.key my best guess would be that we do this beacuse since the uid or the custom string is getting sent to the database in the firebase databse we would use a snapshot because since we are at our pinpointed location since they had to know where to send that uid or custom string and now thar we have the pinpoint locationwe want to contain the data and we know that a snapshot or observe single event but in this case the snapshot contains the data that we may want to view in the latter parts of the application, now I know that was alot but we have to move on to the very last line of code which I believe I understand and how I interpret that as is that we are intorduced to self again meaning the user has interaction with that even if they cant see whats happening behind the scenes in a sense and after the dot operator we have username introduced again and we set it equal to username again and the reason behind this is beacsue the main difference between the usernames before and after the equal sign is that to the left of the equal sign we as programmers are using the self property and this translates to the MakeSchool tutorials just doing this for organization as well as sanity purposes. Now I say that because we know that username represented in the app is equivocal to the username users will be identified as to other users where as to us they will be identified through their uid specialized string and so the main difference again between self.username and username is that self.username is the user inputed stirng input andwhen set equal to username of type stirng it just means that the user inputted username must be of type string
        }
        
        init?(snapshot: DataSnapshot) {
            guard let dict = snapshot.value as? [String : Any],
                let username = dict["username"] as? String
                else { return nil }
            
            self.uid = snapshot.key
            self.username = username
        }
        // So as if you havent noticed the pattern already we have to explain this code line by line first, so at the start of the code we create a new class called User and the reason we are making this class in the first place is to refactor the very prone error way of our dictionary since it is running on a string basis so is essense this class was made essentially for cleanup
        // Secondly after we declare this new class the code that comes after the curly brackets essentially we declare two let constants called uid and username and these are both of data type string and what we can infer from the giving of data types and not given any value assigned after a equal sign basically means that nothing is hard coded therefore meaning that we are going to assign a value later to these let constants as opposed to changing the values throughout the project because at the end of the day it still is a let constant but we can still assign an intial value later
}
// So the exact words of the tutorial after we initialize the class User is "next we are going to create a special initializer to take a DataSnapshot to make things easier"
