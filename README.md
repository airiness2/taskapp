# README

#  # Models
- Users
    - id:integer
    - username:strings
    - password:strings
    - name:strings
    - email:strings

- Tasks
    - id:integer
    - user_id:integer
    - label_id:integer
    - taskname:strings
    - starttime:datetime
    - endtime:datetime
    - status:strings
    - priority:integer

- Labels
    - id:integer
    - labelname:strings
