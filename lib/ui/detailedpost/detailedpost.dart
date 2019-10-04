import 'package:boilerplate/data/sharedpref/constants/preferences.dart';
import 'package:boilerplate/models/post/post.dart';
import 'package:boilerplate/stores/post/post_store.dart';
import 'package:fimber/fimber.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../routes.dart';

// class DetailedPost extends StatefulWidget {
//   Post data;

//   // DetailedPost(Post s);
//   DetailedPost({
//     Key key,@required this.data,
//     }) : super(key: key);

//   @override
//   _DetailedPostState createState() => _DetailedPostState();
// }

// class _DetailedPostState extends State<DetailedPost> {
//   final _store = PostStore();

//   @override
//   void initState() {
//     super.initState();
//     Fimber.d(
//       " the dats is ",
//     );
//     //get all posts
//     _store.getPosts();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: _buildAppBar(context),
//       body: _buildBody(),
//     );
//   }

//   Widget _buildAppBar(BuildContext context) {
//     return AppBar(
//       title: Text('Detailed Posts'),
//       actions: <Widget>[
//         IconButton(
//           onPressed: () {
//             SharedPreferences.getInstance().then((preference) {
//               preference.setBool(Preferences.is_logged_in, false);
//               Navigator.of(context).pushReplacementNamed(Routes.login);
//             });
//           },
//           icon: Icon(
//             Icons.power_settings_new,
//           ),
//         )
//       ],
//     );
//   }

//   _buildBody() {
//     Fimber.d(" Entered inside Detailed Screen ");
//     return Center(
//       child: Container(
//         child: Text(widget.data.body),
//       ),
//     );
//   }
// }
// class DetailedPost extends StatefulWidget {
//   final Post post;
//   DetailedPost(this.post);

//   // This is a String for the sake of an example.
//   // You can use any type you want.

//   @override
//   _DetailedPostState createState() => _DetailedPostState();
// }

// class _DetailedPostState extends State<DetailedPost> {
//   @override
//   Widget build(BuildContext context) {

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Routing App'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: <Widget>[
//             Text(
//               'Second Page',
//               style: TextStyle(fontSize: 50),
//             ),
//             Text(
//               "Hello World",
//               style: TextStyle(fontSize: 20),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
class DetailedPost extends StatelessWidget {
  final Post data;
  DetailedPost(this.data);
  @override
  Widget build(BuildContext context) {
    // Fimber.d("data is : $data.");
    return Scaffold(
      appBar: AppBar(
        title: Text('Detailed Page'),
      ),
      body: Container(
        padding: EdgeInsets.all(12.0),
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            Container(
                child: Text('${data.title}',
                    style: TextStyle(fontWeight: FontWeight.w700))),
            Container(
                padding: EdgeInsets.all(12.0),
                child: new MarkdownBody(data: '${data.body}')),
            Container(
              // top: _containerHeight + (_imageHeight / 4),
              padding: EdgeInsets.all(24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Text("2", style: TextStyle(fontWeight: FontWeight.bold)),
                      Icon(
                        Icons.thumb_up,
                        color: Colors.pink,
                        size: 24.0,
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Text("22", style: TextStyle(fontWeight: FontWeight.bold)),
                      Icon(
                        Icons.comment,
                        color: Colors.grey,
                        size: 24.0,
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Text("28", style: TextStyle(fontWeight: FontWeight.bold)),
                      Icon(
                        Icons.share,
                        color: Colors.grey,
                        size: 24.0,
                      ),
                    ],
                  ),
                  Container(),
                ],
              ),
            ),
             Container(
                child: Text("Comments", style: TextStyle(fontWeight: FontWeight.bold))),
          ],
          
        ),
      ),
    );
  }
}
