//
//  ViewController.swift
//  LiveActivityEx
//
//  Created by 김지태 on 1/15/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }

    @IBAction func startButtonAction(_ sender: Any) {
        // 가능한 기기들만 실행
        if #available(iOS 16.1, *) {
            // 앱 종료할 때 같이 종료시키기 -> AppDelegate를 통해서
            LiveActivityManager.shared.isTerminateWithApp = true
            
            // Live Activity 생성
            LiveActivityManager.shared.onLiveActivity()
        }
    }
    
    @IBAction func endButtonAction(_ sender: Any) {
        // 가능한 기기들만 실행
        if #available(iOS 16.1, *) {
            // Live Activity 생성
            LiveActivityManager.shared.offLiveActivity()
        }
    }
}

