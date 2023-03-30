//
//  ViewController.swift
//  CalendarView
//
//  Created by Bongani Mepha on 2022/09/29.
//

import UIKit

class ViewController: UIViewController, UICalendarSelectionMultiDateDelegate {
    
    
  

    @IBOutlet var calendarCustomViewContainer: calendarCustomView!
    override func viewDidLoad() {
        super.viewDidLoad()
        createCalendar()
       
    }
    
//    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
//        super.init(nibName: nil, bundle: nil)
//        createCalendar()
//    }
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: "CalendarCustomView", bundle:  nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
      
    }
        
    
    
        
    
    func createCalendar() {
         var calendarView = UICalendarView()
        let selectionBehavior = UICalendarSelectionMultiDate(delegate: self)
        calendarView.translatesAutoresizingMaskIntoConstraints = false
        
        
        calendarView.calendar = .current
        calendarView.locale = .current
        calendarView.selectionBehavior = selectionBehavior 
        calendarView.fontDesign = .rounded
        calendarView.delegate = self
        
        view.addSubview(calendarView)
        
        NSLayoutConstraint.activate([
            calendarView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            calendarView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -21),
            calendarView.heightAnchor.constraint(equalTo: view.heightAnchor, constant: -300),
            calendarView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        ])
        
    }
    
    
}

extension ViewController: UICalendarViewDelegate {

    func calendarView(_ calendarView: UICalendarView,decorationFor dateComponents: DateComponents) -> UICalendarView.Decoration? {
        //.default()
        //.image(UIImage(systemName: "heart.fill"))
        
        return nil
        
      
    }
    
    func multiDateSelection(_ selection: UICalendarSelectionMultiDate, didSelectDate dateComponents: DateComponents) {
        print("selected Date: ", dateComponents.date)
    }
    
    func multiDateSelection(_ selection: UICalendarSelectionMultiDate, didDeselectDate dateComponents: DateComponents) {
        
    }
    

}

