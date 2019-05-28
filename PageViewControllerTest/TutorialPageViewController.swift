//
//  TutorialPageViewController.swift
//  PageViewControllerTest
//
//  Created by 최영 on 28/05/2019.
//  Copyright © 2019 Wooriyo. All rights reserved.
//

import UIKit

class TutorialPageViewController: UIPageViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    
    override init(transitionStyle style: UIPageViewController.TransitionStyle, navigationOrientation: UIPageViewController.NavigationOrientation, options: [UIPageViewController.OptionsKey : Any]? = nil) {
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal, options: options)
    }
    
    
    
    
    required init?(coder: NSCoder) {
        //fatalError("init(coder:) has not been implemented")
        //self.init()
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
