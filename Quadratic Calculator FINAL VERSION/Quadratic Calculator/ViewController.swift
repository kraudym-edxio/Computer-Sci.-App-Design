//
//  ViewController.swift
//  Quadratic Calculator
//
//  Created by Student on 2018-12-03.
//  Copyright © 2018 Cashaback. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var txtA: UITextField!
    
    @IBOutlet var txtB: UITextField!
    
    @IBOutlet var txtC: UITextField!
    
    @IBOutlet var btnOK: UIButton!
    
    @IBOutlet var btnReset: UIButton!

    @IBOutlet var lblKQ: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        lblKQ.isHidden = true
        
        self.txtA.delegate = self
        self.txtB.delegate = self
        self.txtC.delegate = self
    }

    @IBAction func btnResetAction(_ sender: Any) {
        
        txtA.text = ""
        txtB.text = ""
        txtC.text = ""
        lblKQ.text = ""
    }
    
    @IBAction func btnOkAction(_ sender: Any) {
        
        let a:Float = (Float)(txtA.text!)!
        let b:Float = (Float)(txtB.text!)!
        let c:Float = (Float)(txtC.text!)!
        
        var delta:Float
        var x1:Float
        var x2:Float
        
        //CASE WITH NO SOLUTIONS.
        if (a == 0 && b == 0 && c == 0) {
            lblKQ.isHidden = false
            lblKQ.text = "There are no solutions!"
        }
            
        //CASE WITH ONE ROOT.
        else if (a == 0) {
            lblKQ.isHidden = false
            lblKQ.text = "There is ONE and only one root: x = \(-c/b)"
        }
            
        else {
            
            delta = b*b - 4*a*c
            
            //CASE WITH A DOUBLE ROOT.
            if (delta == 0) {
                lblKQ.isHidden = false
                //lblKQ.text = "String x = \(-b/2*a)"
                x1 = (-b + (sqrt(delta))) / (2*a)
                lblKQ.text = "The discriminate is zero and therefore a double root exists:\n X = \(x1)"
            }
                
            //CASE WITH NO REAL ROOTS.
            else if (delta < 0) {
                lblKQ.isHidden = false
                lblKQ.text = "There are NO real roots- the discriminate is a negative value!"
            }
                
            //CASE WITH TWO REAL & DISTINCT ROOTS.
            else {
                x1 = (-b + (sqrt(delta))) / (2*a)
                x2 = (-b - (sqrt(delta))) / (2*a)
                lblKQ.isHidden = false
                lblKQ.text = "There are TWO real and distinct roots:\n X1 = \(x1)\n X2 = \(x2)"
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}
