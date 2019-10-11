import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import '../serializers.dart';
import 'source.dart';

part 'articles.g.dart';

abstract class Articles implements Built<Articles, ArticlesBuilder> {
  Articles._();

  factory Articles([updates(ArticlesBuilder b)]) = _$Articles;

  @BuiltValueField(wireName: 'source')
  Source get source;
  @BuiltValueField(wireName: 'author')
  String get author;
  @BuiltValueField(wireName: 'title')
  String get title;
  @BuiltValueField(wireName: 'description')
  String get description;
  @BuiltValueField(wireName: 'url')
  String get url;
  @BuiltValueField(wireName: 'urlToImage')
  String get urlToImage;
  @BuiltValueField(wireName: 'publishedAt')
  String get publishedAt;
  @BuiltValueField(wireName: 'content')
  String get content;
  String toJson() {
    return json.encode(serializers.serializeWith(Articles.serializer, this));
  }

  static Articles fromJson(String jsonString) {
    return serializers.deserializeWith(
        Articles.serializer, json.decode(jsonString));
  }

  static Serializer<Articles> get serializer => _$articlesSerializer;
}
