# Kele API Client

### REST API Client

API Client Gem built to access [Bloc's REST API](http://docs.blocapi.apiary.io/#)

## Project Objectives

- Kele retrieves and stores an authentication token when passed valid credentials
- Students can retrieve their info
- Students can retrieve a list of their mentor's availability
- Students can retrieve roadmaps and checkpoints
- Students can retrieve a list of their messages, respond to an existing message, and create a new message thread
- Students can submit checkpoint assignments

## Runtime Dependencies  
- HTTParty Gem
- JSON Gem

## Setup and Configuration

### Setup
Gem is not live, therefore, to install manually use the following line:  

`$ gem install ./kele-0.0.1.gem`

Require kele Gem on irb:

    require 'kele'

Create a new variable using your Bloc login email and password. Kele will securely post your credentials to Bloc's API for an authentication token!

    kele_client = Kele.new('student@email.com', 'Password')

### What can you do with Kele

### User Info

`get_me` method retrieves your info.

    kele_client.get_me

### Mentor Availability

`get_mentor_availability` retrieve your mentor's available time

    kele_client.get_mentor_availability(mentor_id)


### Checking Roadmaps and Checkpoints

`get_roadmap(roadmap_id)` and `get_checkpoint(checkpoint_id)` retrieve your roadmap or checkpoint information

    kele_client.get_roadmap(roadmap_id)
    kele_client.get_checkpoint(checkpoint_id)


### Retrieving and sending messages

`get_messages` method retrieves message in history

    kele_client.get_messages(page)

`create_message(sender, recipient_id, subject, stripped_text)` 

### Submitting Checkpoints

`create_submission(checkpoint_id, assignment_branch, assignment_commit_link, comment, enrollment_id)`
