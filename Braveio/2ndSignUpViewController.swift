//
//  2ndSignUpViewController.swift
//  Braveio
//
//  Created by Nicole Martindale on 3/28/19.
//  Copyright © 2019 Koderz. All rights reserved.
//

import UIKit
import FirebaseDatabase
import Firebase

class _ndSignUpViewController: UIViewController {

    @IBOutlet weak var signupButton: UIButton!
    @IBOutlet var firstName: UITextField!
    @IBOutlet var lastName: UITextField!
    @IBOutlet var age: UITextField!
    @IBOutlet var grade: UITextField!
    @IBOutlet var city: UITextField!
    @IBOutlet var state: UITextField!
    @IBOutlet var zipcode: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let gradient = CAGradientLayer()
        gradient.frame =  CGRect(origin: CGPoint.zero, size: signupButton.frame.size)
        gradient.colors = [UIColor.red.cgColor, UIColor.orange.cgColor, UIColor.yellow.cgColor, UIColor.green.cgColor, UIColor.blue.cgColor, UIColor.purple.cgColor]
        
        let shape = CAShapeLayer()
        shape.lineWidth = 2
        shape.path = UIBezierPath(rect: signupButton.bounds).cgPath
        shape.strokeColor = UIColor.black.cgColor
        shape.fillColor = UIColor.clear.cgColor
        gradient.mask = shape
        
        signupButton.layer.addSublayer(gradient)
        
        // Do any additional setup after loading the view.
    }

    @IBAction func onButtonTap()
    {
   //     let vc = FifthTabViewController(nibName: "FifthTabViewController", bundle: nil)
   //     vc.text = firstName.text!
        
        //instance of FIRDatabaseReferenc
        var ref: DatabaseReference!
        ref = Database.database().reference()
        let key = Auth.auth().currentUser!.uid
        
        //let childUpdates = ["/posts/\(key)": post,
                         //   "/users-posts/\(firstName)/\(key)/": post]
 //       let id = UUID().uuidString
 /*       ref?.child("post").child(id).setValue(post,
                            withCompletionBlock: { (error, snapshot) in
                                ref?.child("users").child(key).child("post").child(post[firstName] as! String).updateChildValues([id: post[lastName]])
*/
        let post = ["firstName": firstName.text! as NSString,
                    "lastName": lastName.text! as NSString,
                    "age": age.text! as NSString,
                    "grade": grade.text! as NSString,
                    "city": city.text! as NSString,
                    "state": state.text! as NSString,
                    "zipcode": zipcode.text! as NSString] as
                        [NSString : Any]
        let childUpdates = ["/posts/\(key)": post]
        ref.updateChildValues(childUpdates)
//        })
        
        
        //navigationController?.pushViewController(vc, animated: true)
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
