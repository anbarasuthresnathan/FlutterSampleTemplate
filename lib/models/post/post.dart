// class Post {
//   int userId;
//   int id;
//   String title;
//   String body;
  
//   // Post(int userId,int id,String title,String body){
//   //   this.userId=userId;
//   //   this.id=id;
//   //   this.title=title;
//   //   this.body=body;
//   // }

//   Post({
//     this.userId,
//     this.id,
//     this.title,
//     this.body,
//   });

//   factory Post.fromMap(Map<String, dynamic> json) => Post(
//         userId: json["userId"],
//         id: json["id"],
//         title: json["title"],
//         body: json["body"],
//       );

//   Map<String, dynamic> toMap() => {
//         "userId": userId,
//         "id": id,
//         "title": title,
//         "body": body,
//       };
//   }
import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import '../serializers.dart';

part 'post.g.dart';

abstract class Post implements Built<Post, PostBuilder> {
  Post._();

  factory Post([updates(PostBuilder b)]) = _$Post;

  @BuiltValueField(wireName: 'userId')
  int get userId;
  @BuiltValueField(wireName: 'id')
  int get id;
  @BuiltValueField(wireName: 'title')
  String get title;
  @BuiltValueField(wireName: 'body')
  String get body;
  String toJson() {
    return json.encode(serializers.serializeWith(Post.serializer, this));
  }

  static Post fromJson(String jsonString) {
    return serializers.deserializeWith(
        Post.serializer, json.decode(jsonString));
  }

  static Serializer<Post> get serializer => _$postSerializer;
}