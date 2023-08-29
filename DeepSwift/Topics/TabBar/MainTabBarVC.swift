//
//  MainTabBarVC.swift
//  DeepSwift
//
//  Created by Bimo Sekti Wicaksono on 28/08/23.
//

import UIKit

class MainTabBarVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationItem.title = "Tab Bar"
        self.navigationItem.backButtonTitle = ""
    }
    
    
// MARK: - Programmatically Tab Bar
    @IBAction func programmaticallyTapped(_ sender: Any) {
        
        // Create view controller for tab bar item
        let firstTabBarVC = addTabBarItem(title: "First", identifier: "FirstTabBarVC", selectedImage: "star.fill", image: "star")
        let secondTabBarVC = addTabBarItem(title: "Second", identifier: "SecondTabBarVC", selectedImage: "heart.fill", image: "heart")
        
        // Setup Tab Bar
        let tabBarController = UITabBarController()
        tabBarController.tabBar.backgroundColor = UIColor.white
        tabBarController.viewControllers = [firstTabBarVC, secondTabBarVC]
        
        self.navigationController?.pushViewController(tabBarController, animated: true)
    }
    
    // Setup view controller for tab bar item
    func addTabBarItem(title: String, identifier: String, selectedImage: String, image: String) -> UIViewController{
        let storyboard = UIStoryboard(name: "TabBar", bundle: nil)
        let tabBarItemVC = storyboard.instantiateViewController(withIdentifier: identifier)
        tabBarItemVC.tabBarItem.title = title
        tabBarItemVC.tabBarItem.selectedImage = UIImage(systemName: selectedImage)
        tabBarItemVC.tabBarItem.image = UIImage(systemName: image)
        
        return tabBarItemVC
    }
}
