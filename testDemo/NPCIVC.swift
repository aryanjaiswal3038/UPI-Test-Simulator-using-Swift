//
//  NPCIVC.swift
//  testDemo
//
//  Created by Rishabh Jaiswal on 28/01/24.
//

import UIKit

class NPCIVC: UIViewController {

    @IBOutlet weak var detailView: UIView!
    @IBOutlet weak var dropDownBtn: UIButton!
    @IBOutlet weak var upiLbl: UILabel!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet var mainView: UIView!
    @IBOutlet weak var keyboardView: KeyboardView!
    @IBOutlet var upiBtn: [UIButton]!
    var txnId:String = ""
    var isSelected = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
           mainUI()
    }
    
    func mainUI(){
        keyboardView.callBack = { [weak self] tag in self?.handleButtonPress(tag: tag)}
        detailView.isHidden = true
        upiLbl.isHidden = false
        stackView.isHidden = false
        mainView.layer.opacity = 1
        mainView.alpha = 1
        mainView.backgroundColor = UIColor.white.withAlphaComponent(1)
        }
    
    func postAction() {
        let Url = String(format: "https://sims.0xcti.tech/statusUpdate")
        guard let serviceUrl = URL(string: Url) else { return }
        let parameterDictionary = ["txnId" : txnId, "isPayuId" : "1"]
        print(txnId)
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
                           self.navigationController?.setNavigationBarHidden(true, animated: false)
                           nextVC.finalResponse = key == 1 ? "Payment Successfully Done" : "Payment Fail"
                           self.navigationController?.pushViewController(nextVC, animated: true)
                       }
                   }
                } catch {
                    print(error)
                }
            }
        }.resume()
    }

    
    @IBAction func detailAxn(_ sender: UIButton) {

        isSelected.toggle()
        
        if isSelected{
            detailView.isHidden = false
            upiLbl.isHidden = true
            stackView.isHidden = true
            mainView.layer.opacity = 0.50
            mainView.alpha = 0.8
            mainView.backgroundColor = UIColor.black.withAlphaComponent(0.8)
        }
        else{
            detailView.isHidden = true
            upiLbl.isHidden = false
            stackView.isHidden = false
            mainView.layer.opacity = 1
            mainView.alpha = 1
            mainView.backgroundColor = UIColor.white.withAlphaComponent(1)
        }
    }
    
    @IBAction func upiBtnAxn(_ sender: UIButton) {
    }
    
    @IBAction func cancelBtn(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
}




// Keyboard Action
extension NPCIVC {
    
