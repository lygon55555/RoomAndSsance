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
    @IBOutlet var tableView: UITableView!
    @IBOutlet var tableViewHeight: NSLayoutConstraint!
    var showMonth: String?
    
    override func viewDidLoad() {
        
        let myStyle = CalendarView.Style()
        
        myStyle.cellShape                = .round
        myStyle.cellColorDefault         = UIColor.clear
        myStyle.cellColorToday           = UIColor.clear
        myStyle.cellSelectedBorderColor  = UIColor(red:136/255, green:44/255, blue:224/255, alpha:1.0)
        myStyle.cellSelectedColor        = UIColor(red:136/255, green:44/255, blue:224/255, alpha:1.0)
        myStyle.cellEventColor           = UIColor(red:1.00, green:0.63, blue:0.24, alpha:1.00)
        myStyle.headerTextColor          = UIColor.black
        myStyle.headerHeight             = 50
        
        myStyle.cellTextColorDefault     = UIColor(red: 51/255, green: 51/255, blue: 51/255, alpha: 1.0)
        myStyle.cellTextColorToday       = UIColor(red: 51/255, green: 51/255, blue: 51/255, alpha: 1.0)
        myStyle.cellTextColorWeekend     = UIColor(red: 51/255, green: 51/255, blue: 51/255, alpha: 1.0)
        myStyle.cellColorOutOfRange      = UIColor(red: 51/255, green: 51/255, blue: 51/255, alpha: 1.0)
        myStyle.cellSelectedTextColor    = UIColor.white

        myStyle.headerBackgroundColor    = UIColor.white
        myStyle.weekdaysBackgroundColor  = UIColor.white
        myStyle.firstWeekday             = .sunday
        myStyle.locale                   = Locale(identifier: "ko_KR")

        myStyle.cellFont = UIFont.systemFont(ofSize: 16, weight: .heavy)
        myStyle.headerFont = UIFont.systemFont(ofSize: 17, weight: .bold)
        myStyle.weekdaysFont = UIFont.systemFont(ofSize: 16, weight: .heavy)

        calendarView.style = myStyle
        
        calendarView.dataSource = self
        calendarView.delegate = self
        calendarView.direction = .horizontal
        calendarView.multipleSelectionEnable = false
        calendarView.marksWeekends = true
        
        let today = Date()
        let thisMonth = DateFormatters.numberMonthFormatter.string(from: today)

        if thisMonth == showMonth {
            self.calendarView.selectDate(today)
        }
        else {
        }
        
        tableView.isScrollEnabled = false
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
    }
    
    override func viewDidAppear(_ animated: Bool) {
        tableViewHeight.constant = tableView.contentSize.height
    }
}

extension MonthlyCalendarViewController: CalendarViewDataSource {
    func headerString(_ date: Date) -> String? {
        return ""
    }
    
    func startDate() -> Date {
        let today = Date()
        let thisMonth = today.month
        
        var dateComponents = DateComponents()
        dateComponents.month = Int(showMonth!)! - thisMonth
        
        let startDate = self.calendarView.calendar.date(byAdding: dateComponents, to: today)!
        return startDate
    }

    func endDate() -> Date {
        let today = Date()
        let thisMonth = today.month
        
        var dateComponents = DateComponents()
        dateComponents.month = Int(showMonth!)! - thisMonth
        
        let endDate = self.calendarView.calendar.date(byAdding: dateComponents, to: today)!
        return endDate
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

extension MonthlyCalendarViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MonthlyTableCell", for: indexPath) as! MonthlyTableViewCell
        
        cell.classTextView.sizeToFit()
        cell.backView.layer.cornerRadius = 12
        cell.backView.layer.backgroundColor = UIColor(red: 0.945, green: 0.953, blue: 0.973, alpha: 1).cgColor
        cell.classTextView.textContainer.lineFragmentPadding = 0
        
        return cell
    }
}

extension Date {
    var day: Int {
        return Calendar.current.component(.day, from: self)
    }
    
    var month: Int {
        return Calendar.current.component(.month, from: self)
    }
    
    var year: Int {
        return Calendar.current.component(.year, from: self)
    }
}
