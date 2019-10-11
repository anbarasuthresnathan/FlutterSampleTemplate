
import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import '../serializers.dart';
import 'articles.dart';

part 'news.g.dart';

abstract class News implements Built<News, NewsBuilder> {
  News._();

  factory News([updates(NewsBuilder b)]) = _$News;

  @BuiltValueField(wireName: 'status')
  String get status;
  @BuiltValueField(wireName: 'totalResults')
  int get totalResults;
  @BuiltValueField(wireName: 'articles')
  BuiltList<Articles> get articles;
  String toJson() {
    return json.encode(serializers.serializeWith(News.serializer, this));
  }

  static News fromJson(String jsonString) {
    return serializers.deserializeWith(
        News.serializer, json.decode(jsonString));
  }

  static Serializer<News> get serializer => _$newsSerializer;
}

