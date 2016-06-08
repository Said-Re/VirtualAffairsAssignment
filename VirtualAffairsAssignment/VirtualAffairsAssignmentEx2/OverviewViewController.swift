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

class OverviewViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    private var beginDate : String!
    private var endDate : String!
    private var datePicker : NSDate!
    
    var scheduleItems : [ScheduleItemModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.registerNib(UINib(nibName: "ScheduleItemTableViewCell", bundle: nil), forCellReuseIdentifier: kScheduleItemHeightTableViewCellIdentifier)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.allowsMultipleSelectionDuringEditing = false
    
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: #selector(OverviewViewController.addNewSchedueItem))
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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
        let cell = tableView.dequeueReusableCellWithIdentifier(kScheduleItemHeightTableViewCellIdentifier, forIndexPath: indexPath)
        
        
        return cell
    }
    
}