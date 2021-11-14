import 'package:mobx/mobx.dart';
import 'package:posts/models/post.dart';

import 'home_repository.dart';

part 'home_controller.g.dart';

class HomeController = HomeControllerBase with _$HomeController;

abstract class HomeControllerBase with Store {
  final _homeRepository = HomeRepository();

  @observable
  List<Post> posts = [];

  @action
  Future getPosts() async {
    posts = await _homeRepository.getPosts();
  }
}
