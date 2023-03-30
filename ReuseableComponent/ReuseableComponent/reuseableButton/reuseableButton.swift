//
//  reuseableButton.swift
//  ReuseableComponent
//
//  Created by Bongani Mepha on 2022/09/26.
//

import UIKit


class reuseableButton: UIView {
    
    var buttonPressed: Bool = false

    
    @IBOutlet weak var reuseableButtonComponent: UIButton!
    
    
   
    override func awakeFromNib() {
    
    }
    
    
    let nibName = "ReuseableButton"
 
    static func loadViewFromNib() -> reuseableButton? {
        let bundle = Bundle.main
        let view = bundle.loadNibNamed("ReuseableButton", owner: nil)?.first as? reuseableButton
        return(view)
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    
}

    
    @IBAction func reuseableUIButton(_ sender: Any) {
        buttonPressed.toggle()
    }
}
