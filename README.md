# Habit-Tracker
🥦An application for learning new habits and tracking progress.🥦

The user interface was written using UIKit. The used architecture - MVVM.

### Authentication View
![authphoto](https://user-images.githubusercontent.com/89782153/196181466-3aca4dbf-e3bd-4fe3-ac8f-0f78aefae395.jpg)
  When the user starts the program for the first time, 
he gets to the authentication screen where he can either register 
or log in to the impersonating account.
Firebase Authentication is used for user authentication.

### AddHabitView
![addphoto](https://user-images.githubusercontent.com/89782153/196182232-e2d92aef-8cd5-4170-abae-52071e173fa8.jpg)
  The user can add the name of the habit he wants to master. 
  The habit is written to the Firebase RealtimeDatabase

###HabitListView
![habitphoto](https://user-images.githubusercontent.com/89782153/196182994-06ecc65f-994a-4643-b9ec-3ecc4784e1ed.jpg)
  The screen displays all added habits, progress, and a button to mark completion. When clicking the photo, the button changes and the user can no longer click the button during the day.
