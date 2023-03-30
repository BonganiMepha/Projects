//
//  CustomTableViewCell.swift
//  SipOnSomeCocktail
//
//  Created by Bongani Mepha on 2023/03/28.
//

import Foundation
import UIKit

protocol isChecked{
    func toggleIsComplete(for cell: UITableViewCell)
}

class CustomTableViewCell: UITableViewCell {
    
    var isCompleteDelegate: isChecked?
    
    @IBOutlet weak var isFavourite: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCell(isMarked: Bool){
        if isMarked {
            
            isFavourite.setImage(UIImage(systemName: "checkmark.circle"), for: .normal)
            
        }else {
            
            isFavourite.setImage(UIImage(systemName: "circle"), for: .normal)
        }
    }
    @IBAction func isFavouriteChecked(_ sender: Any){
        
        isCompleteDelegate?.toggleIsComplete(for: self)
        
        
    }
}
