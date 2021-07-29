# courseApp
**Made with :heartbeat: from Elisha**

## What sections are implemented?
1. The Login and sign up section which is
 	- calendarApp
        	+I'm yet to add a splash screen
        	+ Yet to add firebase authentication
        	+ The calendar portion of this section will be removed when the calendar section below is completed
2. The calendar section where you can choose and enter a course information to be stored in the data base
        -For this I'm still working on:
            	- Adding multiple information about a particular course
            	- Saving and fetching the data from the database
3. The third portion is the main part of the app where we have a bottom navigation bar to see course outline
            	- This portion is unavailable because I'm yet to work it
                - Add a new course information



                
                
## Note

- How to start your project based on this.

1. Clone this repository locally. The folder structure is somewhat based on clean code architecture
2. CalenderController 
    - CalenderController from the table_calendar flutter plugin was used
    - CalendarController has been removed from the latest version of the table_calendar
    - And the code has been migrated to the current non safety dart version
        	- The current table_calendar version ^3.0.1 does not support CalendarController  
        	- I'm using version 2.3.1 until I find a way to use the replacement of the 
        	- CalendarController
        	- The version ^2.0.1 does not support the null safety version of dart(2.12.1)
        	- In order to run without errors :
              	- clean app
                `$ flutter clean`
              	- run pub get
                `$ flutter pub get`
              	- run app
                `$ flutter run --no-sound-null-safety`
## Contribution
Contribution (suggestions, issues, feature request, pull requests) are highly welcome. Also looking for help in making it testable by adding unit, widget and integration tests.
