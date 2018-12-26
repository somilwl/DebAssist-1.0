//
//  ViewController4.swift
//  Debassistant
//
//  Created by Somil Agarwal on 8/13/18.
//  Copyright © 2018 Somil Agarwal. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController4: UIViewController, AVAudioRecorderDelegate, UITableViewDelegate, UITableViewDataSource {

    var recordingSession: AVAudioSession!
    var audioRecorder: AVAudioRecorder!
    var audioPlayer: AVAudioPlayer!
    
    var numberOfRecords = 0
    
    @IBOutlet weak var buttonLabel: UIButton!
    
    @IBOutlet weak var myTableView: UITableView!
    
    @IBAction func record(_ sender: Any) {
        
        if audioRecorder == nil
        {
            numberOfRecords += 1
            let fileName = getDirectory().appendingPathComponent("\(numberOfRecords).m4a")
            
            let settings = [AVFormatIDKey: Int(kAudioFormatMPEG4AAC), AVSampleRateKey: 12000, AVNumberOfChannelsKey: 1, AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue]
            
            do{
                audioRecorder = try AVAudioRecorder(url: fileName, settings: settings)
                audioRecorder.delegate = self
                audioRecorder.record()
                
                buttonLabel.setTitle("Stop Recording", for: .normal)
            }
            catch{
                displayAlert(title: "Oops!", message: "Recording failed" )
            }
        }
        else{
            audioRecorder.stop()
            audioRecorder = nil
            
            UserDefaults.standard.set(numberOfRecords, forKey: "myNumber")
        
            
            myTableView.reloadData()
            
            buttonLabel.setTitle("Start Recording", for: .normal)
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //set up session
        recordingSession = AVAudioSession.sharedInstance()
        
        if let number:Int = UserDefaults.standard.object(forKey: "myNumber") as? Int
        {
            numberOfRecords = number
        }
        
        AVAudioSession.sharedInstance().requestRecordPermission { (hasPermission) in
            if hasPermission{
                print("ACCEPTED")
            }
        }

        // Do any additional setup after loading the view.
    }

    
    func getDirectory() -> URL
    {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentDirectory = paths[0]
        return documentDirectory
    }
    
    func displayAlert(title:String, message: String)
    {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "dismiss", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    //setting up table
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfRecords
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = String(indexPath.row + 1)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let path = getDirectory().appendingPathComponent("\(indexPath.row + 1).m4a")
        
        do
        {
            audioPlayer = try AVAudioPlayer(contentsOf: path)
            audioPlayer.play()
        }
        catch
        {
            
        }
    }
    
    @IBAction func timerAnalysis(_ sender: Any) {
        performSegue(withIdentifier: "segue4", sender: self)
    }
    
    
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let firstController = segue.destination as! ViewController
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
