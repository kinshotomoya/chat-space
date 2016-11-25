# chat-space

##chats table
|column|type|
|:---:|:---:|
|text |text|
|image|string|
|user_id|references|
|group_id|references|

*User-groupsテーブルとアソシエーションをするので、外部キー制約
textカラムにNULL NOT制約を実装*

##groups table
|column|type|
|:----:|:--:|
| name |string|
*nameカラムにNULL NOT制約を実装*


##Users table
|column|type|
|:---:|:---:|
|name|string|
*nameカラムにNULL NOT制約を実装*

##User-groups table
|column|type|
|:----:|:---:|
|group_id|references|
|user_id|references|

*UsersテーブルとGroupsテーブルとアソシエーションをするので、外部キー制約*


