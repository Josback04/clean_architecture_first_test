import 'package:clena_architecture_test/core/resources/data_state.dart';
import 'package:clena_architecture_test/core/usecases/usecase.dart';
// import 'package:clena_architecture_test/features/daily_news/data/repository/article_repository_impl.dart';
import 'package:clena_architecture_test/features/daily_news/domain/entities/article.dart';
import 'package:clena_architecture_test/features/daily_news/domain/repository/article_repository.dart';

class GetArticleUseCase
    implements UseCase<DataState<List<ArticleEntity>>, void> {
  final ArticleRepository _articleRepository;
  GetArticleUseCase(this._articleRepository);
  @override
  Future<DataState<List<ArticleEntity>>> call({void params}) {
    // TODO: implement call
    return _articleRepository.getNewsArticle();
  }
}
