import 'package:boilerplate/models/post/post.dart';

// class PostsList {
//   final List<Post> posts;

//   PostsList({
//     this.posts,
//   });

//   factory PostsList.fromJson(List<dynamic> json) {
//     List<Post> posts = List<Post>();
//     posts = json.map((post) => Post.fromMap(post)).toList();

//     return PostsList(
//       posts: posts,
//     );
//   }
// }

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import '../serializers.dart';

part 'post_list.g.dart';

abstract class PostsList implements Built<PostsList, PostsListBuilder> {
  PostsList._();

  factory PostsList([updates(PostsListBuilder b)]) = _$PostsList;

  
  BuiltList<Post> get posts;

  String toJson() {
    return json.encode(serializers.serializeWith(PostsList.serializer, this));
  }

  static PostsList fromJson(String jsonString) {
    return serializers.deserializeWith(
        PostsList.serializer, json.decode(jsonString));
  }

  static Serializer<PostsList> get serializer => _$postsListSerializer;
}
