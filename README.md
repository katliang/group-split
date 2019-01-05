# GroupSplit

GroupSplit allows users to easily split group expenses.

The deployed project can be found here: https://tranquil-castle-84286.herokuapp.com/

GroupSplit is responsive to mobile and desktop size screens.

## Contents
* [Technologies](#technologies)
* [Features](#features)

## <a name="technologies"></a>Technologies

Backend: Ruby, Ruby on Rails, PostgreSQL<br/>
Frontend: HTML5, CSS, Bootstrap, jQuery<br/>

## <a name="features"></a>Features

![alt tag](http://g.recordit.co/lXb64k6ZpL.gif)

This Rails application has a home page with a form for new users to sign up (above) and a log in page for returning users (not shown). Passwords are hashed with Bcrypt before storing in the PostgreSQL database.

![alt tag](http://g.recordit.co/f1ie7mMRnO.gif)

After the user logs in, a dashboard displays the user's in progress and reconciled reports. New reports can be created by clicking on the "Create New Report" button.

![alt tag](http://g.recordit.co/2toi9Lr9NT.gif)

The user who creates the report will automatically be added to that report. On this page, the user is able to:
- Edit the report name.
- Add a member(s) to the report group.
- Add an expense(s) to the report.
- Remove a member(s) from the report group.
- Remove an expense(s) from the report.
- Delete the report.
- Cancel and return to the dashboard.
- Reconcile the report.

![alt tag](http://g.recordit.co/AHQz0FP0Mq.gif)

When the report is ready to be reconciled, the user can click on the "Reconcile" button to see the calculated results.

![alt tag](http://g.recordit.co/nNTRxvuCre.gif)

The results page displays the reconciliation. Buttons are included to show more information about the report's expenses and net totals for each person. jQuery is used to toggle the information when a button is clicked.

Future feature:
* Email integration so reconciled reports can be sent to people in the group.
