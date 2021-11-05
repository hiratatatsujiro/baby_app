# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# テーブル設計
## usersテーブル
| Column              | Type     | Options     |
|---------------------|----------|-------------|
| name                | string   | null: false |
| email               | string   | null: false |
| encrypted_password  | string   | null: false | 
| prefectures_id      | integer  | null: false |
| city                | string   | null: false |
| house_number        | string   | null: false |         

### Association
- has_many children
- has_many :comments, dependent: :destroy
- has_many :diaries

## childrenテーブル
| Column              | Type       | Options           |
|---------------------|------------|-------------------|
| name                | string     | null: false       |
| birthday            | date       | null: false       | 
| gender_id           | integer    | null: false       |
| user                | references | foreign_key: true |
### Association
- belongs_to :user
- has_many :medicals


## medicalsテーブル
| Column              | Type       | Options           |
|---------------------|------------|-------------------|
| day                 | date       | null: false       |
| hospital            | string     | null: false       |
| drug_id             | integer    | null: false       |
| name_id             | integer    | null: false       |
| memo                | text       | null: false       |
| children            | references | foreign_key: true |
### Association
- belongs_to :children
- has_many :comments, dependent: :medicals


## medical_commentsテーブル
| Column              | Type       | Options           |
|---------------------|------------|-------------------|
| contact             | string     | null: false       |
| user                | references | foreign_key: true |
| medical             | references | foreign_key: true |
### Association
- belongs_to :user
- belongs_to :medical

## diaryテーブル
| Column              | Type       | Options           |
|---------------------|------------|-------------------|
| day                 | date       | null: false       |
| title               | string     | null: false       |
| text                | text       | null: false       |
| children            | references | foreign_key: true |
### Association
- belongs_to :children

## commentsテーブル
| Column              | Type       | Options           |
|---------------------|------------|-------------------|
| text                | string     | null: false       |
| user                | references | foreign_key: true |
| diary               | references | foreign_key: true |
### Association
- belongs_to :user
- belongs_to :diary

