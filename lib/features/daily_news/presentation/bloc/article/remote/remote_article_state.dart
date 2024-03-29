import 'package:clena_architecture_test/features/daily_news/domain/entities/article.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

abstract class RemoteArticlesState extends Equatable {
  final List<ArticleEntity>? articles;
  final DioException? error;

  const RemoteArticlesState({this.articles, this.error});

  @override
  List<Object> get props {
    return [articles!, error!];
  }
}

class RemoteArticleLoading extends RemoteArticlesState {
  const RemoteArticleLoading();
}

class RemoteArticleDone extends RemoteArticlesState {
  const RemoteArticleDone(List<ArticleEntity> article)
      : super(articles: article);
}

class RemoteArticleError extends RemoteArticlesState {
  const RemoteArticleError(DioException error) : super(error: error);
}
