//
//  FilmDetailViewController.swift
//  OMDBAkif
//
//  Created by Akif on 23.12.2018.
//  Copyright © 2018 Akif. All rights reserved.
//

import UIKit
import SDWebImage
import Firebase

class FilmDetailViewController: UIViewController {
    @IBOutlet weak var imageViewFilm: UIImageView!
    @IBOutlet weak var tableViewDetail: UITableView!
    var dataResponseDetailFilm : ResponseModelFilm?
    var filmDetailValues : [String] = []
    var filmDetailKeys : [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewDetail?.register(FilmDetailKeyTableViewCell.nib, forCellReuseIdentifier: FilmDetailKeyTableViewCell.identifier)
        self.tableViewDetail.delegate = self
        self.tableViewDetail.dataSource = self
        self.setDataKeyAndValue()
    }
    func setDataKeyAndValue(){
        
        let title = "Title"
        let genre = "Genre"
        let year = "Year"
        let rated = "Rated"
        let released = "String"
        let runtime = "Runtime"
        let director = "Director"
        let write = "Writer"
        let actors = "Actors"
        let plot = "Plot"
        let language = "Language"
        let country = "Country"
        self.logEventForFirebase(title: self.dataResponseDetailFilm!.title!)
        self.filmDetailKeys = [title,genre,year,rated,released,runtime,director,write,actors,plot,language,country]
        self.filmDetailValues = [self.dataResponseDetailFilm!.title!,
                                 self.dataResponseDetailFilm!.genre!,
        self.dataResponseDetailFilm!.year!,
        self.dataResponseDetailFilm!.rated!,
        self.dataResponseDetailFilm!.released!,
        self.dataResponseDetailFilm!.runtime!,
        self.dataResponseDetailFilm!.director!,
        self.dataResponseDetailFilm!.writer!,
        self.dataResponseDetailFilm!.actors!,
        self.dataResponseDetailFilm!.plot!,
        self.dataResponseDetailFilm!.language!,
        self.dataResponseDetailFilm!.country!]
        
        if self.dataResponseDetailFilm?.poster! != nil{
            DispatchQueue.main.async {
                self.imageViewFilm.sd_setImage(with: URL(string: self.dataResponseDetailFilm!.poster!), placeholderImage: #imageLiteral(resourceName: "arrow-point-to-right"))
            }
        }
        self.tableViewDetail.reloadData()
        
    }
    func logEventForFirebase(title : String){
        Analytics.logEvent(AnalyticsEventSelectContent, parameters: [
            AnalyticsParameterItemID: "id-\(title)",
            AnalyticsParameterItemName: title,
            AnalyticsParameterContentType: "cont"
            ])
    }
}

extension FilmDetailViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.tableViewDetail.frame.height * 0.1
    }
}
extension FilmDetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FilmDetailKeyTableViewCell.identifier, for: indexPath) as? FilmDetailKeyTableViewCell
        cell?.configureWithItem(keys: self.filmDetailKeys[indexPath.row], value: self.filmDetailValues[indexPath.row])
        return cell!
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.filmDetailKeys.count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
    }
}
