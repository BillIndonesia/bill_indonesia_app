import 'dart:async';

import 'package:bill/history/cubit/posts_cubit.dart';
import 'package:bill/history/data/models/post.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import 'items/history_item.dart';

class HistoryList extends StatelessWidget {
  final scrollController;
  const HistoryList({Key? key, this.scrollController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostsCubit, PostsState>(
      builder: (context, state) {
        if (state is PostsLoading && state.isFirstFetch) {
          return _loadingIndicator(context);
        }

        List<Post> posts = [];
        bool isLoading = false;

        if (state is PostsLoading) {
          posts = state.oldPosts;
          isLoading = true;
        } else if (state is PostsLoaded) {
          posts = state.posts;
        }

        return posts.isEmpty
            ? Center(
                child: Lottie.asset(
                  'assets/lottie/empty.json',
                  fit: BoxFit.cover,
                ),
              )
            : ListView.separated(
                controller: scrollController,
                itemBuilder: (context, index) {
                  if (index < posts.length)
                    return HistoryItemCard(post: posts[index]);
                  else {
                    Timer(
                      Duration(milliseconds: 30),
                      () {
                        scrollController
                            .jumpTo(scrollController.position.maxScrollExtent);
                      },
                    );

                    return _loadingIndicator(context);
                  }
                },
                separatorBuilder: (context, index) {
                  return Divider(
                    color: Colors.grey[400],
                  );
                },
                itemCount: posts.length + (isLoading ? 1 : 0),
              );
      },
    );
  }
}

Widget _loadingIndicator(context) {
  return Center(
    child: Container(
      height: MediaQuery.of(context).size.height * 0.05,
      alignment: Alignment.center,
      child: Lottie.asset(
        'assets/lottie/loading_Lottie.json',
        fit: BoxFit.cover,
      ),
    ),
  );
}
