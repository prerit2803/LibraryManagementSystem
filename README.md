===============================README FILE==============================

						For Library Management System.

Team Members:

Animesh Sinsinwal: 	assinsin@ncsu.edu

Prerit Bhandari: 	pbhanda2@ncsu.edu

Gautami Khandekar: gmkhande@ncsu.edu

GitHub Link: https://github.ncsu.edu/pbhanda2/LibraryManagement

================================MAIN LOGIN==============================

Login Credentials: Super-Admin 

email: superadmin@ncsu.edu

password: sup123

==============================FUNCTIONALITIES===========================

Super Admin: (Type-0)

1. Access to User Management.

2. Access to Room Management.

3. Can assign or revoke 'admin' rights for other Admins(Type-1) or Users(Type-2).

4. Can delete other Admins(Type-1) or Users(Type-2).

5. Can book a room on behalf of other users (users can be Admins also).

6. Can add new Rooms.

7. Look into all users past booking.

8. Look into current bookings and make changes to current bookings for any user.



Admin: (Type-1)

1. Access to User Management.

2. Access to Room Management.

3. Cannot delete Super-Admin.

4. Can delete other Admins(Type-1) or Users(Type-2).

5. Can book a room on behalf of other users (users can be Admins also).

6. Can add new Rooms.

7. Look into all users past booking.

8. Look into current bookings and make changes to current bookings for any user.



Users: (Type-2)

1. Sign Up for a new account.

2. Can search rooms, but doesn't book on that page.

3. Can book a room, first find the room if allowed for booking.

4. Can update or cancel a booking.

5. Look into his/her current booking(i.e., >= Current Date).

6. Look into his/her past booking (i.e., <Current Date).


===============================TEST CASES==============================

Test Cases

User Model Test Cases:

1. Test if the user created is valid.

2. Verify if the email address for every user is unique, follows the particular format and has maximum length of 100.

3. Verify if the user name exists and has the maximum length of 40.

4. Verify if the password exists and has maximum length go 6.


Room Controller Test Cases

1. Index, Show, New, Edit (CRUD) tests cases.

2. Displaying and adding new rooms.

3. Create: Tests whether an object is successfully created and stored.

4. Update: Verifies whether the attributes passed get assigned to the model to be updated and whether the redirect works as desired.

5. Delete: Verifies if the method in the controller actually deletes the object and confirms that the user is redirected to the index if true.


=================================SCOPE=================================

Scope for this project

1. Adjust date/time constraint while booking. Currently only booking is working.

2. Link other group members to room booking.

3. Send email or notification to other members.

4. Create an event function to book a room.

