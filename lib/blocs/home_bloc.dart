import 'package:rxdart/rxdart.dart';
import 'package:xlo/models/ad.dart';

class HomeBloc {
  final BehaviorSubject<String> _searchController = BehaviorSubject<String>();

  var outAd;

  Stream<String> get outSearch => _searchController.stream;

  void setSearch(String search) {
    _searchController.add(search);
  }

  void dispose() {
    _searchController.close();
  }

  void addAd(Ad ad) {}
}
