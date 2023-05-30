//
//  SplashViewController.swift
//  MovieTickets
//
//
//

import UIKit

class SplashViewController: UIViewController {

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var goBtn: UIButton!
    typealias loginCloser = () -> ()

    var showPage: loginCloser?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.goBtn.layer.cornerRadius = 5
        self.goBtn.layer.masksToBounds = true
        let randomInt = Int.random(in: 1...16)
        self.imgView.image = UIImage(named: "\(randomInt)")
        // Do any additional setup after loading the view.
    }

    @IBAction func goClick(_ sender: Any) {
        self.showPage!()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
