//
//  ViewController.swift
//  Debassistant
//
//  Created by Somil Agarwal on 11/23/17.
//  Copyright © 2017 Somil Agarwal. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    
    @IBOutlet weak var yourPrepLabel: UILabel!
    
    @IBOutlet weak var oppoPrepLabel: UILabel!
    
    var prepTime = Int();
    
    var prepSeconds = 120;
    
    var prepTime2 = Int();
    
    var prepSeconds2 = 120;
    
    var myInt = 0;
    
    var displaySeconds = 0
    
    var displayMinutes = 2
    
    var displaySeconds2 = 0
    
    var displayMinutes2 = 2
    
    var sendView = 0
    
    @IBAction func caseButton(_ sender: Any) {
        myInt = 1
        
        print("******** myInt" + String(myInt));
        
        
        if (myInt == 1) {
            performSegue(withIdentifier: "segue", sender: self)
        }
    }
        
    

    
        

    @IBAction func rebuttalButton(_ sender: Any) {
        
        myInt = 2
        
        print("******** myInt" + String(myInt));
        
        
        if (myInt == 2) {
            performSegue(withIdentifier: "segue", sender: self)

        }
        
    }
    
    
    @IBAction func summaryButton(_ sender: Any) {
        
        myInt = 3
        
        print("******** myInt" + String(myInt));
        
        
        if (myInt == 3) {
            performSegue(withIdentifier: "segue", sender: self)
 
        }
        
    }
    
    @IBAction func finalFocusButton(_ sender: Any) {
        myInt = 4
        
        print("******** myInt" + String(myInt));
        
        
        if (myInt == 4) {

            performSegue(withIdentifier: "segue", sender: self)
        }
    }
    
    @IBAction func crossButton(_ sender: Any) {
        myInt = 5
        
        print ("******** myInt" + String(myInt))
        
        if(myInt == 5) {
            performSegue(withIdentifier: "segue", sender: self)
        }
    }
    
    
    @IBAction func resetButton(_ sender: Any) {
        prepSeconds = 120
        yourPrepLabel.text = "2:00"
        prepSeconds2 = 120
        oppoPrepLabel.text = "2:00"
        UserDefaults.standard.set(120, forKey: "prepStore")
        UserDefaults.standard.set(120, forKey: "prepStore2")
        
    }
    
    
    @IBAction func yourPrepButton(_ sender: Any) {
        
        yourPrepLabel.isEnabled = true
        
        myInt = 1000;
        
        prepTime = prepSeconds
        
        if(myInt == 1000){
            
            performSegue(withIdentifier: "segue", sender: self)
        }
        
    }
    
    @IBAction func oppoPrepButton(_ sender: Any) {
        
        oppoPrepLabel.isEnabled = true;
        
        myInt = 2000
        
        prepTime2 = prepSeconds2
        
        if(myInt == 2000){
            
            performSegue(withIdentifier: "segue", sender: self)
        }
        
    }
    
    @IBAction func timerAnalysis(_ sender: Any) {
       sendView = 1
        performSegue(withIdentifier: "segue3", sender: self)
        
          }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if sendView == 0 {
            let secondController = segue.destination as! ViewController2
            secondController.intPassed = myInt
            secondController.prep = prepTime
            secondController.prep2 = prepTime2
        } else {
            let fourthController = segue.destination as! ViewController4
            sendView = 0
        }
       
        
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        if let prepStore = UserDefaults.standard.value(forKey: "prepStore") as? Int {
            prepSeconds = prepStore
        }
        
        if let prepStore2 = UserDefaults.standard.value(forKey: "prepStore2") as? Int {
            prepSeconds2 = prepStore2
        }
        
        
        
        displayMinutes = Int(prepSeconds / 60)
        
        displaySeconds = prepSeconds % 60
        
        if(displaySeconds > 9) {
            yourPrepLabel.text = String (displayMinutes) + ":" + String(displaySeconds)
        } else {
            yourPrepLabel.text = String (displayMinutes) + ":0" + String(displaySeconds)
        }
        
        displayMinutes2 = Int(prepSeconds2 / 60)
        
        displaySeconds2 = prepSeconds2 % 60
        
        if(displaySeconds2 > 9) {
            oppoPrepLabel.text = String (displayMinutes2) + ":" + String(displaySeconds2)
        } else {
            oppoPrepLabel.text = String (displayMinutes2) + ":0" + String(displaySeconds2)
        }
        
    
    }
    
    
 
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

