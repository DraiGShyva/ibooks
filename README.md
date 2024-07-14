App Functions
  1. Splash Page
  - The splash page is the starting page of the app and determines which page to display next.
  - If it is the first time the app is launched, it will go to the onboarding page.
  - If the user is not logged in, it will go to the login page.
  - If the user is logged in and has not logged out, it will go to the home page the next time the app is launched. If the user has logged out, it will go to the login page.
    ![image](https://github.com/user-attachments/assets/6f438aff-8472-4f55-a1d8-cb12e356d499)
    
  2. Onboarding Page
  - Introduces the app to the user.
  - After the user taps the "Start" button, the onboarding page will not be displayed again the next time the app is launched (unless the data is cleared).
    ![image](https://github.com/user-attachments/assets/385440ff-3ae1-478b-890c-3bba3c5e24c5) ![image](https://github.com/user-attachments/assets/21a01765-bc49-45b1-b4fb-941e5606097e) ![image](https://github.com/user-attachments/assets/c4eab187-4266-41a2-b224-fbc8b2e29e69)

  3. Login Page
  - Allows users to log in to their account.
  - Has two fields for entering username and password.
  - Both fields are required.
  - The password must be at least 6 characters long.
  - If all of the above conditions are met, when the user taps the "Login" button, the app will display a loading popup and check the username and password.
  - If the username and password are correct, it will display a message "Login successful!" and go to the loading page and then to the home page.
  - If the username and password are incorrect, it will display a message "Username or password incorrectly!".
  - When the user taps the "Register" button, it will go to the account registration page.
    ![image](https://github.com/user-attachments/assets/9ee56663-0858-4a2f-99f9-c0ff667d4489)

  4. Register Page
  - Allows users to register a new account.
  - Has three fields for entering username, password, and confirm password.
  - All three fields are required.
  - The password and confirm password must be the same and at least 6 characters long.
  - If all of the above conditions are met, when the user taps the "Register" button, the app will display a loading popup and check if the username already exists.
  - If the username does not already exist, it will save the username and password and display a message "Successful account registration", and go to the login page with the registered username.
  - If the username already exists, it will display a message "Account already exists".
    ![image](https://github.com/user-attachments/assets/63d9e4cc-9be5-4105-8bb0-144c942f21c8)

  5. Home Page
  - Displays a banner that automatically scrolls horizontally.
  - Four buttons to go to the search by name page, filter by genre page, notifications page, and reading history page (reading history page is not yet available).
  - A list of stories with the ability to paginate (only a certain number of stories are displayed initially, and more stories are loaded when the user scrolls down near the bottom).
  - When a story is tapped, it will go to the list of chapters for that story.
  - When a story is long-pressed, it will display detailed information and a button to add it to the favorites list.
  - There is a bottom navigation bar to go to the favorites page or account page.
    ![image](https://github.com/user-attachments/assets/077bb79b-c1aa-43bd-8b7d-4c0549cf5ccd) ![image](https://github.com/user-attachments/assets/e74bf803-37cf-4991-98b6-95c5767ef39f) ![image](https://github.com/user-attachments/assets/659be29b-5ec2-4228-9718-d98c1a1826f0)

  6. Favorites Page
  - Displays a list of stories that have been added to the favorites of the currently logged in account.
  - There is a bottom navigation bar to go to the home page or account page.
    ![image](https://github.com/user-attachments/assets/4a25e59b-3d13-4a0c-b901-5db1c225ee42)

  7. Account Page
  - Change the profile picture of the account (Android only)
  - Switch to dark mode.
  - Change the password of the currently logged in account.
  - Log out of the current account.
  - View version information and copyright.
    ![image](https://github.com/user-attachments/assets/9a82dcff-049b-47c7-831b-7067a60f3d4d) ![image](https://github.com/user-attachments/assets/0020270e-7f12-43eb-90a1-2d8bb8f14788) ![image](https://github.com/user-attachments/assets/8bc61a29-41ba-4996-8534-025f7a9cbe0e) ![image](https://github.com/user-attachments/assets/437c521b-2a7f-47fb-b916-601b56231dbf) ![image](https://github.com/user-attachments/assets/c168137d-e994-4b04-bd28-f862bde2daa1)

  8. List Chapter Page, Chapter Page
  - Displays a list of chapters for a story.
  - When a chapter is tapped, it will go to the chapter reading page to display the chapter content.
  - When scrolling down on the chapter reading page, the app bar will be hidden, and it will reappear when scrolling up.
  - Search Page, Category Selection Page, Notification Page
  - Search for stories by name.
  - Filter stories by genre.
  - When multiple genres are selected, it will display stories that contain all of the selected genres.
  - When at least one genre is selected, it will display a "Clear All" button to deselect all genres.
  - Displays a list of notifications that have been displayed during the use of the app.
  - You can select individual notifications or tap the check button in the app bar to select them and then delete them using the trash bin button in the app bar.
    ![image](https://github.com/user-attachments/assets/6a991cf5-5522-45be-b7e0-577c072e0d35) ![image](https://github.com/user-attachments/assets/192669a4-5c57-4fbd-b14c-e974787b7185)

  9. Search Page, Category Selection Page, Notification Page
  - Search for stories by name.
  - Filter stories by genre.
  - When multiple genres are selected, it will display stories that contain all of the selected genres.
  - When at least one genre is selected, it will display a "Clear All" button to deselect all genres.
  - Displays a list of notifications that have been displayed during the use of the app.
  - You can select individual notifications or tap the check button in the app bar to select them and then delete them using the trash bin button in the app bar.
    ![image](https://github.com/user-attachments/assets/9b23fb10-2483-4966-84e1-90d9376626a2) ![image](https://github.com/user-attachments/assets/f3c84bcf-4010-4352-9bf8-dd79d4e42a93) ![image](https://github.com/user-attachments/assets/261362be-5db0-44fe-a442-91eb8e59fb1d) ![image](https://github.com/user-attachments/assets/fbf79bae-8f4a-402c-aaf1-66eb66896db9) ![image](https://github.com/user-attachments/assets/882d39f6-6379-493e-8e92-0df3d039e136)
