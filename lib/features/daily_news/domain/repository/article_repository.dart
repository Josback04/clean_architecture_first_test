import 'package:clena_architecture_test/core/resources/data_state.dart';
import 'package:clena_architecture_test/features/daily_news/domain/entities/article.dart';

abstract class ArticleRepository {
  Future<DataState<List<ArticleEntity>>> getNewsArticle();
}
