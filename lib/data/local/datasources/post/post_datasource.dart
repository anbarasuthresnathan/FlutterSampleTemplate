import 'package:built_collection/built_collection.dart';
import 'package:sembast/sembast.dart';

import '../../../../models/post/post.dart';
import '../../../../models/serializers.dart';
import '../../constants/db_constants.dart';

class PostDataSource {
  // A Store with int keys and Map<String, dynamic> values.
  // This Store acts like a persistent map, values of which are Flogs objects converted to Map
  final _postsStore = intMapStoreFactory.store(DBConstants.STORE_NAME);

  // Private getter to shorten the amount of code needed to get the
  // singleton instance of an opened database.
//  Future<Database> get _db async => await AppDatabase.instance.database;

  // database instance
  final Future<Database> _db;

  // Constructor
  PostDataSource(this._db);

  // DB functions:--------------------------------------------------------------
  Future insert(Post post) async {
    var map = serializers.serializeWith(Post.serializer, post);
    return await _postsStore.add(await _db, map);
  }

  Future<int> count() async {
    return await _postsStore.count(await _db);
  }

  Future<List<Post>> getAllSortedByFilter({List<Filter> filters}) async {
    //creating finder
    final finder = Finder(
        filter: Filter.and(filters),
        sortOrders: [SortOrder(DBConstants.FIELD_ID)]);

    final recordSnapshots = await _postsStore.find(
      await _db,
      finder: finder,
    );
    // Making a List<Post> out of List<RecordSnapshot>
    final BuiltList<Post> listOfTestClasses = deserializeListOf<Post>(recordSnapshots);
    return recordSnapshots.map((listOfTestClasses) {
      final post = Post.fromJson(listOfTestClasses.value.toString());
      // An ID is a key of a record from the database.
      Post((b)=>b..id= listOfTestClasses.key);
      return post;
    }).toList();
  }

  Future<List<Post> > getPostsFromDb() async {
    print('Loading from database');
    // post list
    var postsList;
    // fetching data
    final recordSnapshots = await _postsStore.find(
      await _db,
    );
    // Making a List<Post> out of List<RecordSnapshot>
    if (recordSnapshots.length > 0) {
    final BuiltList<Post> listOfTestClasses = deserializeListOf<Post>(recordSnapshots);
// Making a List<Post> out of List<RecordSnapshot>
      postsList = recordSnapshots.map((listOfTestClasses) {
      final post = Post.fromJson(listOfTestClasses.value.toString());
      // An ID is a key of a record from the database.
      Post((b)=>b..id= listOfTestClasses.key);
      return post;
    }).toList();
    } 

    return postsList;
  }

  Future<int> update(Post post) async {
    // For filtering by key (ID), RegEx, greater than, and many other criteria,
    // we use a Finder.
    final finder = Finder(filter: Filter.byKey(post.id));
    var map = serializers.serializeWith(Post.serializer, post);
    return await _postsStore.update(
      await _db,
      map,
      finder: finder,
    );
  }

  Future<int> updateAll(Post post) async {
    // For filtering by key (ID), RegEx, greater than, and many other criteria,
    // we use a Finder.
    var map = serializers.serializeWith(Post.serializer, post);
    return await _postsStore.update(
      await _db,
      map,
    );
  }

  Future<int> delete(Post post) async {
    final finder = Finder(filter: Filter.byKey(post.id));
    return await _postsStore.delete(
      await _db,
      finder: finder,
    );
  }

  Future deleteAll() async {
    await _postsStore.drop(
      await _db,
    );
  }
}
