//
//  RequestModelFilm.swift
//  OMDBAkif
//
//  Created by Akif on 23.12.2018.
//  Copyright © 2018 Akif. All rights reserved.
//
import UIKit

protocol  FilmDelegate : class{
    func getDataSuccesfully(message : String,responseData : ResponseModelFilm)
    func getDataError(message : String)
}
class RequestModelFilm: ConnectionDelegate {
    
    var postConnection = PostConnection()
    var exchangeDelegate : FilmDelegate?
    
    init() {
        self.postConnection.delegate = self
    }
    
    func sendDataToService(filterString : String){
        
        let data = [
            "" : ""
            ] as [String : Any]
        postConnection.makePostConnection(url: "\(baseHttpLink)t=\(filterString)&\(apiKey)" , postParams: data, httpMethod: .get)
    }
    
    func getDataFromService(jsonData : Data){
        let model = try? JSONDecoder().decode(ResponseModelFilm.self, from: jsonData)
        if let boolResponse : NSString = model!.response! as! NSString{
            if boolResponse.boolValue{
                self.exchangeDelegate?.getDataSuccesfully(message: "", responseData: model!)
            }
            else{
                self.exchangeDelegate?.getDataError(message: "Arama kriterlerinize göre film bulunamadı")
            }
        }
    }
    func getError(errMessage: String) {
      self.exchangeDelegate?.getDataError(message: "Arama kriterlerinize göre film bulunamadı")
    }
}


