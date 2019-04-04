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

    var text : String = ""
    @IBOutlet weak var logout: UIButton!
    @IBOutlet weak var firstNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        firstNameLabel?.text = text
        
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
