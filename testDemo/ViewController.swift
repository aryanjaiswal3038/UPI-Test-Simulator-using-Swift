//
//  ViewController.swift
//  testDemo
//
//  Created by Rishabh Jaiswal on 14/12/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txfView: UIView!
    
    @IBOutlet weak var amounttxf: UITextField!
    var txnId:String = ""

   // var appDelegate = UIApplication.shared.delegate as! AppDelegate
    
   // var amount: String { appDelegate.value1} //computed property get(set nhi kar sakte)
    
   // var am = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        print("test")
        NotificationCenter.default.addObserver(self, selector: #selector(handleNotification(_:)), name: NSNotification.Name(rawValue: "PaymentDetails"), object: nil)
    
    }
    @objc func handleNotification(_ notification: Notification) {
        if let userInfo = notification.userInfo{
            if let data = userInfo["amount"] as? String, let data1 = userInfo["txnId"] as? String {
                // Use the data in your ViewController
                print("Received data: \(data)")
                self.amounttxf.text = data
                self.txnId = data1
            }
        }
    }
    
//    func load(data: String, txnID: String){
//        self.amounttxf.text = data
//        self.txnId = txnID
//        print(data)
//    }
//    override func viewWillAppear(_ animated: Bool) {
//        func load(data: String){
//            self.amounttxf.text = data
//            print(data)
//        }
//        // Do any additional setup after loading the view.
//    }
    
    
   
  
    @IBAction func payNow(_ sender: UIButton) {
        
        let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "NPCIVC") as! NPCIVC
        nextVC.txnId = txnId
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        self.navigationController?.pushViewController(nextVC, animated: true)
        
    }
    
}
