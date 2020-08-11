//
//  ViewController.swift
//  RoomAndSsance
//
//  Created by Yonghyun on 2020/08/11.
//  Copyright © 2020 Yonghyun. All rights reserved.
//

import UIKit
import JitsiMeet

class ViewController: UIViewController {

    @IBOutlet var roomNameTextField: UITextField!
    fileprivate var jitsiMeetView: JitsiMeetView?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func joinRoom(_ sender: Any) {
        let room: String = roomNameTextField.text!
        if(room.count < 1) {
            return
        }

        // create and configure jitsimeet view
        let jitsiMeetView = JitsiMeetView()
        jitsiMeetView.delegate = self
        self.jitsiMeetView = jitsiMeetView
        let options = JitsiMeetConferenceOptions.fromBuilder { (builder) in
            builder.welcomePageEnabled = false
            builder.room = room
            builder.userInfo?.displayName = "customuser"
//            builder.room = "teamteamteamteam"
            
            builder.setFeatureFlag("add-people.enabled", withBoolean: false)
            builder.setFeatureFlag("invite.enabled", withBoolean: false)
            builder.setFeatureFlag("add-people.enabled", withBoolean: false)
            builder.setFeatureFlag("live-streaming.enabled", withBoolean: false)
            builder.setFeatureFlag("meeting-name.enabled", withBoolean: false)
            builder.setFeatureFlag("meeting-password.enabled", withBoolean: false)
            builder.setFeatureFlag("pip.enabled", withBoolean: false)
            
            builder.setFeatureFlag("recording.enabled", withBoolean: true)
            builder.setFeatureFlag("tile-view.enabled", withBoolean: true)
        }
        
        // setup view controller
        let vc = UIViewController()
        vc.modalPresentationStyle = .fullScreen
        vc.view = jitsiMeetView

        // join room and display jitsi-call
        jitsiMeetView.join(options)
        present(vc, animated: true, completion: nil)
    }
    
    fileprivate func cleanUp() {
        if(jitsiMeetView != nil) {
            dismiss(animated: true, completion: nil)
            jitsiMeetView = nil
        }
    }
}

extension ViewController: JitsiMeetViewDelegate {
    func conferenceTerminated(_ data: [AnyHashable : Any]!) {
        cleanUp()
    }
}
