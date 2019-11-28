// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_list.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PostsList> _$postsListSerializer = new _$PostsListSerializer();

class _$PostsListSerializer implements StructuredSerializer<PostsList> {
  @override
  final Iterable<Type> types = const [PostsList, _$PostsList];
  @override
  final String wireName = 'PostsList';

  @override
  Iterable<Object> serialize(Serializers serializers, PostsList object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'posts',
      serializers.serialize(object.posts,
          specifiedType:
              const FullType(BuiltList, const [const FullType(Post)])),
    ];

    return result;
  }

  @override
  PostsList deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PostsListBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'posts':
          result.posts.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(Post)]))
              as BuiltList<dynamic>);
          break;
      }
    }

    return result.build();
  }
}

class _$PostsList extends PostsList {
  @override
  final BuiltList<Post> posts;

  factory _$PostsList([void Function(PostsListBuilder) updates]) =>
      (new PostsListBuilder()..update(updates)).build();

  _$PostsList._({this.posts}) : super._() {
    if (posts == null) {
      throw new BuiltValueNullFieldError('PostsList', 'posts');
    }
  }

  @override
  PostsList rebuild(void Function(PostsListBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PostsListBuilder toBuilder() => new PostsListBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PostsList && posts == other.posts;
  }

  @override
  int get hashCode {
    return $jf($jc(0, posts.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('PostsList')..add('posts', posts))
        .toString();
  }
}

class PostsListBuilder implements Builder<PostsList, PostsListBuilder> {
  _$PostsList _$v;

  ListBuilder<Post> _posts;
  ListBuilder<Post> get posts => _$this._posts ??= new ListBuilder<Post>();
  set posts(ListBuilder<Post> posts) => _$this._posts = posts;

  PostsListBuilder();

  PostsListBuilder get _$this {
    if (_$v != null) {
      _posts = _$v.posts?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PostsList other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$PostsList;
  }

  @override
  void update(void Function(PostsListBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$PostsList build() {
    _$PostsList _$result;
    try {
      _$result = _$v ?? new _$PostsList._(posts: posts.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'posts';
        posts.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'PostsList', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
