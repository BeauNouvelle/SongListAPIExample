//
//  ViewController.swift
//  WebAPI
//
//  Created by Beau Nouvelle on 21/3/2022.
//

import UIKit
import Kingfisher

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    let networker = Networker()

    var songs: [Song] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        networker.loadSongs(completion: loadSongHandler)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CELL")
    }

    func loadSongHandler(trackList: TrackList) {
        DispatchQueue.main.async {
            self.songs = trackList.tracks
            self.tableView.reloadData()
        }
    }

}

extension ViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CELL", for: indexPath)
        let song = songs[indexPath.row]
        cell.textLabel?.text = song.name
        cell.imageView?.kf.setImage(with: song.img)
        return cell
    }


}

extension ViewController: UITableViewDelegate {

}
