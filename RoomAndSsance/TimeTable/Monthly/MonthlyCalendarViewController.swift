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
        calendarView.style.cellShape                = .round
        calendarView.style.cellColorDefault         = UIColor.clear
        calendarView.style.cellColorToday           = UIColor.clear
        calendarView.style.cellSelectedBorderColor  = UIColor(red:136/255, green:44/255, blue:224/255, alpha:1.0)
        calendarView.style.cellSelectedColor        = UIColor(red:136/255, green:44/255, blue:224/255, alpha:1.0)
        calendarView.style.cellEventColor           = UIColor(red:1.00, green:0.63, blue:0.24, alpha:1.00)
        calendarView.style.headerTextColor          = UIColor.black
        calendarView.style.headerHeight             = 50

        calendarView.style.cellTextColorDefault     = UIColor(red: 51/255, green: 51/255, blue: 51/255, alpha: 1.0)
        calendarView.style.cellTextColorToday       = UIColor(red: 51/255, green: 51/255, blue: 51/255, alpha: 1.0)
        calendarView.style.cellTextColorWeekend     = UIColor(red: 51/255, green: 51/255, blue: 51/255, alpha: 1.0)
        calendarView.style.cellColorOutOfRange      = UIColor(red: 51/255, green: 51/255, blue: 51/255, alpha: 0.3)
        calendarView.style.cellSelectedTextColor    = UIColor.white

        calendarView.style.headerBackgroundColor    = UIColor.white
        calendarView.style.weekdaysBackgroundColor  = UIColor.white
        calendarView.style.firstWeekday             = .sunday
        calendarView.style.locale                   = Locale(identifier: "ko_KR")

        calendarView.style.cellFont = UIFont.systemFont(ofSize: 16, weight: .heavy)
        calendarView.style.headerFont = UIFont.systemFont(ofSize: 17, weight: .bold)
        calendarView.style.weekdaysFont = UIFont.systemFont(ofSize: 16, weight: .heavy)
        
        calendarView.dataSource = self
        calendarView.delegate = self
        calendarView.direction = .horizontal
        calendarView.multipleSelectionEnable = false
        calendarView.marksWeekends = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let today = Date()
//        self.calendarView.setDisplayDate(today)
        self.calendarView.selectDate(today)
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
