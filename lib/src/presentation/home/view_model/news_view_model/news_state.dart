part of 'news_cubit.dart';

sealed class NewsState {}
final class NewsInitial extends NewsState {}
class GetSourceLoadingState extends NewsState {}
class GetSourceSuccessState extends NewsState {}
class GetSourceErrorState extends NewsState {
  final Exception exception;
  GetSourceErrorState({required this.exception});

}



class GetNewsLoadingState extends NewsState {}
class GetNewsSuccessState extends NewsState {}
class GetNewsErrorState extends NewsState {
  final Exception exception;
  GetNewsErrorState(this.exception);
}


class ChangeSourceState extends NewsState {}