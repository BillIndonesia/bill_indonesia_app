import 'package:bill/history/cubit/posts_cubit.dart';

import 'package:bill/history/data/repositories/posts_respository.dart';
import 'package:bill/history/data/services/posts_service.dart';
import 'package:bill/history/view/widgets/history_appbar.dart';
import 'package:bill/history/view/widgets/history_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PostsCubit(
        PostsRepository(PostsService()),
      ),
      child: HistoryContent(),
    );
  }
}

class HistoryContent extends StatelessWidget {
  final scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    setupScrollController(context);
    BlocProvider.of<PostsCubit>(context).loadPosts();

    return Scaffold(
      appBar: HistoryAppBar(),
      body: HistoryList(
        scrollController: scrollController,
      ),
    );
  }

  void setupScrollController(context) {
    scrollController.addListener(
      () {
        if (scrollController.position.atEdge) {
          if (scrollController.position.pixels != 0) {
            BlocProvider.of<PostsCubit>(context).loadPosts();
          }
        }
      },
    );
  }
}
