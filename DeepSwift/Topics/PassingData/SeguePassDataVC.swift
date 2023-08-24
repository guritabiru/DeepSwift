//
//  SeguePassDataVC.swift
//  DeepSwift
//
//  Created by Bimo Sekti Wicaksono on 22/08/23.
//

import UIKit

class SeguePassDataVC: UIViewController {

    @IBOutlet weak var textLbl: UILabel!
    
    var textData: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textLbl.text = textData
        // Do any additional setup after loading the view.
    }

}
