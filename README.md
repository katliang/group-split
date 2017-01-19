# GroupSplit

GroupSplit allows users to easily split group expenses.

The deployed project can be found here: https://tranquil-castle-84286.herokuapp.com/

##Contents
* [Technologies](#technologies)
* [Features](#features)

## <a name="technologies"></a>Technologies

Backend: Ruby, Ruby on Rails, PostgreSQL<br/>
Frontend: HTML5, CSS, Bootstrap<br/>

## <a name="features"></a>Features

![alt tag](http://g.recordit.co/LyWEijMPJC.gif)

This Rails application has a home page with a form for new users to sign up and a button for returning users to log in.<br>
Passwords are hashed with Bcrypt before storing in the PostgreSQL database.

![alt tag](http://g.recordit.co/JPWXbrtTId.gif)

After the user logs in, a dashboard utilizing 2 Active Record queries displays the user's "In Progress" and "Reconciled" reports. The user can create a new report by clicking on the "Create New Report" button, entering a name for the report, and clicking "Submit".

![alt tag](http://g.recordit.co/H0drioaWHi.gif)

An "In Progress" report's name can be renamed by clicking on the "Edit Name" button, entering a new name for the report, and clicking "Submit".

![alt tag](http://g.recordit.co/TFRbo1J8Sm.gif)

The user who creates the report will automatically be added to that report. The user can add other people to share in that group's expense report by clicking on the "Add New Person" button. A person can be removed by clicking on the trash icon.

![alt tag](http://g.recordit.co/EMl55uq43u.gif)

Expenses can be added by clicking on the "Add New Expense" button, entering the vendor, date, amount, selecting the person who paid from the dropdown menu and clicking "Submit".

![alt tag](http://g.recordit.co/VRCpXJbE8K.gif)

Once a report has been created, the dashboard shows it under "In Progress". Clicking on the link allows the user to continue editing the report.

![alt tag](http://g.recordit.co/1C3COdrV00.gif)

When the report is ready to be reconciled, the user can click on the "Reconcile Expenses" button to see the calculated results.

![alt tag](http://g.recordit.co/U6EVOwfEJr.gif)

After the report is reconciled, the user can see it in the dashboard under "Reconciled Reports". 

Future feature:
* Email integration so reconciled reports can be sent to people in the group.
