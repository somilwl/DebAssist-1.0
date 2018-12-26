//
//  ViewController2.swift
//  Debassistant
//
//  Created by Somil Agarwal on 11/24/17.
//  Copyright © 2017 Somil Agarwal. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController2: UIViewController {
    
    
    
    var seconds = Int()
    
    var timer = Timer()
    
    var displayMinutes = Int()
    
    var displaySeconds = 00
    
    var intPassed = Int()
    
    var prep = Int()
    
    var prep2 = Int()
    
    var prepSeconds = Int();
    
    var player: AVAudioPlayer = AVAudioPlayer()
    
    var isPlaying = false
    
    
    @IBOutlet weak var bottomLabel: UILabel!
    
    @IBOutlet weak var startButton: UIButton!
    
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var speechLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let musicFile = Bundle.main.path(forResource: "sampleMusic", ofType: "m4a")
        
        do {
            try player = AVAudioPlayer(contentsOf: URL (fileURLWithPath: musicFile!))
        }
        catch {
            print(error)
        }
        
        if (intPassed == 1){
            seconds = 240
            displayMinutes = 4;
            timeLabel.text = "4:00"
            speechLabel.text = "Case";
            
        }else if (intPassed == 2){
                seconds = 240
                displayMinutes = 4;
                timeLabel.text = "4:00"
                speechLabel.text = "Rebuttal";
            
        } else if (intPassed == 3) {
            seconds = 120
            displayMinutes = 2;
            timeLabel.text = "2:00"
            speechLabel.text = "Summary";
            
        } else if (intPassed == 4) {
            seconds = 120
            displayMinutes = 2;
            timeLabel.text = "2:00"
            speechLabel.text = "Final Focus";
            
            
        } else if (intPassed == 5) {
            seconds = 180
            displayMinutes = 3
            timeLabel.text = "3:00"
            speechLabel.text = "Crossfire";
        } else if (intPassed == 1000){
            seconds = prep
            displayMinutes = Int(seconds / 60)
            displaySeconds = seconds % 60
            if(displaySeconds > 9) {
                timeLabel.text = String (displayMinutes) + ":" + String(displaySeconds)
            } else {
                timeLabel.text = String (displayMinutes) + ":0" + String(displaySeconds)
            }
            speechLabel.text = "Prep Time";
            
            
        } else {
            seconds = prep2
            displayMinutes = Int(seconds / 60)
            displaySeconds = seconds % 60
            if(displaySeconds > 9) {
                timeLabel.text = String (displayMinutes) + ":" + String(displaySeconds)
            } else {
                timeLabel.text = String (displayMinutes) + ":0" + String(displaySeconds)
            }
            speechLabel.text = "Prep Time";
        }
        
        bottomLabel.text = String(intPassed);
        

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func startButton(_ sender: Any) {
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController2.counter), userInfo: nil, repeats: true)
        
        startButton.isEnabled = false;
   
    }
    
    @objc func counter ()
    {
        seconds -= 1
        
        displaySeconds = seconds % 60
        
        if(displaySeconds == 59) {
            
            displayMinutes = displayMinutes - 1;
            
        }
    
        if (seconds < 11)
        {
             self.view.backgroundColor = UIColor.red
        }
        
        
        
        if(displaySeconds > 9) {
            timeLabel.text = String (displayMinutes) + ":" + String(displaySeconds)
        } else {
            timeLabel.text = String (displayMinutes) + ":0" + String(displaySeconds)
        }
        
        if(seconds == 0)
        {
            player.play()
            
            timer.invalidate()
            
        }
    }
    
    @IBAction func pauseButton(_ sender: Any) {
        timer.invalidate()
        
        if (seconds > 0){
            startButton.isEnabled = true;
        }
    }
    @IBAction func stopButton(_ sender: Any) {
        
        timer.invalidate()
        
        if(intPassed == 1000) {
//            prepSeconds = seconds
            UserDefaults.standard.set(seconds, forKey: "prepStore")
        }
        
        if(intPassed == 2000) {
            //            prepSeconds = seconds
            UserDefaults.standard.set(seconds, forKey: "prepStore2")
        }
        
        
        performSegue(withIdentifier: "segue2", sender: self)
        
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let firstController = segue.destination as! ViewController
//       if(intPassed == 1000) {
//           firstController.prepSeconds = prepSeconds
//       }
//
//        if (intPassed == 2000) {
//
//       }

    }
    
        
    
}

