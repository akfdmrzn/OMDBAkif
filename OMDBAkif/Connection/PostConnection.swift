//
//  PostConnection.swift
//  Swift3ServiceConnection
//
//  Created by Mac on 2.12.2016.
//  Copyright © 2016 Mac. All rights reserved.
//

import Foundation
import Alamofire

class PostConnection
{
    
    var delegate : ConnectionDelegate?
    
    func makePostConnection( url: String ,postParams : Parameters, httpMethod : HTTPMethod)
    {
       
        
        Alamofire.request(url, method: .get)
            .responseJSON(completionHandler: { (response) in
                switch response.result {
                case .success(let retrivedResult):
                  
                    break
                case .failure(let errorGiven):
                    self.delegate?.getError(errMessage: "error")
                    break
                }
                
                if response.result.value != nil {
                    self.delegate?.getDataFromService(jsonData:  response.data!)
                }                
            })
        
            
        }
        
    }
    
    

