//
//  DelegatePassDataVC.swift
//  DeepSwift
//
//  Created by Bimo Sekti Wicaksono on 22/08/23.
//

import UIKit

protocol DelegatePassDataVCDelegate {
    func passBackTheValue(value: String)
}

class DelegatePassDataVC: UIViewController {
    
    @IBOutlet weak var textLbl: UILabel!
    
    var delegate: DelegatePassDataVCDelegate?
    var data: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        textLbl.text = data

        // Do any additional setup after loading the view.
    }

    @IBAction func backToMainTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
        delegate?.passBackTheValue(value: "Get data from DelegatePassDataVC")
    }
}
