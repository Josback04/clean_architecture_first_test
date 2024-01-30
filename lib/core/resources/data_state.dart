import 'package:dio/dio.dart';

abstract class DataState<T> {
  final T? data;
  final DioException? error;

  const DataState({this.data, this.error});
}

//reponse avec succès
class DataSuccess<T> extends DataState<T> {
  const DataSuccess(T data) : super(data: data);
}

//reponse avec pasde succèsk
class DataError<T> extends DataState<T> {
  const DataError(DioException data) : super(error: data);
}
