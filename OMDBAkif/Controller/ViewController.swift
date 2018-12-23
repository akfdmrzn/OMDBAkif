//
//  ViewController.swift
//  OMDBAkif
//
//  Created by Akif on 22.12.2018.
//  Copyright © 2018 Akif. All rights reserved.
//

import UIKit
import Firebase
import Alamofire

class ViewController: UIViewController {

    @IBOutlet weak var btnLaunch: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if !Connectivity.isConnectedToInternet {
            self.showInternetAlert()
            self.btnLaunch.isEnabled = false
        }
        else{
            self.btnLaunch.isEnabled = true
            self.setupConfigRemote()
            self.fetchRemoteConfig()
        }
        
    }

    @IBAction func btnStartAct(_ sender: Any) {
        let filmVC = self.storyboard?.instantiateViewController(withIdentifier: "FilmsVC") as! FilmsController
        filmVC.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        filmVC.navigationItem.setHidesBackButton(true, animated: false)
        self.navigationController?.pushViewController(filmVC, animated: true)
    }
    
    func showInternetAlert(){
        let alert = UIAlertController(title: "Uyarı", message: "Lütfen İnternet Bağlantınızı Kontrol Ediniz", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Tamam", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
extension ViewController{
    func updateValueForKey(){
        let launchString = RemoteConfig.remoteConfig().configValue(forKey: "title").stringValue ?? ""
        self.btnLaunch.setTitle(launchString, for: .normal)
        
        
    }
    func setupConfigRemote(){
        let defaultValues = ["title" : "LooDos" as NSObject]
        RemoteConfig.remoteConfig().setDefaults(defaultValues as? [String : NSObject])
    }
    func fetchRemoteConfig(){
        let debugSettings = RemoteConfigSettings.init(developerModeEnabled: true)
        RemoteConfig.remoteConfig().configSettings = debugSettings
        RemoteConfig.remoteConfig().fetch(withExpirationDuration: 0) { (status, error) in
            guard error == nil else{
                return
            }
            RemoteConfig.remoteConfig().activateFetched()
            self.updateValueForKey()
        }
    }
}
class Connectivity {
    class var isConnectedToInternet:Bool {
        return NetworkReachabilityManager()!.isReachable
    }
}
