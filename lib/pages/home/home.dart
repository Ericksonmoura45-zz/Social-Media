import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:posts/pages/post/post_details.dart/post_details.dart';
import 'package:posts/widgets/post_widget.dart';

import 'home_controller.dart';

class FeedPage extends StatelessWidget {
  const FeedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = HomeController();
    controller.getPosts();

    return Scaffold(
      appBar: AppBar(title: Text('Posts')),
      body: Observer(
        builder: (context) {
          return ListView(
            children: getListaPosts(controller, context),
          );
        },
      ),
    );
  }

  List<Widget> getListaPosts(HomeController controller, BuildContext context) {
    return controller.posts
        .map(
          (p) => GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute<void>(
                  builder: (_) => PostDetail(post: p),
                ),
              );
            },
            child: PostWidget(post: p),
          ),
        )
        .toList();
  }
}
