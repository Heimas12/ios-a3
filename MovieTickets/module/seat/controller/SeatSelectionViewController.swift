//
//  SeatSelectionViewController.swift
//  MovieTickets
//
//  Created by Chris on 2023/5/27.
//

import Foundation

import UIKit

class SeatSelectionViewController: UIViewController {
    private let pickerView = UIPickerView()
    
    private let rows = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J"]
    private let numbers = Array(1...15)
    
    var timeslot:TimeSlot?
    var movieInfo:MovieInfo?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "select seat"
        
        pickerView.dataSource = self
        pickerView.delegate = self
        
        view.addSubview(pickerView)
        
        pickerView.mas_remakeConstraints({ make in
            make?.left.equalTo()(20)
            make?.right.equalTo()(-20)
            make?.top.equalTo()(100)
            make?.height.equalTo()(200)
        })
        
        let selectButton = UIButton()
        selectButton.backgroundColor = KlandPageBtn_normal_color
        selectButton.setTitleColor(.white, for: .normal)
        selectButton.setTitle("select", for: .normal)
        selectButton.addTarget(self, action: #selector(selectSeat), for: .touchUpInside)
        view.addSubview(selectButton)
        selectButton.mas_remakeConstraints({make in
            make?.top.equalTo()(pickerView.mas_bottom)?.offset()(50)
            make?.centerX.equalTo()
            make?.width.equalTo()(200)
            make?.height.equalTo()(44)
        })
        
    }
}

extension SeatSelectionViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2 // 两列，分别为座位排数和座位号
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return rows.count
        } else {
            return numbers.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            return rows[row]
        } else {
            return String(numbers[row])
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let selectedRow = pickerView.selectedRow(inComponent: 0)
        let selectedNumber = pickerView.selectedRow(inComponent: 1) + 1
        
        let seat = Seat(row: rows[selectedRow], number: selectedNumber)
        print("Selected Seat: \(seat.row)-\(seat.number)")
    }
    
    @objc func selectSeat() {
        
        let row = rows[pickerView.selectedRow(inComponent: 0)]
        let number = numbers[pickerView.selectedRow(inComponent: 1)]
        
        let message = "You chose NO.\(number) in \(row) rows."
        let alertController = UIAlertController(title: "tips", message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "ok", style: .default){ action in
            // 处理确定按钮点击事件
            let vc = CheckViewController()
            vc.timeslot = self.timeslot
            vc.movieInfo = self.movieInfo
            vc.row = row
            vc.num = number
            self.navigationController?.pushViewController(vc, animated: false)
        }
        alertController.addAction(alertAction)
        present(alertController, animated: true)
        
    }
}
