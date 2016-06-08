//
//  ViewController.swift
//  VirtualAffairsAssignmentEx2
//
//  Created by Said Rehouni on 6/6/16.
//  Copyright © 2016 Said Rehouni. All rights reserved.
//

import UIKit

private let kScheduleItemHeightTableViewCellIdentifier = "scheduleItemTableViewCellIdentifier"
private let kscheduleItemHeight = 80

let kUpdateScheduleNotification = "updateScheduleNotification"

class OverviewViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    private var selectedIndex : Int?
    var scheduleItems : [ScheduleItemModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.registerNib(UINib(nibName: "ScheduleItemTableViewCell", bundle: nil), forCellReuseIdentifier: kScheduleItemHeightTableViewCellIdentifier)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.allowsMultipleSelectionDuringEditing = false
    
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: #selector(OverviewViewController.addNewSchedueItem))
        navigationItem.title = "Overview"
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(OverviewViewController.updateScheduleList(_:)), name: kUpdateScheduleNotification, object: nil)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func updateScheduleList(notification: NSNotification) {
        guard let userInfo = notification.userInfo,
            let beginDate = userInfo["beginDate"] as? String,
            let endDate = userInfo["endDate"] as? String else {
            return
        }
        
        let scheduleItem = ScheduleItemModel(beginDate: beginDate, endDate: endDate)
        if let _ = selectedIndex {
            scheduleItems[selectedIndex!] = scheduleItem
        } else {
            scheduleItems.append(scheduleItem)
        }
        
        selectedIndex = nil
        tableView.reloadData()
    }
    
    func addNewSchedueItem() {
        let viewController = ViewController(nibName: "ViewController", bundle: nil)
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    // MARK: - UITableView delegate
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return CGFloat(kscheduleItemHeight)
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        selectedIndex = indexPath.row
        
        let viewController = ViewController(nibName: "ViewController", bundle: nil)
        navigationController?.pushViewController(viewController, animated: true)
        viewController.setSchedule(scheduleItems[indexPath.row])
    }
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    func tableView(tableView: UITableView, commitEditingStyle
                editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            scheduleItems.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
        }
    }
    
    // MARK: - UITableView data source
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return scheduleItems.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(kScheduleItemHeightTableViewCellIdentifier, forIndexPath: indexPath) as! ScheduleItemTableViewCell
        cell.setModelInView(scheduleItems[indexPath.row])
        
        return cell
    }
    
}