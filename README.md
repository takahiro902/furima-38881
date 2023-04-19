## usersテーブル

|Column           |Type    |Options                    |
|-----------------|--------|---------------------------|
| nickname        | string | null: false, unique: true |
| email           | string | null: false, unique: true |
| password        | string | null: false, unique: true |
| last_name       | string | null: false               |
| first_name      | string | null: false               |
| last_name_kana  | string | null: false               |
| first_name_kana | string | null: false               |
| birth_year      | date   | null: false               |
| birth_month     | date   | null: false               |
| birth_day       | date   | null: false               |

### Association
  has_many :items
  has_many :orders


## itemsテーブル

|Column       |Type        |Options                         |
|-------------|------------|--------------------------------|
| photo       | binary     | null: false                    |
| name        | string     | null: false                    |
| description | text       | null: false                    |
| category    | integer    | null: false                    |
| status      | integer    | null: false                    |
| burden      | integer    | null: false                    |
| area        | integer    | null: false                    |
| shipment    | integer    | null: false                    |
| price       | integer    | null: false                    |
| user_id     | references | null: false, foreign_key: true |

### Association
  belongs_to :user
  has_one :order


## ordersテーブル

|Column    |Type        |Options                         |
|----------|------------|--------------------------------|
| user_id  | references | null: false, foreign_key: true |
| item_id  | references | null: false, foreign_key: true |

### Association
  belongs_to :user
  belongs_to :item
  has_one :address


## addressテーブル

|Column         |Type        |Options                         |
|---------------|------------|--------------------------------|
| post_code     | string     | null: false                    |
| prefecture    | integer    | null: false                    |
| city          | string     | null: false                    |
| block         | string     | null: false                    |
| building_name | string     |                                |
| phone_number  | string     | null: false                    |
| order_id      | references | null: false, foreign_key: true |

### Association
  belongs_to :order
