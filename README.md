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
|email|strings|
|admin|boolean|
|grouping_id|integer|

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
|read|boolean|

- Labels

|Column|Data|
|--|--|
|id|integer|
|name|strings|
|id|user_id|

- Labelings

|Column|Data|
|--|--|
|id|integer|
|task_id|integer|
|label_id|integer|

- Groups

|Column|Data|
|--|--|
|id|integer|
|name|strings|
|info|text|
|owner_id|integer|
|grouping_id|integer|

- Groupings

|Column|Data|
|--|--|
|id|integer|
|user_id|integer|
|group_id|integer|

## Environment

- Rails 5.2.3
- ruby 2.6.3p62
- psql (PostgreSQL) 11.3

デフォルトユーザ

- email: "admin@example.com"
- password: "taskapp"
