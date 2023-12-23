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

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |

### Association

- has_many :records

## records テーブル

| Column             | Type    | Options     |
| -------------------| --------| ----------- |
| date               | string  | null: false |
| bedtime            | time    | null: false |
| wake_up_time       | time    | null: false |
| time_of_sleeping   | integer | null: false |

### Association

- belongs_to :user