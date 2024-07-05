//
//  ResponseVC.swift
//  testDemo
//
//  Created by Rishabh Jaiswal on 26/01/24.
//

import UIKit

class ResponseVC: UIViewController {
    
    var finalResponse: String = ""

    @IBOutlet weak var txtView: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.async{
            // UIView usage
            self.txtView.text = self.finalResponse
        }
    }

}
