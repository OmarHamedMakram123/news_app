sealed class NewsAction{}

class GetSourceAction extends NewsAction{
  final String categoryId;
  GetSourceAction(this.categoryId);
}
class GetNewsAction extends NewsAction{
  final String sourceId;
  GetNewsAction(this.sourceId);
}