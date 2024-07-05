//
//  HomeVC.swift
//  testDemo
//
//  Created by Rishabh Jaiswal on 20/12/23.
//

import UIKit

class HomeVC: UIViewController {
    

    @IBOutlet weak var txf1: UITextField!
    @IBOutlet weak var txf2: UITextField!
    @IBOutlet weak var txf3: UITextField!
    @IBOutlet weak var txf4: UITextField!
    @IBOutlet weak var txf5: UITextField!
    @IBOutlet weak var txf6: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func payNow(_ sender: UIButton) {
       // fieldValidations()
        postAction()
    }
  
    
    func postAction() {
        let Url = String(format: "https://sims.0xcti.tech/statusUpdate")
        guard let serviceUrl = URL(string: Url) else { return }
        let parameterDictionary = ["txnId" : "40348934958", "isPayuId" : "1"]
        var request = URLRequest(url: serviceUrl)
        request.httpMethod = "POST"
        request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameterDictionary, options: []) else {
            return
        }
        request.httpBody = httpBody
        
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
            if let response = response {
                print(response)
            }
            if let data = data {
                do {
                   if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
                      let key = json["status"] as? Int{
                       print("bhbhh: \(key)")
                       print("bhbhh: \(json)")
                       DispatchQueue.main.async{
                           let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "ResponseVC") as! ResponseVC
//                           nextVC.finalResponse = json
                           self.navigationController?.pushViewController(nextVC, animated: true)
                       }
                   }
                } catch {
                    print(error)
                }
            }
        }.resume()
    }

}
extension HomeVC:UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
//          if (range.length == 0){
//            if textField == txf1 {
//                txf2?.becomeFirstResponder()
//            }
//            if textField == txf2 {
//                txf3?.becomeFirstResponder()
//            }
//            if textField == txf3 {
//                txf4?.becomeFirstResponder()
//            }
//            if textField == txf4 {
//                txf4?.resignFirstResponder()
//
//            }
//            textField.text? = string
//            return false
//        }else if (range.length == 1) {
//            if textField == txf4 {
//                txf4?.becomeFirstResponder()
//            }
//            if textField == txf3 {
//                txf3?.becomeFirstResponder()
//            }
//            if textField == txf2 {
//                txf2?.becomeFirstResponder()
//            }
//            if textField == txf1 {
//                txf1?.resignFirstResponder()
//            }
//            textField.text? = ""
//            return false
//        }
//        return true

        
        
        if (string.count == 1){
                   if textField == txf1 {
                       txf2?.becomeFirstResponder()
                   }
                   if textField == txf2 {
                       txf3?.becomeFirstResponder()
                   }
                   if textField == txf3 {
                       txf4?.becomeFirstResponder()
                   }
                   if textField == txf4 {
                       txf5?.becomeFirstResponder()
                       
                   }
                   if textField == txf5 {
                       txf6?.becomeFirstResponder()
                   }
                   if textField == txf6 {
                       txf6?.resignFirstResponder()
                       self.view.endEditing(true)

                   }
                   textField.text? = string
                   return false
               }else
        {
                   if textField == txf1 {
                       txf1?.becomeFirstResponder()
                   }
                   if textField == txf2 {
                       txf1.becomeFirstResponder()
                   }
                   if textField == txf3 {
                       txf2?.becomeFirstResponder()
                   }
                   if textField == txf4 {
                       txf3?.becomeFirstResponder()
                   }
                   if textField == txf5 {
                       txf4?.becomeFirstResponder()
                   }
                   if textField == txf6 {
                       txf5?.becomeFirstResponder()
                   }
                   textField.text? = string
                   return false
               }
        
    }
}

extension HomeVC{
    
    func showSimpleAlert(title:String,message:String) {
           let alert = UIAlertController(title: title, message: message,preferredStyle: UIAlertController.Style.alert)

           alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: { _ in
               //Cancel Action
           }))
           self.present(alert, animated: true, completion: nil)
       }
    func fieldValidations(){
        if String.getString(self.txf1.text!).isEmpty{
            self.showSimpleAlert(title: "Payu", message: "Please enter OTP")
            return
        }else if String.getString(self.txf2.text!).isEmpty{
            self.showSimpleAlert(title: "Payu", message: "Please enter OTP")
            return
        }else if String.getString(self.txf3.text!).isEmpty{
            self.showSimpleAlert(title: "Payu", message: "Please enter OTP")
            return
        }else if String.getString(self.txf4.text!).isEmpty{
            self.showSimpleAlert(title: "Payu", message: "Please enter OTP")
            return
        }else if String.getString(self.txf5.text!).isEmpty{
            self.showSimpleAlert(title: "Payu", message: "Please enter OTP")
            return
        }else if String.getString(self.txf6.text!).isEmpty{
            self.showSimpleAlert(title: "Payu", message: "Please enter OTP")
            return
        }
        self.view.endEditing(true)

    }
}

