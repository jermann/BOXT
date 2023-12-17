# BOXT
*Storage by Students for Students, enjoy your Summer worry free*

### Team Members
Tarang Donga (tkd2113)  
Alexander Jermann (apj2125)  
Madhulika Balakumar (mb5144)  
Gargi Patil (gp2723)  

### About
This repo is the realization of our Software-as-a-Service class project to implement a startup idea. 

The software is designed as a storage marketplace where students can book storage space to safely store their belongings over the summer when they have to move out of their dorm. It also allows students living off-campus with year long leases to list their space as storage to earn some income when they are not using the space. 

### Setup Instructions
##### Prerequisites:  
Ruby 2.6.6  
Rails 5.2.1  
Bundler 1.17.3  
##### App setup:
git clone https://github.com/jermann/BOXT.git  
cd BOXT/  
bundle update  
bundle install --without production  
bundle exec rake db:setup  
rails server -b 0.0.0.0  

### Heroku App Link
https://intense-retreat-06834-c7bc69983cf2.herokuapp.com/  

### GitHub Repository Link
[https://github.com/jermann/BOXT/tree/iteration2](https://github.com/jermann/BOXT)

### App Main Features Workflow:
- Sign-Up Requirement:  
New users are required to sign up to access all features of the application.  
- Login Requirement:  
Logging in is mandatory for actions like creating, editing, deleting and booking listings.  
- User-Specific Actions:  
Users are restricted to editing and deleting only the listings they have created.  
- Anonymous Access:  
Users can browse and view all listings, sort, filter as well as view details pages, without needing to log in.  
- Book Portion of the Listing:  
Logged in users can book a portion of the space or the entire listing. If the user books the entire space, the storage will no longer be visible for booking as it is booked out.   
- Data Validation:   
Data entered while creating a new listing or editing an existing listing is validated.  
  
