# calendarApp
The course app according to the way I worked on it is in three section

*The Login and sign up section which is
    -calendarApp
        I'm yet to add a splash screen
        Yet to add firebase authentication
        The calendar portion of this section will be removed when the calendar section below is completed

*The calendar section where you can choose and enter a course information to be stored in the data base
For this I'm still working on:
  -Adding multiple information about a particular course
  -Saving and fetching the data from the database
  
*The third portion is the main part of the app where we have a bottom navigation bar to see course outline
Add a new course information
This portion is unavailable because I'm yet to work it



*CalenderController 
    CalenderController from the table_calendar flutter plugin was used
    CalendarController has been removed from the latest version of the table_calendar
    And the code has been migrated to the current non safety dart version
        The current table_calendar version ^3.0.1 does not support CalendarController so I'm using version 2.3.1 until I find a way to use the replacement of the 
        CalendarController
        The version ^2.0.1 does not support the null safety version of dart(2.12.1)
        In order to run without errors :
              clean app
                $ flutter clean
              run pub get
                $ flutter pub get
              run app
                $ flutter run --no-sound-null-safety
                
