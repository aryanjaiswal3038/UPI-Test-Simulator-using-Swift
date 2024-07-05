//
//  KeyboardView.swift
//  testDemo
//
//  Created by Rishabh Jaiswal on 29/01/24.
//

import UIKit

class KeyboardView: UIView {
    
    var callBack: ((Int)-> Void)?
    
    
    @IBOutlet var button1: [UIButton]!
    @IBOutlet var contentView: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit(){
        Bundle.main.loadNibNamed("KeyboardView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
    
    @IBAction func axnButton(_ sender: UIButton) {
        let tag = sender.tag
        callBack?(tag)
    }
}
