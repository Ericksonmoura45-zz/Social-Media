import 'package:dio/dio.dart';
import 'package:posts/models/post.dart';

class HomeRepository {
  final Dio dio = Dio();

  Future<List<Post>> getPosts() async {
    final Response resp =
        await dio.get('http://jsonplaceholder.typicode.com/posts');

    final posts = (resp.data as List).map((p) => Post.fromJson(p)).toList();
    return posts;
  }

  getUser(int id) {}
}
