import 'package:mobx/mobx.dart';
import 'package:posts/enum/status.dart';
import 'package:posts/models/post.dart';
import 'package:posts/models/user.dart';

import 'home_repository.dart';

part 'home_controller.g.dart';

class HomeController = HomeControllerBase with _$HomeController;

abstract class HomeControllerBase with Store {
  final _homeRepository = HomeRepository();
  @observable
  Status posts_status = Status.EMPTY;

  List<Post> posts = [];
  List<User> users = [];
  // List<Comments> comments = [];

  @action

  /// Função para carregar dos os Posts da API
  Future getPosts() async {
    posts_status = Status.LOADING;
    posts = await _homeRepository.getPosts();
    users = await _homeRepository.getUsers();
    PostProcess();
    posts_status = Status.LOADED;
  }

  User getUserById(int userID) {
    return users.firstWhere((user) => user.id == userID);
  }

  PostProcess() {
    for (var p in posts) {
      final User user = getUserById(p.userId);
      p.user = user;
    }
  }
}
