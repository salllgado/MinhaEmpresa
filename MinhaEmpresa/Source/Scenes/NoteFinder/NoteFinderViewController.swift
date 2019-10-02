//
//  NoteFinderViewController.swift
//  MinhaEmpresa
//
//  Created by Chrystian Salgado on 01/10/19.
//  Copyright © 2019 Salgado's Production. All rights reserved.
//

import UIKit
import NetworkKit

protocol NoteFinderViewModelDelegate: class {
    func loading(_ show: Bool)
    func serverResponds()
}

class NoteFinderViewController: UITableViewController {
    
    @IBOutlet weak var searchBar: MySeachBar!
    
    var viewModel: NoteFinderViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        searchBar.text = "Informe aqui o CNPJ"
        
        searchBar.formatting = .cnpj
        
        // register table view cell.
        let nib = UINib(nibName: "NoteFinderTableViewCell", bundle: Bundle(for: NoteFinderTableViewCell.self))
        tableView.register(nib, forCellReuseIdentifier: "NoteFinderTableViewCell")
        
        tableView.estimatedRowHeight = 98.0
        tableView.rowHeight = UITableView.automaticDimension
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel?.favoritedEnterprises.count ?? 0 > 0 ? 1 : 0
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.favoritedEnterprises.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NoteFinderTableViewCell") as! NoteFinderTableViewCell
        guard let _enterprise = viewModel?.favoritedEnterprises[indexPath.row] else { return UITableViewCell() }
        
        cell.delegate = self
        cell.configure(_enterprise)
        
        return cell
    }
}

extension NoteFinderViewController: NoteFinderViewModelDelegate {
    
    func loading(_ show: Bool) {
        // ...
    }
    
    func serverResponds() {
        tableView.reloadData()
    }
    
}

extension NoteFinderViewController: NoteFinderTableViewCellDelegate {
    
    func actionSelected(_ enterprise: Enterprise) {
        // ...
    }
}

extension NoteFinderViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let _text = searchBar.text else { return }
        viewModel?.requestEnterpriseData(cnpj: _text)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        let _searchBar = searchBar as! MySeachBar
        _searchBar.textDidChange()
    }
}
