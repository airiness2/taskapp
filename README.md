# README

## Models

- Users

|Column|Data|
|--|--|
|id|integer|
|username|strings|
|password|strings|
|name|strings|
|email|strings|

- Tasks

|Column|Data|
|--|--|
|id|integer|
|user_id|integer|
|label_id|integer|
|taskname|strings|
|starttime|datetime|
|endtime|datetime|
|status|strings|
|priority|integer|

- Labels

|Column|Data|
|--|--|
|id|integer|
|labelname|strings|
