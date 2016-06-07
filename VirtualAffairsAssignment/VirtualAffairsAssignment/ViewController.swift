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

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    private var beginDate : String!
    private var endDate : String!
    private var datePicker : NSDate!
    
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
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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
        
        return cell
    }

    // MARK: - IBAction methods
    
    @IBAction func clearDateFromView(sender: UIBarButtonItem) {
        
    }

}

