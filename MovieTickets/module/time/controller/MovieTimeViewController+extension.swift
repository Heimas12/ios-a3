//
//  MovieTimeViewController+extension.swift
//  MovieTickets
//
//  Created by Chris on 2023/5/26.
//

import Foundation

extension MovieTimeViewController: UITableViewDataSource, UITableViewDelegate,TimeSlotCellDelegate {
    func buyTickets(in cell: TimeSlotCell) {
        guard let indexPath = tableView.indexPath(for: cell) else {
            return
        }
        let timeSlot = timeSlots[indexPath.section][indexPath.row]
        let vc = SeatSelectionViewController()
        vc.timeslot = timeSlot
        vc.movieInfo = movieInfo
        self.navigationController?.pushViewController(vc, animated: false)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return dates.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return timeSlots[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TimeSlotCell", for: indexPath) as! TimeSlotCell
        let timeSlot = timeSlots[indexPath.section][indexPath.row]
        cell.configure(with: timeSlot)
        cell.selectionStyle = .none
        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.width, height: 40))
        headerView.backgroundColor = .lightGray
        
        let label = UILabel(frame: CGRect(x: 16, y: 0, width: tableView.bounds.width - 32, height: 40))
        label.text = dates[section]
        label.textColor = .black
        headerView.addSubview(label)
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
