import 'package:clena_architecture_test/core/resources/data_state.dart';
import 'package:clena_architecture_test/features/daily_news/domain/usecase/get_article.dart';
import 'package:clena_architecture_test/features/daily_news/presentation/bloc/article/remote/remote_article_event.dart';
import 'package:clena_architecture_test/features/daily_news/presentation/bloc/article/remote/remote_article_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RemoteArticlesBloc
    extends Bloc<RemoteArticlesEvent, RemoteArticlesState> {
  final GetArticleUseCase _getArticleUseCase;
  RemoteArticlesBloc(this._getArticleUseCase)
      : super(const RemoteArticleLoading()) {
    on<GetArticles>(onGetArticles);
  }

  Future<void> onGetArticles(
      GetArticles events, Emitter<RemoteArticlesState> emit) async {
    final dataState = await _getArticleUseCase();
    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(RemoteArticleDone(dataState.data!));
    }

    if (dataState is DataError) {
      emit(RemoteArticleError(dataState.error!));
    }
  }
}
