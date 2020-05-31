import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:provider_architecture/core/models/comment.dart';
import 'package:provider_architecture/core/models/post.dart';
import 'package:provider_architecture/core/models/user.dart';

class Api {
  static const endpoint = "https://jsonplaceholder.typicode.com";
  var client = http.Client();

  ///User Profile
  Future<User> getUserProfile(int userId) async {
    //get userProfile by id
    var response = await client.get("$endpoint/users/$userId");
    var responseBody = json.decode(response.body);
    //convert and return
    return User.fromJson(responseBody);
  }

  ///fetching posts
  Future<List<Post>> getPostsForUser(int userId) async {
    var posts = List<Post>();
    //get posts by id
    var response = await client.get("$endpoint/posts?userId=$userId");
    //parse into list
    var parsed = json.decode(response.body) as List<dynamic>;
    //loop and convert parsed items to post
    for (var post in parsed) {
      posts.add(Post.fromJson(post));
    }
    return posts;
  }

  ///fetching comments
  Future<List<Comment>> getCommentsForPost(int postId) async {
    var comments = List<Comment>();
    //get comments of post
    var response = await client.get('$endpoint/comments?postId=$postId');
    //parse into list
    var parsed = json.decode(response.body) as List<dynamic>;
    //loop and convert parsed items to post
    for (var comment in parsed) {
      comments.add(Comment.fromJson(comment));
    }
    return comments;
  }
}
