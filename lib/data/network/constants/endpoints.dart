class Endpoints {
  Endpoints._();

  // base url
  // static const String baseUrl = "http://jsonplaceholder.typicode.com";

  static const String baseUrl = "https://newsapi.org";

  static const String id = "1";

  // receiveTimeout
  static const int receiveTimeout = 5000;

  // connectTimeout
  static const int connectionTimeout = 3000;

  // booking endpoints
  // static const String getPosts = baseUrl + "/posts";
  static const String getPosts = baseUrl + "/v2/top-headlines";



}