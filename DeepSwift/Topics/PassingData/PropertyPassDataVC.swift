//
//  PropertyPassDataVC.swift
//  DeepSwift
//
//  Created by Bimo Sekti Wicaksono on 22/08/23.
//

import UIKit

class PropertyPassDataVC: UIViewController {

    @IBOutlet weak var textLbl: UILabel!
    
    var textData = ""
    var mainPDView: MainPassDataVC?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textLbl.text = textData
    }
    
    @IBAction func backPDTapped(_ sender: Any) {
        mainPDView?.onUserAction(data: "from property PD view")
        self.navigationController?.popViewController(animated: true)
    }
    
}
