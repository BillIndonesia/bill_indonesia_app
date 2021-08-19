import 'dart:async';

import 'package:bill/filter/cubit/filter_cubit.dart';
import 'package:bill/history/cubit/posts_cubit.dart';
import 'package:bill/history/data/models/post.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import 'items/history_item.dart';

class HistoryList extends StatelessWidget {
  HistoryList({Key? key}) : super(key: key);
  final scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    bool isFiltered = context.watch<FilterCubit>().state.isFiltered;
    var data = context.read<FilterCubit>().state;

    setupScrollController(context, isFiltered, data);
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
                  print(posts.length);
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

  void setupScrollController(context, isFiltered, data) {
    scrollController.addListener(
      () {
        if (scrollController.position.atEdge) {
          if (scrollController.position.pixels != 0) {
            isFiltered
                ? BlocProvider.of<PostsCubit>(context).loadFilteredPosts(
                    startDate: data.startDate,
                    endDate: data.endDate,
                    topup: data.topup,
                    payment: data.payment,
                  )
                : BlocProvider.of<PostsCubit>(context).loadPosts();
          }
        }
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
