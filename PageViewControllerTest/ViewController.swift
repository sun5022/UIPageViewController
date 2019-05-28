//
//  ViewController.swift
//  PageViewControllerTest
//
//  Created by 최영 on 28/05/2019.
//  Copyright © 2019 Wooriyo. All rights reserved.
//

import UIKit

class ViewController: TutorialPageViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource
{

    var index : Int = 0;
    var indexMin = 0;
    var indexMax = 2;
    
    // restoreIdentifier
    var identifiers: NSArray = ["Tutorial1VC", "Tutorial2VC", "Tutorial3VC"]
    
    // The custom UIPageControl
    let pageControl = UIPageControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = self
        self.dataSource = self
        
        index = 0
        self.setViewControllers([getViewControllerAtIndex(index: 0)] as? [UIViewController], direction: UIPageViewController.NavigationDirection.forward, animated: false, completion: nil)
        
        // PageControl 세팅
        self.pageControl.frame = CGRect()
        self.pageControl.currentPageIndicatorTintColor = UIColor.black
        self.pageControl.pageIndicatorTintColor = UIColor.lightGray
        self.pageControl.numberOfPages = self.identifiers.count
        self.pageControl.currentPage = 0
        self.view.addSubview(self.pageControl)
        
        self.pageControl.translatesAutoresizingMaskIntoConstraints = false
        self.pageControl.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -90).isActive = true
        self.pageControl.widthAnchor.constraint(equalTo: self.view.widthAnchor, constant: -20).isActive = true
        self.pageControl.heightAnchor.constraint(equalToConstant: 20).isActive = true
        self.pageControl.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
    }
    
    // MARK:- UIPageViewControllerDataSource Methods
    // 이전 화면 그리기
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController?
    {
        let identifier = viewController.restorationIdentifier
        let index = self.identifiers.index(of: identifier as Any)
        
        NSLog("ViewController_tutorialRootView viewControllerBefore index : %d", index)
        
        if index == 0
        {
            return nil
        }
        
        //decrement the index to get the viewController before the current one
        self.index = index - 1
        
        return getViewControllerAtIndex (index: self.index)
    }
    
    // 다음 화면 그리기
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController?
    {
        
        
        let identifier = viewController.restorationIdentifier
        let index = self.identifiers.index(of: identifier as Any)
        
        NSLog("ViewController_tutorialRootView viewControllerAfter index : %d", index)
        
        if (index == self.identifiers.count-1)
        {
            return nil
        }
        
        self.index = index + 1
        
        return getViewControllerAtIndex (index: self.index)
    }
    
    // 현재 페이지 구하기
    func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo pendingViewControllers: [UIViewController]) {
        let currentPage : Int = self.identifiers.index(of: pendingViewControllers[0].restorationIdentifier as Any)
        NSLog("ViewController_tutorialRootView willTransitionTo index = %d", currentPage)
        self.pageControl.currentPage = currentPage
    }
    
    // 인디케이터에 반영할 항목 갯수 반환
    func presentationCountForPageViewController(pageViewController: UIPageViewController!) -> Int {
        return self.identifiers.count
    }
    
    // 페이지 인디케이터에 반영할 아이템 인덱스
    func presentationIndexForPageViewController(pageViewController: UIPageViewController!) -> Int {
        return 0
    }
    
    
    
    // MARK:- Other Methods
    func getViewControllerAtIndex(index: NSInteger) -> UIViewController?
    {
        NSLog("ViewController_tutorialRootView getViewControllerAtIndex index : %d", index)
        
        if index == 0
        {
            let storyboard = UIStoryboard(name: "Tutorial", bundle: nil);
            let viewController_Tutorial_1 = storyboard.instantiateViewController(withIdentifier: "Tutorial1VC") as! Tutorial1VC
            return viewController_Tutorial_1
        }
        else if index == 1
        {
            
            let storyboard = UIStoryboard(name: "Tutorial", bundle: nil);
            let viewController_Tutorial_2 = storyboard.instantiateViewController(withIdentifier: "Tutorial2VC") as! Tutorial2VC
            return viewController_Tutorial_2
        }
        else if index == 2
        {
            let storyboard = UIStoryboard(name: "Tutorial", bundle: nil);
            let viewController_Tutorial_3 = storyboard.instantiateViewController(withIdentifier: "Tutorial3VC") as! Tutorial3VC
            return viewController_Tutorial_3
        }
        else
        {
            return nil
        }
    }
    
    


}

