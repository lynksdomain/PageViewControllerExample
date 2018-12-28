//
//  PageViewController.swift
//  PageApp
//
//  Created by C4Q on 12/17/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController {

   lazy var allViewControllers = [self.getViewController(name: "FirstViewController"), self.getViewController(name: "SecondViewController")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = self
        setViewControllers([allViewControllers[0]], direction: .forward, animated: true, completion: nil)
    }
    private func getViewController(name:String) -> UIViewController {
//        let storyBoard = UIStoryboard.init(name: "Main", bundle: nil)
//        let vc = storyBoard.instantiateViewController(withIdentifier: name)
        return UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier:name)
    }
}

extension PageViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let index = allViewControllers.firstIndex(of: viewController) else { return nil }
        let previousIndex  = index - 1
        if previousIndex < 0 {
            return allViewControllers[allViewControllers.count - 1]
        } else {
            return allViewControllers[previousIndex]
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let index = allViewControllers.firstIndex(of: viewController) else { return nil }
        let nextIndex = index + 1
        if nextIndex == allViewControllers.count {
            return allViewControllers[0]
        } else {
            return allViewControllers[nextIndex]
        }
    }
}
