//
//  TimeSlotCellDelegate.swift
//  MovieTickets
//
//  Created by Chris on 2023/5/27.
//

import Foundation

protocol TimeSlotCellDelegate: AnyObject {
    func buyTickets(in cell: TimeSlotCell)

}
