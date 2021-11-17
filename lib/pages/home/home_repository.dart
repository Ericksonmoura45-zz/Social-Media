import 'package:dio/dio.dart';
import 'package:posts/models/post.dart';
import 'package:posts/models/user.dart';
import 'package:posts/models/comment.dart';

class HomeRepository {
  final Dio dio = Dio();

  Future<List<Post>> getPosts() async {
    final Response resp =
        await dio.get('http://jsonplaceholder.typicode.com/posts');

    final posts = (resp.data as List).map((p) => Post.fromJson(p)).toList();
    return posts;
  }

  Future<List<User>> getUsers() async {
    final Response resp =
        await dio.get('http://jsonplaceholder.typicode.com/users');
    final users = (resp.data as List).map((p) => User.fromJson(p)).toList();
    return users;
  }

  Future<List<Comment>> getComments() async {
    final Response resp =
        await dio.get('http://jsonplaceholder.typicode.com/comments');
    final comment =
        (resp.data as List).map((p) => Comment.fromJson(p)).toList();
    return comment;
  }
}
