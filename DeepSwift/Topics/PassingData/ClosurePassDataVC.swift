//
//  ClosurePassDataVC.swift
//  DeepSwift
//
//  Created by Bimo Sekti Wicaksono on 23/08/23.
//

import UIKit

class ClosurePassDataVC: UIViewController {

    @IBOutlet weak var textLbl: UILabel!
    
    var closureData: ((String) -> Void)?
    var data: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textLbl.text = data
        // Do any additional setup after loading the view.
    }

    @IBAction func backToMainTapped(_ sender: Any) {
        closureData?("closure")
        self.navigationController?.popViewController(animated: true)
    }
}
