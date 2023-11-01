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
git clone git@github.com:[your_github_username]/BOXT.git
cd BOXT/Boxt/
bundle config set without 'production'
bin/rake db:setup
bin/rails server -b 0.0.0.0
