import 'package:bill/history/data/models/post.dart';
import 'package:bill/history/data/repositories/posts_respository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'posts_state.dart';

class PostsCubit extends Cubit<PostsState> {
  PostsCubit(this.repository) : super(PostsInitial());

  int page = 1;
  final PostsRepository repository;

  void loadPosts() async {
    if (state is PostsLoading) return;

    final currentState = state;

    var oldPosts = <Post>[];
    if (currentState is PostsLoaded) {
      oldPosts = currentState.posts;
    }

    emit(PostsLoading(oldPosts, isFirstFetch: page == 1));

    // repository.fetchPosts(page).then((newPosts) {
    //   page++;

    //   final posts = (state as PostsLoading).oldPosts;
    //   posts.addAll(newPosts);

    //   emit(PostsLoaded(posts));
    // });
    repository.fetchHistory(page).then((newPosts) {
      page++;
      final posts = (state as PostsLoading).oldPosts;
      posts.addAll(newPosts);

      emit(PostsLoaded(posts));
    });
  }
}
