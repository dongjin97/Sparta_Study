//
//  RandomVideoViewController.swift
//  IndividualTask
//
//  Created by 원동진 on 2/1/24.
//

import UIKit
import AVKit
class RandomVideoViewController: UIViewController {
    let playerController = AVPlayerViewController()
    override func viewDidLoad() {
        super.viewDidLoad()
        playMovie()
        
    }
    
}
extension RandomVideoViewController{
    private func playMovie(){
        VideoManager.shared.getVideoUrl { movie in
            DispatchQueue.main.async { [self] in
                let player = AVPlayer(url: URL(string: movie.first!.videoUrl)! as URL)
                self.playerController.player = player
                self.present(playerController, animated: true) {
                    player.play() // present 되면, 비디오 재생
                }
            }
        }
    }
}
