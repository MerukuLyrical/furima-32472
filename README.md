# README


## users テーブル
|Column         |Type   |Options    |
|:--------------|:------|:----------|
|nickname       |string |null:false |
|mail_address   |string |null:false |
|password       |string |null:false |
|first_name     |string |null:false |
|last_name      |string |null:false |
|first_name_kana|string |null:false |
|last_name_kana |string |null:false |
|birthday       |string |null:false |

### Association
- has_many :items
- has_many :buying_logs
- has_many :addresses

（ここに追記していく）
## items テーブル
|Column         |Type       |Options    |
|:--------------|:----------|:----------|
|title          |string     |null:false |
|image          |string     |null:false |
|explaining     |text       |null:false |
|category       |string     |null:false |
|status         |text       |null:false |
|delivary_fee   |string     |null:false |
|area           |string     |null:false |
|need_day       |string     |null:false |
|price          |string     |null:false |
|user           |references |null:false |

### Association
- belongs_to :users
- has_one :buying_logs

## addressesテーブル
|Column         |Type       |Options    |
|:--------------|:----------|:----------
|name           |references |null:false |
|postal_code    |string     |null:false |
|pref           |string     |null:false |
|city           |string     |null:false |
|address        |text       |null:false |
|phone_number   |string     |null:false |

### Association
- belongs_to :users
- belongs_to :buying_logs


## buying_logsテーブル
|Column         |Type       |Options    |
|:--------------|:----------|:----------|
|user           |reference  |null:false |
|item           |reference  |null:false |

### Association
- belongs_to :items
- belongs_to :items
- has_one :addresses
