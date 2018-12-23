//
//  FilmsController.swift
//  OMDBAkif
//
//  Created by Akif on 23.12.2018.
//  Copyright © 2018 Akif. All rights reserved.
//

import UIKit
import Firebase


class FilmsController: BaseViewController {

    @IBOutlet weak var labelInfoData: UILabel!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableViewFilms: UITableView!
    
    var responseModelFilms : ResponseModelFilm?
    var requestModelFilm = RequestModelFilm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setLeftBarButton(nil, animated: true)
        self.navigationItem.title = "LooDos"
        self.labelInfoData.text = "Lütfen Arama Yapınız"
        self.tableViewFilms.isHidden = true
        self.searchBar.delegate = self
        
        
    }
}
extension FilmsController : FilmDelegate{
    func getDataSuccesfully(message: String, responseData: ResponseModelFilm) {
            self.indicatorShow(status: false)
            self.tableViewFilms.isHidden = false
            self.responseModelFilms = responseData
            tableViewFilms?.register(FilmDetailTableViewCell.nib, forCellReuseIdentifier: FilmDetailTableViewCell.identifier)
            self.tableViewFilms.delegate = self
            self.tableViewFilms.dataSource = self
            self.tableViewFilms.reloadData()
    }
    func getDataError(message: String) {
        self.indicatorShow(status: false)
        self.labelInfoData.text = message
        self.tableViewFilms.isHidden = true
    }
    
}
extension FilmsController : UISearchBarDelegate{
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
            self.indicatorShow(status: true)
            self.requestModelFilm.exchangeDelegate = self
            self.requestModelFilm.sendDataToService(filterString: searchBar.text!)
//            self.indicatorShow(status: true)
    }
}
extension FilmsController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.tableViewFilms.frame.height * 0.2
    }
}
extension FilmsController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FilmDetailTableViewCell.identifier, for: indexPath) as? FilmDetailTableViewCell
        cell?.configureWithItem(data: self.responseModelFilms!)
        return cell!
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func numberOfSections(in tableView: UITableView) -> Int {
       return 1
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let filmDetailVC = self.storyboard?.instantiateViewController(withIdentifier: "FilmDetailVC") as! FilmDetailViewController
        filmDetailVC.dataResponseDetailFilm = self.responseModelFilms
        self.navigationController?.pushViewController(filmDetailVC, animated: true)
    }
}

