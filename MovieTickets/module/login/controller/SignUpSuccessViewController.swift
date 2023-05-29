//
//  SignUpSuccessViewController.swift
//  MovieTickets
//
//  Created by Chris on 2023/5/26.
//

import UIKit

class SignUpSuccessViewController: UIViewController {
    typealias loginCloser = () -> ()
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    var showPage: loginCloser?
    var desc:String?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.descLabel.text = desc
        self.nextButton?.layer.cornerRadius = 5
        self.nextButton?.layer.masksToBounds = true
    }

    @IBAction func next(_ sender: Any) {
        self.showPage!()
        self.dismiss(animated: true)
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
