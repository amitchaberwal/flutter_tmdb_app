// Project imports:

abstract class SearchEvent {
  const SearchEvent();
}

class GetSearchResult extends SearchEvent {
  final int page;
  final String query;
  final bool loadMore;
  const GetSearchResult({this.page = 1,this.loadMore = false,required this.query});
}
