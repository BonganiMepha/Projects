//
//  ViewController.swift
//  ReuseableComponent
//
//  Created by Bongani Mepha on 2022/09/26.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var reuseableButtonContainer: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    override func viewWillAppear(_ animated: Bool) {
        addReuseableButton()
    }
    private func addReuseableButton(){
        let bundle = Bundle.main
        guard let view = bundle.loadNibNamed("reuseableButton", owner: self, options: nil)?.first as? reuseableButton
        else{ return }
        reuseableButtonContainer.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo:  reuseableButtonContainer.topAnchor),
            view.leadingAnchor.constraint(equalTo: reuseableButtonContainer.leadingAnchor),
            view.trailingAnchor.constraint(equalTo:  reuseableButtonContainer.trailingAnchor),
            view.bottomAnchor.constraint(equalTo:  reuseableButtonContainer.bottomAnchor)
            ])
    }
    
    
}