    func handleButtonPress(tag: Int){
        print("\(tag)")
        
        if tag == 0 || tag == 1 || tag == 2 || tag == 3 || tag == 4 || tag == 5 || tag == 6 || tag == 7 || tag == 8 || tag == 9 {
            
            if self.upiBtn[0].titleLabel?.text == nil {
                
                self.upiBtn[0].titleLabel?.text = "\(tag)"
                self.upiBtn[0].applyStyle(cornerRadius: 10, backgroundColor: .blue)
              
            }
            else if self.upiBtn[1].titleLabel?.text == nil{
                
                self.upiBtn[1].titleLabel?.text = "\(tag)"
                self.upiBtn[1].applyStyle(cornerRadius: 10, backgroundColor: .blue)
            }
            
            else if self.upiBtn[2].titleLabel?.text == nil{
                
                self.upiBtn[2].titleLabel?.text = "\(tag)"
                self.upiBtn[2].applyStyle(cornerRadius: 10, backgroundColor: .blue)

            }
            else if self.upiBtn[3].titleLabel?.text == nil{
                
                self.upiBtn[3].titleLabel?.text = "\(tag)"
                self.upiBtn[3].applyStyle(cornerRadius: 10, backgroundColor: .blue)

            }
            else if self.upiBtn[4].titleLabel?.text == nil{
                
                self.upiBtn[4].titleLabel?.text = "\(tag)"
                self.upiBtn[4].applyStyle(cornerRadius: 10, backgroundColor: .blue)

            }
            else if self.upiBtn[5].titleLabel?.text == nil{
                
                self.upiBtn[5].titleLabel?.text = "\(tag)"
                self.upiBtn[5].applyStyle(cornerRadius: 10, backgroundColor: .blue)

            }

       }
        
        else if tag == 10{

            
            if self.upiBtn[0].titleLabel?.text != nil && self.upiBtn[1].titleLabel?.text != nil && self.upiBtn[2].titleLabel?.text != nil && self.upiBtn[3].titleLabel?.text != nil && self.upiBtn[4].titleLabel?.text != nil && self.upiBtn[5].titleLabel?.text != nil {
                upiBtn[5].applyStyle1(cornerRadius: 10, backgroundColor: .white, borderWidth: 1, borderColor: .blue)
                upiBtn[5].titleLabel?.text = nil
            }
            else if self.upiBtn[0].titleLabel?.text != nil && self.upiBtn[1].titleLabel?.text != nil && self.upiBtn[2].titleLabel?.text != nil && self.upiBtn[3].titleLabel?.text != nil && self.upiBtn[4].titleLabel?.text != nil && self.upiBtn[5].titleLabel?.text == nil {
                
                upiBtn[4].applyStyle1(cornerRadius: 10, backgroundColor: .white, borderWidth: 1, borderColor: .blue)
                upiBtn[4].titleLabel?.text = nil

            }
            else if self.upiBtn[0].titleLabel?.text != nil && self.upiBtn[1].titleLabel?.text != nil && self.upiBtn[2].titleLabel?.text != nil && self.upiBtn[3].titleLabel?.text != nil && self.upiBtn[4].titleLabel?.text == nil && self.upiBtn[5].titleLabel?.text == nil {
                
                upiBtn[3].applyStyle1(cornerRadius: 10, backgroundColor: .white, borderWidth: 1, borderColor: .blue)
                upiBtn[3].titleLabel?.text = nil

            }
            else if self.upiBtn[0].titleLabel?.text != nil && self.upiBtn[1].titleLabel?.text != nil && self.upiBtn[2].titleLabel?.text != nil && self.upiBtn[3].titleLabel?.text == nil && self.upiBtn[4].titleLabel?.text == nil && self.upiBtn[5].titleLabel?.text == nil {
                
                upiBtn[2].applyStyle1(cornerRadius: 10, backgroundColor: .white, borderWidth: 1, borderColor: .blue)
                upiBtn[2].titleLabel?.text = nil

            }
            else if self.upiBtn[0].titleLabel?.text != nil && self.upiBtn[1].titleLabel?.text != nil && self.upiBtn[2].titleLabel?.text == nil && self.upiBtn[3].titleLabel?.text == nil && self.upiBtn[4].titleLabel?.text == nil && self.upiBtn[5].titleLabel?.text == nil {
                
                upiBtn[1].applyStyle1(cornerRadius: 10, backgroundColor: .white, borderWidth: 1, borderColor: .blue)
                upiBtn[1].titleLabel?.text = nil

            }
            else if self.upiBtn[0].titleLabel?.text != nil && self.upiBtn[1].titleLabel?.text == nil && self.upiBtn[2].titleLabel?.text == nil && self.upiBtn[3].titleLabel?.text == nil && self.upiBtn[4].titleLabel?.text == nil && self.upiBtn[5].titleLabel?.text == nil {
                
                upiBtn[0].applyStyle1(cornerRadius: 10, backgroundColor: .white, borderWidth: 1, borderColor: .blue)
                upiBtn[0].titleLabel?.text = nil

            }
            
        }
        else if tag == 11{
            if self.upiBtn[0].titleLabel?.text != nil && self.upiBtn[1].titleLabel?.text != nil && self.upiBtn[2].titleLabel?.text != nil && self.upiBtn[3].titleLabel?.text != nil && self.upiBtn[4].titleLabel?.text != nil && self.upiBtn[5].titleLabel?.text != nil{
                postAction()
            }
            else{
                self.showSimpleAlert(title: "Payu", message: "Please enter OTP")
            }
        }
    }

    func showSimpleAlert(title:String,message:String) {
           let alert = UIAlertController(title: title, message: message,preferredStyle: UIAlertController.Style.alert)

           alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: { _ in
               //Cancel Action
           }))
           self.present(alert, animated: true, completion: nil)
       }

}
