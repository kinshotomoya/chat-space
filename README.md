# chat-space

##chatsテーブル
|column|type|
|:---:|:---:|
|text |text|
|user_group_id|references|

*User-groupsテーブルとアソシエーションをするので、外部キー制約*

##groupsテーブル
|column|type|
|:----:|:--:|
| name |string|
*nameカラムにNULL NOT制約を実装*


##Usersテーブル
|column|type|
|:---:|:---:|
|name|string|
*nameカラムにNULL NOT制約を実装*

##User-groupsテーブル
|column|type|
|:----:|:---:|
|group_id|references|
|user_id|references|

*UsersテーブルとGroupsテーブルとアソシエーションをするので、外部キー制約*



##Imagesテーブル
|column|type|
|:----:|:--:|
|image|text|
|user_group_id|references|

*User-groupsテーブルとアソシエーションをするので、外部キー制約*