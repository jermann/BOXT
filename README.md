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
[https://github.com/jermann/BOXT](https://github.com/jermann/BOXT)

### Features Additions from Iteration-2 to Final Launch:
- Profiles
  We implemented an all new page where users can look at their profile. Here they can see the listings that they posted as well as the listings they booked. In the listings they booked they now also have the ability to rate the bookings (see next section).
- Ratings
  Users now have the ability to rate the storages that they have booked. We removed the temporary solution where people were able to rate their own listings. This is no longer possible.
- Booking Contact
  Added ability to contact host via email after booking.
- This is on top of all the awesome features up to now...
  
