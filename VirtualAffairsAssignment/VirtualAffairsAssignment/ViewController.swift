//
//  ViewController.swift
//  VirtualAffairsAssignment
//
//  Created by Said Rehouni on 6/6/16.
//  Copyright © 2016 Said Rehouni. All rights reserved.
//

import UIKit

private let kBeginDateTableViewCellIdentifier = "beginDateTableViewCellIdentifier"
private let kChooseDateTableViewCellIdentifier = "chooseDateTableViewCellIdentifier"
private let kEndDateTableViewCellIdentifier = "endDateTableViewCellIdentifier"

private let kBeginDateHeight = 80
private let kChooseDateHeight = 130
private let kEndDateHeight = 80

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, TableViewInterface {

    @IBOutlet weak var tableView: UITableView!
    
    var beginDate : String!
    var endDate : String!
    var datePicker : NSDate!
    
    let items = [kBeginDateTableViewCellIdentifier, kChooseDateTableViewCellIdentifier, kEndDateTableViewCellIdentifier]
    let cellHeight = [kBeginDateHeight, kChooseDateHeight, kEndDateHeight]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.registerNib(UINib(nibName: "BeginDateTableViewCell", bundle: nil), forCellReuseIdentifier: kBeginDateTableViewCellIdentifier)
        tableView.registerNib(UINib(nibName: "ChooseDateTableViewCell", bundle: nil), forCellReuseIdentifier: kChooseDateTableViewCellIdentifier)
        tableView.registerNib(UINib(nibName: "EndDateTableViewCell", bundle: nil), forCellReuseIdentifier: kEndDateTableViewCellIdentifier)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.scrollEnabled = false
        
        if let _ = navigationController {
            navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Clear", style: .Plain, target: self, action: #selector(ViewController.clearDateFromView(_:)))
            navigationItem.title = "Schedule"
        }
        
        setInitialValues()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setInitialValues() {
        if datePicker == nil || beginDate == nil || endDate == nil {
            datePicker = NSDate()
            beginDate = "Today"
            endDate = datePicker.formatDateAfterWeek()
        }
    }
    
    //MARK: - TableViewInterface
    
    func updateData(date: NSDate) {
        datePicker = date
        if date == NSDate() {
            beginDate = "Today"
        } else {
            beginDate = date.formatDate()
        }
        
        endDate = date.formatDateAfterWeek()
        tableView.reloadData()
    }
    
    // MARK: - UITableView delegate
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return CGFloat(cellHeight[indexPath.row])
    }
    
    // MARK: - UITableView data source
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(items[indexPath.row], forIndexPath: indexPath)
        
        if items[indexPath.row] == kChooseDateTableViewCellIdentifier {
            (cell as! ChooseDateTableViewCell).tableViewInterface = self
            
            (cell as! ChooseDateTableViewCell).chooseDatePicker.date = datePicker
            
        } else if items[indexPath.row] == kBeginDateTableViewCellIdentifier {
            (cell as! BeginDateTableViewCell).dateLabel.text = beginDate
        } else {
            (cell as! EndDateTableViewCell).dateEndLabel.text = endDate
        }
        
        return cell
    }

    // MARK: - IBAction methods
    
    @IBAction func clearDateFromView(sender: UIBarButtonItem) {
        datePicker = NSDate()
        beginDate = "Today"
        endDate = datePicker.formatDateAfterWeek()
        tableView.reloadData()
    }

}