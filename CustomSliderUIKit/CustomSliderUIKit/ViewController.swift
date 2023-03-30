//
//  ViewController.swift
//  CustomSliderUIKit
//
//  Created by Bongani Mepha on 2023/03/22.
//

import UIKit

class ViewController: UIViewController {

    let rangeSlider = SliderRange(frame: .zero)
    
    override func viewDidLoad() {
      super.viewDidLoad()
      
      view.addSubview(rangeSlider)
      rangeSlider.addTarget(self, action: #selector(rangeSliderValueChanged(_:)),
                            for: .valueChanged)
      let time = DispatchTime.now() + 1
      DispatchQueue.main.asyncAfter(deadline: time) {
        self.rangeSlider.trackHighlightTintColor = .white
        self.rangeSlider.thumbImage = #imageLiteral(resourceName: "RectThumb")
        self.rangeSlider.highlightedThumbImage = #imageLiteral(resourceName: "HighlightedRect")
      }
    }
    
    override func viewDidLayoutSubviews() {
      let margin: CGFloat = 20
      let width = view.bounds.width - 2 * margin
      let height: CGFloat = 30
      
      rangeSlider.frame = CGRect(x: 0, y: 0,
                                 width: width, height: height)
      rangeSlider.center = view.center
    }
    
    @objc func rangeSliderValueChanged(_ rangeSlider: SliderRange) {
      let values = "(\(rangeSlider.lowerValue) \(rangeSlider.upperValue))"
      print("Range slider value changed: \(values)")
    }
  }
