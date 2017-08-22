//
//  ViewController.swift
//  PageViewController
//
//  Created by wangxiaotao on 08/21/2017.
//  Copyright (c) 2017 wangxiaotao. All rights reserved.
//

import UIKit
import PageViewController

class ViewController: UIViewController {
    
    @IBOutlet weak var containerView: UIView!
    
    private lazy var pageViewController: PageViewController = { [unowned self] in
    
        let controller1 = self.controller(with: .red)
        let controller2 = self.controller(with: .yellow)
        let controller3 = self.controller(with: .blue)
        let controller4 = self.controller(with: .purple)

        let controller = PageViewController(controllers: [controller1, controller2, controller3, controller4], interPageSpacing: 10)
        return controller
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        addChildViewController(pageViewController)
        containerView.addSubview(pageViewController.view)
        pageViewController.view.frame = containerView.bounds
        
        
        pageViewController.didScrollToIndex = { index in
            print("didScrollToIndex = \(index)")

        }
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func controller(with color: UIColor) -> UIViewController {
    
        let controller1 = UIViewController()
        controller1.view.backgroundColor = color
        return controller1
    }
    
    @IBAction func clickButton(sender: Any) {
        
        pageViewController.removeCurrentController()
        print("totalPages = \(pageViewController.totalPages)")
        print("current index = \(pageViewController.currentIndex)")
    }

    @IBAction func valueChanged(sender: UISegmentedControl) {
        
        pageViewController.scrollToIndex(index: sender.selectedSegmentIndex)
    }
}

