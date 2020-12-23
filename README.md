# README


## users テーブル
|Column             |Type   |Options                  |
|:------------------|:------|:------------------------|
|nickname           |string |null:false               |
|email              |string |null:false ,unique: true |
|encrypted_password |string |null:false               |
|first_name         |string |null:false               |
|last_name          |string |null:false               |
|first_name_kana    |string |null:false               |
|last_name_kana     |string |null:false               |
|birthday           |date   |null:false               |

### Association
- has_many :items
- has_many :buying_logs

（ここに追記していく）
## items テーブル
|Column         |Type       |Options                      |
|:--------------|:----------|:----------------------------|
|title          |string     |null:false                   |
|explaining     |text       |null:false                   |
|category_id    |integer    |null:false                   |
|status_id      |integer    |null:false                   |
|delivary_fee_id|integer    |null:false                   |
|area_id        |integer    |null:false                   |
|need_day_id    |integer    |null:false                   |
|price          |integer    |null:false                   |
|user           |references |null:false ,foreign_key: true|

### Association
- belongs_to :user
- has_one :buying_log

## addressesテーブル
|Column         |Type       |Options                      |
|:--------------|:----------|:----------------------------|
|postal_code    |string     |null:false                   |
|area_id        |integer    |null:false                   |
|city           |string     |null:false                   |
|address        |string     |null:false                   |
|building       |string     |                             |
|phone_number   |string     |null:false                   |
|buying_logs_id |reference  |null:false ,foreign_key: true|

### Association
- belongs_to :buying_log


## buying_logsテーブル
|Column         |Type       |Options                      |
|:--------------|:----------|:----------------------------|
|user           |reference  |null:false ,foreign_key: true|
|item           |reference  |null:false ,foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item
- has_one :address
