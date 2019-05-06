//
//  FifthTabViewController.swift
//  Braveio
//
//  Created by Nicole Martindale on 3/26/19.
//  Copyright © 2019 Koderz. All rights reserved.
//

import UIKit
import Firebase

class FifthTabViewController: UIViewController {

   // var text : String = ""
    @IBOutlet weak var logout: UIButton!
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet var lastNameLabel: UILabel!
    @IBOutlet var ageLabel: UILabel!
    @IBOutlet var gradeLabel: UILabel!
    @IBOutlet var cityLabel: UILabel!
    @IBOutlet var stateLabel: UILabel!
    @IBOutlet var zipcodeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        var ref: DatabaseReference!
        
        ref = Database.database().reference()
        

       // let ref = Database.database().reference()
        let userID = Auth.auth().currentUser?.uid
        let usersRef = ref.child("posts").child(userID!).observeSingleEvent(of: .value, with: { (snapshot) in
            
            if !snapshot.exists() { return }
            
   //         print(snapshot) // Its print all values including Snap (User)
            
    //        print(snapshot.value!)
            
            let firstName = snapshot.childSnapshot(forPath: "firstName").value
            let lastName = snapshot.childSnapshot(forPath: "lastName").value
            let age = snapshot.childSnapshot(forPath: "age").value
            let grade = snapshot.childSnapshot(forPath: "grade").value
            let city = snapshot.childSnapshot(forPath: "city").value
            let state = snapshot.childSnapshot(forPath: "state").value
             let zipcode = snapshot.childSnapshot(forPath: "zipcode").value
         //   print(firstName!)
            self.firstNameLabel.text = firstName as? String
            self.lastNameLabel.text = lastName as? String
            self.ageLabel.text = age as? String
            self.gradeLabel.text = grade as? String
            self.cityLabel.text = city as? String
            self.stateLabel.text = state as? String
            self.zipcodeLabel.text = zipcode as? String

            
        })
           // print(snapshot)
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func logOutAction(sender: AnyObject) {
        if Auth.auth().currentUser != nil {
            do {
                try Auth.auth().signOut()
                self.performSegue(withIdentifier: "SignUp", sender: self)
                
            } catch let error as NSError {
                print(error.localizedDescription)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
