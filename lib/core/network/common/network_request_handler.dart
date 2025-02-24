import 'package:app_5_news_app/core/app_exports.dart';


Future<Result<T>>executeRequest<T>({required Future<T> Function() methodCall}) async {
  try {
    final result = await methodCall.call();
    print("1");
    return Success(data: result);
  } on Exception catch (e) {
    print("2");
    return Error(exception: e);
  }catch(e){
    print("errro :$e");
    return Error(exception: Exception("Something went wrong"));
  }
}