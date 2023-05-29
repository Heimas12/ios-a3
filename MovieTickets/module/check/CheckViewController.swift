//
//  CheckViewController.swift
//  MovieTickets
//
//  Created by Chris on 2023/5/27.
//

import UIKit

class CheckViewController: UIViewController {
    
    var timeslot:TimeSlot?
    var movieInfo:MovieInfo?
    var row:String?
    var num:Int?

    @IBOutlet weak var payButton: UIButton!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.imgView.image = UIImage.init(named: movieInfo?.imageName ?? "")
        self.titleLabel.text = movieInfo?.title
        self.timeLabel.text = "\(timeslot?.date ?? "") \(timeslot?.startTime ?? "" ) ~ \(timeslot?.endTime ?? "")"
        self.priceLabel.text = "$\(timeslot?.price ?? 0)"

    }

    @IBAction func pay(_ sender: Any) {
        let helper = DBHelper.shared
        helper.insertHistoryData(timeslot: timeslot!, movieInfo: movieInfo!, row: row!, num: num!)
        let successVC = SignUpSuccessViewController()
        successVC.desc = "Thank you for your reservation. The movie ticket will be sent to your email."
        successVC.showPage = {() -> () in
            self.navigationController?.popToRootViewController(animated: true)
        }
        successVC.modalPresentationStyle = .fullScreen
        present(successVC, animated: true, completion: nil)
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
