//
//  ViewController.swift
//  AnimationPractice
//
//  Created by Bongani Mepha on 2023/03/29.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var animationView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }

    @IBAction func animationButonDidTouch(_ sender: Any){
        
        UIView.animate(withDuration: 1, delay: 0.5, animations: {
            self.animationView.backgroundColor =  .systemCyan
            self.animationView.frame.size.width += 0.6
            self.animationView.frame.size.width += 0.6
        }) { _ in
            UIView.animate(withDuration: 1, delay: 0, options: .curveEaseIn) {
                self.animationView.backgroundColor =  .systemYellow
                self.animationView.frame.origin.y += 20
                
    
            }
        }
        
    }
}

