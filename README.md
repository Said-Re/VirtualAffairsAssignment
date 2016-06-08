# VirtualAffairsAssignment
VirtualAffairs Assignment

The project is splitted in 2 targets:
-The first target contains the classes related to the exercise 1.
-The second target contains the classes related to the exercise 2 although it uses the exercise 1 classes as well.

##Solution choosen in the Exercise 1:

-ViewController.swift: This class contains the schedule view. It's a UITableView with 3 differents cells. I choosed this option because I think it's the best option for presenting the required design: 
* ChooseDateTableViewCell -> Contains the UIDatePicker
* BeginDateTableViewCell -> Contains 2 labes: Begin and the date
* EndDateTableViewCell -> Contains 2 labels: End and the date

When the user changes the UIDatePicker, the tableView reload the content with the new dates for the begin and the end.
And finally, there is a NSDate extension for getting the String format of the date. 

##Solution choosen in the Exercise 2:

In this exercise, I reused the classes from the previous exercise and I added a new classes for meeting the requirments.

-OverviewViewController.swift: This class contains the list of schedules. It's a UITableView with 1 kind of cell. I choosed this option because I think it's the best option for presenting the required design: 
* ScheduleItemTableViewCell -> Contains 4 labes: Begin, its date, End and its date

When the user adds a new schedule, the app goes to the schedule view from the first exercise, and once it goes back, it sends a notification to OverviewViewController with the new schedule and reloads the tableview.
The same process when the user taps in any schedule from the list.

And finally, there are 2 extensions: 
- ViewController: Adds a method for setting the date in the view.
- String: Returns a NSDate from a string format

