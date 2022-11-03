import 'package:flutter/cupertino.dart';
import 'package:unsplash/entity/models.dart';
import 'package:unsplash/interactor/services.dart';

class ResultsProvider extends ChangeNotifier {
  late SearchPhotos busqueda;
  bool isLoading = false;
  String query = "happiness";
  int page = 1;

  fetchData() async {
    isLoading = true;
    busqueda = await getResults(query, page);
    print(busqueda);
    isLoading = false;
    notifyListeners();
    // return busqueda;
  }
}
