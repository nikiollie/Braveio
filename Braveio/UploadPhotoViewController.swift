//
//  UploadPhotoViewController.swift
//  Braveio
//
//  Created by Nicole Martindale on 4/2/19.
//  Copyright © 2019 Koderz. All rights reserved.
//

import UIKit
import Firebase

class UploadPhotoViewController: UIViewController {

    @IBOutlet var imagePicked: UIImageView!
    @IBOutlet weak var keyword: UITextField!
    @IBOutlet weak var pic_title: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        let gradient = CAGradientLayer()
        gradient.frame =  CGRect(origin: CGPoint.zero, size: keyword.frame.size)
        gradient.colors = [ UIColor.orange.cgColor, UIColor.green.cgColor]
        
        let shape = CAShapeLayer()
        shape.lineWidth = 2
        shape.path = UIBezierPath(rect: keyword.bounds).cgPath
        shape.strokeColor = UIColor.black.cgColor
        shape.fillColor = UIColor.clear.cgColor
        gradient.mask = shape
        
        keyword.layer.addSublayer(gradient)
        
        let gradient2 = CAGradientLayer()
        gradient2.frame =  CGRect(origin: CGPoint.zero, size: pic_title.frame.size)
        gradient2.colors = [UIColor.red.cgColor, UIColor.orange.cgColor, UIColor.yellow.cgColor, UIColor.green.cgColor, UIColor.blue.cgColor, UIColor.purple.cgColor]
        
        let shape2 = CAShapeLayer()
        shape2.lineWidth = 2
        shape2.path = UIBezierPath(rect: pic_title.bounds).cgPath
        shape2.strokeColor = UIColor.black.cgColor
        shape2.fillColor = UIColor.clear.cgColor
        gradient2.mask = shape2
        
        pic_title.layer.addSublayer(gradient2)
        // Do any additional setup after loading the view.
        getImage(imageName: "YourPiece.png")
        
    }
    
    
    func getImage(imageName: String){
        let fileManager = FileManager.default
        let imagePath = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent(imageName)
        if fileManager.fileExists(atPath: imagePath){
            imagePicked.image = UIImage(contentsOfFile: imagePath)
        }else{
            print("Panic! No Image!")
        }
       /*
        
        let database = Database.database().reference()
        let storage = Storage.storage()

        let uid = Auth.auth().currentUser?.uid
        
        let dbRef = database.child("users")
        // only need to fetch once so use single event
        dbRef.observeSingleEvent(of: .value, with: { snapshot in
            
            if !snapshot.exists() { return }            // Get download URL from snapshot
            let downloadURL = snapshot.value as! String
            // Create a storage reference from the URL
         //   let storageRef = storage.reference(forURL: downloadURL)
            let storageRef = storage.reference().child("users").child("\(uid).png")
            storageRef.downloadURL(completion: { (url, error) in
                if((error) != nil) {return}
                let data = try Data(contentsOf: url!)
                let image = UIImage(data: data as Data)
                self.imagePicked.image = image
            })
        })
        */
        /*
        let uid = Auth.auth().currentUser?.uid
        if let uid = uid {
            let storageRef = Storage.storage().reference().child("profile_image_urls").child("\(uid).png")
            storageRef.downloadURL { (URL, error) -> Void in
            
            //storageRef.downloadURL(completion: { (url, error) in
              //  if((error) != nil){
                  //  return
                //}
                let data = try Data(contentsOf: url!)
                let image = UIImage(data: data as Data)
                self.imagePicked.image = image
            };)
        } else {return}
 */
        
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
