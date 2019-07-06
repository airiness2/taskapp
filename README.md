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



## Environment

- Rails 5.2.3
- ruby 2.6.3p62
- psql (PostgreSQL) 11.3

## Deploying

- ディレクトリ配下のファイルをコミット対象にする  
git add -A  

- コミットする  
git commit -m 'コメント'  

- githubにデプロイ  
git push origin master  

- github連携により、自動的にherokuにもデプロイされる
