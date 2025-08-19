// Project imports:

abstract class WatchNowEvent {
  const WatchNowEvent();
}

class GetNowPlaying extends WatchNowEvent {
  final int page;
  final bool loadMore;
  const GetNowPlaying({this.page = 1,this.loadMore = false});
}
class GetTrending extends WatchNowEvent {
  final int page;
  final bool loadMore;
  const GetTrending({this.page = 1,this.loadMore = false});
}
