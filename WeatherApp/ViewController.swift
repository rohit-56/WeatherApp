//
//  ViewController.swift
//  WeatherApp
//
//  Created by Rohit Sharma on 02/10/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var ProfilePic: UIImageView!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ProfilePic.layer.masksToBounds = true
            ProfilePic.layer.cornerRadius = ProfilePic.bounds.width / 2
        // Do any additional setup after loading the view.
    }
   
  
    @IBAction func login(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Weather", bundle: nil)
       let viewController = storyboard.instantiateViewController(withIdentifier: "WeatherViewController") as UIViewController // Explicit cast is required here.
       viewController.modalTransitionStyle = .coverVertical
       viewController.modalPresentationStyle = .fullScreen
       self.present(viewController, animated: true, completion: nil)
    }

}

