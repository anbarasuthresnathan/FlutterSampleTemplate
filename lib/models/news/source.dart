import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import '../serializers.dart';

part 'source.g.dart';

abstract class Source implements Built<Source, SourceBuilder> {
  Source._();

  factory Source([updates(SourceBuilder b)]) = _$Source;

  @BuiltValueField(wireName: 'id')
  int get id;
  @BuiltValueField(wireName: 'name')
  String get name;
  String toJson() {
    return json.encode(serializers.serializeWith(Source.serializer, this));
  }

  static Source fromJson(String jsonString) {
    return serializers.deserializeWith(
        Source.serializer, json.decode(jsonString));
  }

  static Serializer<Source> get serializer => _$sourceSerializer;
}
