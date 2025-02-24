sealed class Result<T> {}

class Success<T> extends Result<T> {
  final T data;
   Success({required this.data});
}

class Error<T> extends Result<T> {
  final Exception exception;
   Error({required this.exception});
}
