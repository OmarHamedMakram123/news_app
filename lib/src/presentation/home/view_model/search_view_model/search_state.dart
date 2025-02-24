part of 'search_cubit.dart';

@immutable
sealed class SearchState {}

final class SearchInitial extends SearchState {}
class GetNewsSearchSuccessState extends SearchState {}
class GetNewsSearchLoadingState extends SearchState {}
class GetNewsSearchErrorState extends SearchState {
  final Exception exception;
  GetNewsSearchErrorState(this.exception);
}