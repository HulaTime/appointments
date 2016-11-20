#Availability Ruby Test
Your task is to create an app that will allow patients to book appointments with a doctor, using the dataset provided.

There is a method that is repeated in availability and available slots, ordinarily I would extend the String class to take that method (:find_seconds(time) or refactor it out but for the purposes of this test I am leaving it in for now)

##Done
- create a command line app that accepts a single argument, which is the time that the patient would like to book
- The app should check which is the next available slot
- Your app should accept a time (eg: 12:40)
- Patients cannot book appointments before 8am and after 3pm

###Requirements
You should create a command line app that accepts a single argument, which is the time that the patient would like to book to see a doctor. Eg: `$ ./availability.rb 12:40`

The app should check which is the next available slot and book it. It should print the time of the appointment that was booked

###Additional Requirements
Patients cannot book appointments before 8am and after 3pm. Once an availability has been used up for an appointment it cannot be booked again.

In the dataset there are multiple doctors (id: 1 & 2) and each doctor can only have 1 appointment per slot. For example, you could potentially book 12:20 once for doctor 1 and again for doctor 2.

###Constraints
Please use the JSON file provided to load availability into your app.
Your app should be an executable ruby script (command line).
Your app should accept a time (eg: 12:40)
Your app should print the time that was booked (eg: 1:10)
