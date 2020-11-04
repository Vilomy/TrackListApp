//
//  TableViewController.swift
//  TrackListApp
//
//  Created by Gleb Zadonskiy on 04.11.2020.
//

import UIKit

class TrackListViewController: UITableViewController {
    
    var trackList = Track.getTracklist()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 80
        navigationItem.leftBarButtonItem = editButtonItem
            
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let trackDetaileVC = segue.destination as! TrackDetalesViewController
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        trackDetaileVC.track = trackList[indexPath.row]
    }
}

// MARK: - Table view data source
extension TrackListViewController {
    
    override func tableView(_ tableView: UITableView,
                            numberOfRowsInSection section: Int) -> Int {
        trackList.count
    }
    
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "trackName", for: indexPath )
        let track = trackList[indexPath.row]
        cell.textLabel?.text = track.song
        cell.textLabel?.numberOfLines = 0
        cell.detailTextLabel?.text = track.artist
        cell.imageView?.image = UIImage(named: track.track)
        return cell
    }
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        .none
    }
    override func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        false
    }

    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
       let currentTrack = trackList.remove(at: sourceIndexPath.row)
        trackList.insert(currentTrack, at: destinationIndexPath.row)
    }
}


