import 'package:boilerplate/models/post/post.dart';
import 'package:fimber/fimber.dart';
import 'package:flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/sharedpref/constants/preferences.dart';
import '../../routes.dart';
import '../../stores/post/post_store.dart';
import '../../widgets/progress_indicator_widget.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //store
  final _store = PostStore();

  @override
  void initState() {
    super.initState();

    //get all posts
    _store.getPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return AppBar(
      title: Text('Posts'),
      actions: <Widget>[
        IconButton(
          onPressed: () {
            SharedPreferences.getInstance().then((preference) {
              preference.setBool(Preferences.is_logged_in, false);
              Navigator.of(context).pushReplacementNamed(Routes.login);
            });
          },
          icon: Icon(
            Icons.power_settings_new,
          ),
        )
      ],
    );
  }

  Widget _buildBody() {
    return Stack(
      children: <Widget>[
        Observer(
          name: 'listview',
          builder: (context) {
            return _store.loading
                ? CustomProgressIndicatorWidget()
                : Material(child: _buildCardListView());
          },
        ),
        Observer(
          name: 'error',
          builder: (context) {
            return _store.success
                ? Container()
                : showErrorMessage(context, _store.errorStore.errorMessage);
          },
        )
      ],
    );
  }

  Widget _buildCardListView() {
    return _store.postsList != null
        ? ListView.separated(
            itemCount: _store.postsList.length,
            separatorBuilder: (context, position) {
              return Divider();
            },
            itemBuilder: (context, position) {
              return ListTile(
      
                onTap: () {
                  Fimber.d("onTap called." +
                      '${_store.postsList[position].id}');
                  navigate(context,position);
                },
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                leading: Builder(builder: (BuildContext context) {
                  return new GestureDetector(
                    onTap: () {
                      // Scaffold.of(context).openDrawer();
                      Fimber.d("Clicked the User Avatar ");
                    },
                    child: new Container(
                      padding: EdgeInsets.only(right: 12.0),
                      decoration: new BoxDecoration(
                          border: new Border(
                              right: new BorderSide(
                                  width: 1.0, color: Colors.blueAccent))),
                      child: CircleAvatar(
                          backgroundImage:
                              AssetImage("assets/images/profile.jpeg")),
                    ),
                  );
                }),
                trailing:
                    Icon(Icons.keyboard_arrow_right, color: Colors.blueAccent),
                title: Text(
                  '${_store.postsList[position].title}',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  softWrap: false,
                  style: TextStyle(
                      color: Colors.blue, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  '${_store.postsList[position].body}',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  softWrap: false,
                  style: TextStyle(
                      color: Colors.blueGrey, fontWeight: FontWeight.normal),
                ),
              );
            },
          )
        : Center(child: Text('No posts found'));
  }

  Widget navigate(BuildContext context,int position) {

    int id2 = _store.postsList[position].id;
        Fimber.d("Entered inside the navigate method $id2");
    Future.delayed(Duration(milliseconds: 0), () {

     
            Navigator.of(context).pushNamedAndRemoveUntil(
                Routes.detailedpost, ModalRoute.withName(Routes.home),arguments:  Post.fromJson(_store.postsList[position].toJson())
          
//           //   _store.postsList.posts[position].userId,
//           //   _store.postsList.posts[position].id,
//           //   _store.postsList.posts[position].title,
//           //   _store.postsList.posts[position].body,
//           // })
            
);

      // Navigator.of(context).pushNamed(Routes.detailedpost);
    });

    return Container();
  }

  // General Methods:-----------------------------------------------------------
  showErrorMessage(BuildContext context, String message) {
    Future.delayed(Duration(milliseconds: 0), () {
      if (message != null) {
        FlushbarHelper.createError(
          message: message,
          title: 'Error',
          duration: Duration(seconds: 3),
        )..show(context);
      }
    });

    return Container();
  }

  showMessage(messages) {
    Fimber.d(messages);
  }
}
