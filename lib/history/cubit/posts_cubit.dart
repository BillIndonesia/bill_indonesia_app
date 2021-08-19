import 'package:bill/history/data/models/post.dart';
import 'package:bill/history/data/repositories/posts_respository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'posts_state.dart';

class PostsCubit extends Cubit<PostsState> {
  PostsCubit(this.repository) : super(PostsInitial());

  int page = 1;
  int filteredPage = 1;
  final PostsRepository repository;

  Future<void> loadPosts() async {
    if (state is PostsLoading) return;

    final currentState = state;

    var oldPosts = <Post>[];
    if (currentState is PostsLoaded) {
      oldPosts = currentState.posts;
    }

    emit(PostsLoading(oldPosts, isFirstFetch: page == 1));
    repository.fetchHistory(page: page).then((newPosts) {
      page++;
      final posts = (state as PostsLoading).oldPosts;
      posts.addAll(newPosts);

      emit(PostsLoaded(posts));
    });
  }

  Future<void> loadFilteredPosts({
    required String startDate,
    required String endDate,
    required bool topup,
    required bool payment,
  }) async {
    if (state is PostsLoading) return;

    final currentState = state;

    var oldPosts = <Post>[];
    if (currentState is PostsLoaded) {
      oldPosts = currentState.posts;
    }

    emit(PostsLoading(oldPosts, isFirstFetch: filteredPage == 1));

    repository
        .fetchFilteredHistory(
      page: filteredPage,
      startDate: startDate,
      endDate: endDate,
      topup: topup,
      payment: payment,
    )
        .then((newPosts) {
      filteredPage++;
      final posts = (state as PostsLoading).oldPosts;
      posts.addAll(newPosts);

      emit(PostsLoaded(posts));
    });
  }

  void clearPosts() async {
    final posts = (state as PostsLoaded).posts;
    page = 1;
    filteredPage = 1;
    posts.clear();
    emit(PostsLoaded(posts));
  }
}
