import 'dart:io';

import 'package:clena_architecture_test/core/constants/constants.dart';
import 'package:clena_architecture_test/core/resources/data_state.dart';
import 'package:clena_architecture_test/features/daily_news/data/data_sources/remote/news_api_service.dart';
import 'package:clena_architecture_test/features/daily_news/data/models/article.dart';
import 'package:clena_architecture_test/features/daily_news/domain/repository/article_repository.dart';
import 'package:dio/dio.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  final NewsApiService _newsApiService;

  ArticleRepositoryImpl(this._newsApiService);

  @override
  Future<DataState<List<ArticleModel>>> getNewsArticle() async {
    // TODO: implement getNewsArticle
    try {
      final httpResponse = await _newsApiService.getNewsArticle(
          apiKey: newsApiKey, country: countryQuery, category: categoryQuery);

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataError(DioException(
          requestOptions: httpResponse.response.requestOptions,
          error: httpResponse.response.statusMessage,
          response: httpResponse.response,
        ));
      }
    } on DioException catch (e) {
      return DataError(e);
    }
  }
}
