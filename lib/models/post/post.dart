class Post {
  int userId;
  int id;
  String title;
  String body;
  
  // Post(int userId,int id,String title,String body){
  //   this.userId=userId;
  //   this.id=id;
  //   this.title=title;
  //   this.body=body;
  // }

  Post({
    this.userId,
    this.id,
    this.title,
    this.body,
  });

  factory Post.fromMap(Map<String, dynamic> json) => Post(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
      );

  Map<String, dynamic> toMap() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
      };
  }