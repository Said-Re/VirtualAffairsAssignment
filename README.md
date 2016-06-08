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

