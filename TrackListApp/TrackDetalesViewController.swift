//
//  TrackDetalesViewController.swift
//  TrackListApp
//
//  Created by Gleb Zadonskiy on 04.11.2020.
//

import UIKit

class TrackDetalesViewController: UIViewController {

    @IBOutlet weak var artCoverImageView: UIImageView!
    @IBOutlet weak var trackLabel: UILabel!

    var track:Track!

    override func viewDidLoad() {
        super.viewDidLoad()
        artCoverImageView.image = UIImage(named: track.track)
        trackLabel.text = track.track
    }
}
