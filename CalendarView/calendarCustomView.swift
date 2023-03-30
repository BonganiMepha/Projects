//
//  calendarCustomView.swift
//  CalendarView
//
//  Created by Bongani Mepha on 2022/09/29.
//

import UIKit

class calendarCustomView: UIView {
    
    @IBOutlet var calendarCustomViewContainer: UIView!
    

    override func awakeFromNib() {
        
    }
    
    
    func viewWillAppear(_ animated: Bool) {
        addCalendarCustomView()
        
    }
    private func addCalendarCustomView(){
        let bundle = Bundle.main
        guard let view = bundle.loadNibNamed("CalendarCustomView", owner: self, options: nil)?.first as? calendarCustomView
        else{ return }
        calendarCustomViewContainer.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo:  calendarCustomViewContainer.topAnchor),
            view.leadingAnchor.constraint(equalTo: calendarCustomViewContainer.leadingAnchor),
            view.trailingAnchor.constraint(equalTo:  calendarCustomViewContainer.trailingAnchor),
            view.bottomAnchor.constraint(equalTo:  calendarCustomViewContainer.bottomAnchor)
        ])
        
        
        
    }
}
