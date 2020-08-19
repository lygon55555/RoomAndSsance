//
//  MonthlyCalendarViewController.swift
//  RoomAndSsance
//
//  Created by Yonghyun on 2020/08/19.
//  Copyright © 2020 Yonghyun. All rights reserved.
//

import Foundation
import UIKit
import KDCalendar

class MonthlyCalendarViewController: UIViewController {
    
    @IBOutlet var calendarView: CalendarView!
    
    override func viewDidLoad() {
        let style = CalendarView.Style()
        
        style.cellShape                = .bevel(8.0)
        style.cellColorDefault         = UIColor.clear
        style.cellColorToday           = UIColor(red:196/255, green:217/255, blue:254/255, alpha:1.00)
        style.cellSelectedBorderColor  = UIColor(red:252/255, green:73/255, blue:20/255, alpha:0.5)
        style.cellSelectedColor        = UIColor(red:252/255, green:73/255, blue:20/255, alpha:0.5)
        style.cellEventColor           = UIColor(red:1.00, green:0.63, blue:0.24, alpha:1.00)
        style.headerTextColor          = UIColor.gray

        style.cellTextColorDefault     = UIColor(red: 160/255, green: 169/255, blue: 186/255, alpha: 1.0)
        style.cellTextColorToday       = UIColor.black
        style.cellTextColorWeekend     = UIColor(red: 167/255, green: 175/255, blue: 191/255, alpha: 1.0)
        style.cellColorOutOfRange      = UIColor(red: 249/255, green: 226/255, blue: 212/255, alpha: 1.0)

        style.headerBackgroundColor    = UIColor.white
        style.weekdaysBackgroundColor  = UIColor.white
        style.firstWeekday             = .sunday
        style.locale                   = Locale(identifier: "ko_KR")

        style.cellFont = UIFont(name: "Helvetica", size: 15.0) ?? UIFont.systemFont(ofSize: 15.0)
        style.headerFont = UIFont(name: "Helvetica", size: 20.0) ?? UIFont.systemFont(ofSize: 20.0)
        style.weekdaysFont = UIFont(name: "Helvetica", size: 20.0) ?? UIFont.systemFont(ofSize: 20.0)

        calendarView.style = style
        calendarView.dataSource = self
        calendarView.delegate = self
        calendarView.direction = .horizontal
        calendarView.multipleSelectionEnable = false
        calendarView.marksWeekends = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let today = Date()
        self.calendarView.setDisplayDate(today)
    }
}

extension MonthlyCalendarViewController: CalendarViewDataSource {
    func headerString(_ date: Date) -> String? {
        return ""
    }
    
    func startDate() -> Date {
        var dateComponents = DateComponents()
        dateComponents.month = 0
        let today = Date()
        let threeMonthsAgo = self.calendarView.calendar.date(byAdding: dateComponents, to: today)!

        return threeMonthsAgo
    }

    func endDate() -> Date {
        var dateComponents = DateComponents()
        dateComponents.month = 0
        let today = Date()
        let twoYearsFromNow = self.calendarView.calendar.date(byAdding: dateComponents, to: today)!

        return twoYearsFromNow
    }
}

extension MonthlyCalendarViewController: CalendarViewDelegate {
    func calendar(_ calendar: CalendarView, didScrollToMonth date: Date) {
    }
    
    func calendar(_ calendar: CalendarView, didDeselectDate date: Date) {
    }
    
    func calendar(_ calendar: CalendarView, canSelectDate date: Date) -> Bool {
        return true
    }
    
    func calendar(_ calendar: CalendarView, didSelectDate date : Date, withEvents events: [CalendarEvent]) {
        print("Did Select: \(date) with \(events.count) events")
        
        for event in events {
            print("\t\"\(event.title)\" - Starting at:\(event.startDate)")
        }
    }

    func calendar(_ calendar: CalendarView, didLongPressDate date : Date, withEvents events: [CalendarEvent]?) {
    }
}
