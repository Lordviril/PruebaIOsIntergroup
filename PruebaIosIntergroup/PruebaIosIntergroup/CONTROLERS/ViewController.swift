//
//  ViewController.swift
//  PruebaIosIntergroup
//
//  Created by Pedro Alonso Daza B on 27/07/18.
//  Copyright © 2018 Pedro Alonso Daza B. All rights reserved.
//

import UIKit
import Material
import MediaPlayer
import AVFoundation
import AVKit

class ViewController: UIViewController, TextFieldDelegate {

    @IBOutlet weak var vGeneral: UIView!
    @IBOutlet weak var vVideoWelcome: UIView!
    @IBOutlet weak var etUser: CustomTextField!
    @IBOutlet weak var etPass: CustomTextField!
     let avPlayerController = AVPlayerViewController()
     var avPlayer: AVPlayer!
    override func viewDidLoad() {
        super.viewDidLoad()
        
//Se ajusta la imagen de la izquierda
        etUser.setImage(named: "ic_email_white")
        
        etPass.setImage(icon: Icon.cm.check!)
        
        let filepath: String? = Bundle.main.path(forResource: "movie", ofType: "mp4")
        let fileURL = URL.init(fileURLWithPath: filepath!)
        
        
        avPlayer = AVPlayer(url: fileURL)
        
        avPlayerController.player = avPlayer
        avPlayerController.view.frame = CGRect(x: 0, y: 10, width: (UIScreen.main.bounds.size.width - 20), height: 200)
        
        //  hide show control
        avPlayerController.showsPlaybackControls = false
        // play video
        
        avPlayerController.player?.play()
        vVideoWelcome.addSubview(avPlayerController.view)
        

        

        // Do any additional setup after loading the view, typically from a nib.
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        etUser.text = GetDataUser()
        avPlayerController.player?.play()
        
        if GetDataToken() != ""
        {
            self.avPlayerController.player?.pause()
            self.performSegue(withIdentifier: "preTableView", sender: self)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func triEnter(_ sender: UIButton) {
        SetData(User: etUser.text!)
        
        if ValidationEmpty(viewc: vGeneral)
        {
            GetLogIn(control: self, email: etUser.text!, pass: etPass.text!, Ok: {res in
                SetData(Token: USER.authToken)
                self.avPlayerController.player?.pause()
                self.performSegue(withIdentifier: "preTableView", sender: self)
                
            })
        }
        
        
    }


}

