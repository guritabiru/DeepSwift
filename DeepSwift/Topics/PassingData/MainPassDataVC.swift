//
//  MainPassDataVC.swift
//  DeepSwift
//
//  Created by Bimo Sekti Wicaksono on 22/08/23.
//

import UIKit

class MainPassDataVC: UIViewController, DelegatePassDataVCDelegate {

    
// MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationItem.title = "Pass Data"
        self.navigationItem.backButtonTitle = ""
    }
    
    
// MARK: Pass Data Properties
// Passing data between View Controllers with properties
    @IBAction func propertyPDTapped(_ sender: Any) {
        let propertyVC = PropertyPassDataVC(nibName: "PropertyPassDataVC", bundle: nil)
        propertyVC.textData = "Get data from MainPassDataVC"
        propertyVC.mainPDView = self
        self.navigationController?.pushViewController(propertyVC, animated: true)
    }
    
    func onUserAction(data: String) {
        print("Received data: \(data)")
    }
    
    
// MARK: Pass Data Segue
// Passing data between View Controllers with segue
    @IBAction func seguePDTapped(_ sender: Any) {
        performSegue(withIdentifier: "goToSeguePDView", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToSeguePDView" {
            guard let segueVC = segue.destination as? SeguePassDataVC else {return}
            segueVC.textData = "Get data from MainPassDataVC"
        }
    }
    
    
// MARK: Pass Data Back Delegate
// Passing data back with delegates and protocol
    @IBAction func delegatePDTapped(_ sender: Any) {
        let storyboard = UIStoryboard(name: "PassData", bundle: nil)
        let delegatePassDataVC = storyboard.instantiateViewController(withIdentifier: "delegatePassDataVC") as! DelegatePassDataVC
        delegatePassDataVC.delegate = self
        delegatePassDataVC.data = "Get data from MainPassDataVC"
        self.navigationController?.pushViewController(delegatePassDataVC, animated: true)
    }
    
    func passBackTheValue(value: String) {
        print(value)
    }
    
    
// MARK: Pass Data Back Closure
// Passing data back with a closure
    @IBAction func closurePDTapped(_ sender: Any) {
        let storyboard = UIStoryboard(name: "PassData", bundle: nil)
        let closurePassDataVC = storyboard.instantiateViewController(withIdentifier: "closurePassDataVC") as! ClosurePassDataVC
        closurePassDataVC.closureData = { data in
            print("Get data from \(data)")
        }
        closurePassDataVC.data = "Get data from MainPassDataVC via property"
        self.navigationController?.pushViewController(closurePassDataVC, animated: true)
    }
}
