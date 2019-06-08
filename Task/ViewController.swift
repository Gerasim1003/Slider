//
//  ViewController.swift
//  Task
//
//  Created by Gerasim Israyelyan on 6/2/19.
//  Copyright © 2019 Gerasim Israyelyan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var s: CGFloat!
   
    @IBOutlet var switches: [UISwitch]!
    
    @IBOutlet var valueLabel: UILabel!
    
    @IBOutlet var slider: UISlider!
    
    @IBOutlet var colorView: UIView!
    @IBOutlet var equalWidth: NSLayoutConstraint!
    
    override func viewWillLayoutSubviews() {
        slider.setThumbImage(UIImage(named: "thumb"), for: .normal)
        updateSlider()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func sliderAction(_ sender: Any) {
        updateSlider()
    }
    
    func updateSlider() {
        self.s = colorView.frame.width / CGFloat(slider.maximumValue)
        valueLabel.text = String(format: "%.0f", slider.value)
        equalWidth.constant = s * CGFloat(slider.value - slider.maximumValue / 2) * 2
    }
    
    @IBAction func `switch`(_ sender: UISwitch) {
        let index = sender.tag
        
        let stackView = view.subviews[0]
        let views: [UIView] = [stackView.subviews[1], stackView.subviews[2], stackView.subviews[3]]
        
        var flag = true
        for i in index..<switches.count {
            if i == index {
                continue
            }
            if switches[i].isOn {
                flag = false
            }
        }
        if flag {
            
            for subview in views[index].subviews {
                
                subview.isHidden = !switches[index].isOn
            }

        } else {
            sender.isOn = true
        }
        if switches[index].isOn {
            for i in 0..<index {
                switches[i].isOn = true
                for subview in views[i].subviews {
                    subview.isHidden = false
                }
            }
        }

    }
    
}


