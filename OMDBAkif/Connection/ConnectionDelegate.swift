//
//  ConnectionDelegate.swift
//  Swift3ServiceConnection
//
//  Created by Mac on 2.12.2016.
//  Copyright © 2016 Mac. All rights reserved.
//

import Foundation
import Alamofire

protocol ConnectionDelegate : class{
    
    func getError(errMessage : String)
    func sendDataToService(filterString : String)
    func getDataFromService(jsonData : Data)

    
}
