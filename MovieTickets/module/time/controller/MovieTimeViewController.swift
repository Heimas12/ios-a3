//
//  MovieTimeViewController.swift
//  MovieTickets
//
// 
//

import Foundation

class MovieTimeViewController: UIViewController {
   
    // Define data source
    var dates: [String] = []
    var timeSlots: [[TimeSlot]] = []
    
    var tableView: UITableView!
    var movieInfo:MovieInfo = MovieInfo(imageName: "", title: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView = UITableView()
        self.view.addSubview(tableView)
        tableView.mas_remakeConstraints({ make in
            make?.edges.equalTo()
        })
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(TimeSlotCell.self, forCellReuseIdentifier: "TimeSlotCell")
        
        setupTimeSlots()
    }
    
    // Calculate date and time period based on current time
    private func setupTimeSlots() {
        let today = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        for i in 0..<3 {
            let date = Calendar.current.date(byAdding: .day, value: i, to: today)!
            let dateString = dateFormatter.string(from: date)
            dates.append(dateString)
            
            var slots: [TimeSlot] = []
            let currentTime = Date()
            
            for j in 0..<3 {
                let startTime = Calendar.current.date(byAdding: .hour, value: j * 2, to: date)!
                let endTime = Calendar.current.date(byAdding: .hour, value: (j * 2) + 2, to: date)!
                
                // Block elapsed time period
                if startTime > currentTime {
                    let timeSlot = TimeSlot(date: dateString,
                        startTime: formatTime(startTime),
                                            endTime: formatTime(endTime),
                                            hall: "Hall \(j + 1)",
                                            description: "描述\(j + 1)",
                                            price: Double(j + 1) * 10)
                    slots.append(timeSlot)
                }
            }
            
            timeSlots.append(slots)
        }
    }
    
    // format time
    private func formatTime(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        return dateFormatter.string(from: date)
    }
}
