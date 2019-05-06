//
//  ThirdTabViewController.swift
//  Braveio
//
//  Created by Nicole Martindale on 3/26/19.
//  Copyright © 2019 Koderz. All rights reserved.
//

import UIKit
import FirebaseStorage
import Firebase

class ThirdTabViewController: UIViewController,
    UIImagePickerControllerDelegate,
UINavigationControllerDelegate {

    @IBOutlet weak var imagePicked: UIImageView!
    // Firebase services
    var database: Database!
    var storage: Storage!

    // Initialize an array for your pictures
    var picArray = [UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
   
    var imagePickerController : UIImagePickerController!
    @IBAction func openCameraButton(sender: AnyObject) {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            imagePickerController.delegate = self
            imagePickerController.sourceType = .camera;
            imagePickerController.allowsEditing = false
            self.present(imagePickerController, animated: true, completion: nil)
        }
    }
   
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image = info[UIImagePickerControllerOriginalImage] as? UIImage
        dismiss(animated:true, completion: nil)
        imagePicked.image = image
        
        /*
        let uid = Auth.auth().currentUser?.uid
        if let uid = uid {
            let imageData = UIImageJPEGRepresentation(image!, 0.5)
            if let imageData = imageData {
                let profileImgReference = Storage.storage().reference().child("profile_image_urls").child("\(uid).png")
                let uploadTask = profileImgReference.putData(imageData, metadata: nil) { (metadata, error) in
                    if let error = error {
                        print(error.localizedDescription)
                    } else {
                        let downloadURL = metadata?.downloadURL()?.absoluteString ?? ""
                        // Here you get the download url of the profile picture.
                    }
                }
                uploadTask.observe(.progress, handler: { (snapshot) in
                    print(snapshot.progress?.fractionCompleted ?? "")
                    // Here you can get the progress of the upload process.
                })
            } else {return}
        } else {return}
    }
         */
        /*
        // Initialize Database, Auth, Storage
        let database = Database.database()
        let storage = Storage.storage()
        
        let fileData = NSData() // get data...
        let uid = Auth.auth().currentUser?.uid
        let storageRef = storage.reference().child("users").child("\(uid).png")
        storageRef.putData(fileData as Data).observe(.success) { (snapshot) in
            // When the image has successfully uploaded, we get it's download URL
            let downloadURL = snapshot.metadata?.downloadURL()?.absoluteString
            // Write the download URL to the Realtime Database
            let dbRef = database.reference().child("users").child("\(uid).png")
            dbRef.setValue(downloadURL)
        }
 */
    }
 
    func saveImage(imageName: String){
        
        //create an instance of the FileManager
        let fileManager = FileManager.default
        //get the image path
        let imagePath = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent(imageName)
        //get the image we took with camera
        let image = imagePicked.image!
        //get the PNG data for this image
        let data = UIImagePNGRepresentation(image)
        //store it in the document directory
        fileManager.createFile(atPath: imagePath as String, contents: data, attributes: nil)

        
    }
    
    @IBAction func openPhotoLibraryButton(sender: AnyObject) {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary;
            imagePicker.allowsEditing = true
            self.present(imagePicker, animated: true, completion: nil)
        }
    }

    @IBAction func saveButton(_ sender: Any) {
        saveImage(imageName: "YourPiece.png")
        performSegue(withIdentifier: "describePiece", sender: self)
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
