Name
====
タスク管理ツール

## Description
- 株式会社万葉様新入社員教育課題

## Models

- Users

|Column|Data|
|--|--|
|id|integer|
|name|strings|
|password|strings|
|name|strings|
|email|strings|

- Tasks

|Column|Data|
|--|--|
|id|integer|
|user_id|integer|
|name|strings|
|endtime|datetime|
|status|strings|
|priority|integer|
|detail|strings|

- Labels

|Column|Data|
|--|--|
|id|integer|
|labelname|strings|

- Labelings

|Column|Data|
|--|--|
|id|integer|
|task_id|integer|
|label_id|integer|


## Environment

- Rails 5.2.3
- ruby 2.6.3p62
- psql (PostgreSQL) 11.3
