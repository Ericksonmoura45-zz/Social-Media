import 'package:mobx/mobx.dart';
import 'package:posts/enum/status.dart';
import 'package:posts/models/post.dart';
import 'package:posts/models/user.dart';
import 'package:posts/models/comment.dart';
import 'home_repository.dart';
part 'home_controller.g.dart';

class HomeController = HomeControllerBase with _$HomeController;

abstract class HomeControllerBase with Store {
  final _homeRepository = HomeRepository();
  @observable
  Status posts_status = Status.EMPTY;
  /* enum para controle dos observables */

  List<Post> posts = [];
  List<User> users = [];
  List<Comment> comments = [];

  @action

  /// Função para carregar os Posts da API
  Future getPosts() async {
    posts_status = Status.LOADING;
    posts = await _homeRepository.getPosts();
    users = await _homeRepository.getUsers();
    comments = await _homeRepository.getComments();
    fillPostWithUser();
    fillPostWithComment();
    posts_status = Status.LOADED;
  }

  ///Função para buscar o dados de um usuário por seu ID
  User getUserById(int userID) {
    return users.firstWhere((user) => user.id == userID);
  }

  Post getPostById(int postID) {
    return posts.firstWhere((post) => post.id == postID);
  }

  ///Carregamos todos os posts referêntes ao usuário
  void fillPostWithUser() {
    for (var p in posts) {
      final User user = getUserById(p.userId);
      p.user = user;
    }
  }

  void fillPostWithComment() {
    for (var c in comments) {
      final Post post = getPostById(c.postId);
      post.comments.add(c);
    }
  }
}
