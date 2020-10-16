//
//  ListTableViewController.swift
//  AppleSongs
//
//  Created by Petryk Dima on 03.09.2020.
//  Copyright © 2020 Petryk. All rights reserved.
//

import UIKit
import Nuke

class ListTableViewController: UITableViewController, ListTableViewControllerProtocol, Xibbed {

    internal weak var coordinator: ListCoordinator?
    var viewModel: ListViewModelType = ListViewModel()
    let refreshControlIndicator = UIRefreshControl()

    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
        fetchSongs()
        
    }

    // MARK: - Fetch Content
    @objc private func fetchSongs() {
        viewModel.fetchSongs()
    }
}

extension ListTableViewController {
    
    private func reloadTableView() {
        tableView.reloadData()
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getSongs().count
    }

    // MARK: - Table view Delegate
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let song = viewModel.getSong(for: indexPath .row) else { return UITableViewCell()}
        if let cell = tableView.dequeueReusableCell(withIdentifier: SongListCell.reuseIdentifier(),
                                                    for: indexPath) as? SongListCell {
            
            cell.setupData(song: song)
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let song = viewModel.getSongs()[indexPath.row] {
            coordinator?.openDetailSong(song: song)
        }
    }
}

extension ListTableViewController {
    
    private func setup() {
        setupUI()
        setupBindings()
    }
    
    private func setupUI() {
        registerCell()
        tableView.refreshControl = refreshControlIndicator
        refreshControlIndicator.addTarget(self, action: #selector(fetchSongs), for: .valueChanged)
    }
    
    private func setupBindings() {
        viewModel.songsArray.bind { [weak self] _ in
            self?.reloadTableView()
            self?.refreshControlIndicator.endRefreshing()
        }
    }
    
    private func registerCell() {
        tableView.register(SongListCell.uinib(), forCellReuseIdentifier: SongListCell.reuseIdentifier())
    }

}
