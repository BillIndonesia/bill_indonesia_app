import 'package:bill/filter/cubit/filter_cubit.dart';
import 'package:bill/history/cubit/posts_cubit.dart';

import 'package:bill/history/view/widgets/history_appbar.dart';
import 'package:bill/history/view/widgets/history_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HistoryContent();
  }
}

class HistoryContent extends StatelessWidget {
  final scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    bool isFiltered = context.watch<FilterCubit>().state.isFiltered;
    var data = context.read<FilterCubit>().state;
    print('state now :$isFiltered');
    // if (isFiltered == false) {
    //   BlocProvider.of<PostsCubit>(context).loadPosts();
    // }
    setupScrollController(context, isFiltered, data);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: HistoryAppBar(),
      body: HistoryList(),
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
