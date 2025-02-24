sealed class SearchAction {}

class GetSearchNewUseCase extends SearchAction{
  final String q;
  GetSearchNewUseCase({required this.q});
}