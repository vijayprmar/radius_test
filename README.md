# Property List 

From the Given Document here I have Listed Property List and Its option in UITableview, I used URL Session for API calling and Codable classis for JSON Paring

1) APIServices : List of base urls & API End Points
2) HttpUtility : In HttpUtility class I have added method for "GET" API calling (We can add multiple methods based on API type (GET/POST/PUT/DELETE)).  we will crete variable of this class so we can use this get method
3) PropertyListModel : Created Codables Model calsses to store API Data
4) Exclusion : This structure will store the list of excusion data and with the help of we can check exclusion data conditions
5) PropertyListViewModel : Its View Model calss of Property List in which all the Operations related to Property List
6) PropertyListController : In this Class it Intracts with View and Model and related Operations with the help of view model object
7) PropertyListTableViewCell : List view cell used for header title and options
8) UIViewController+Extention :  In this file created extension of UIViewcontroller & UIView for Activity Indicator and Global Alert view



