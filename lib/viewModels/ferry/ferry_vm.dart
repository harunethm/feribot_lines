import 'package:feribot_lines/models/ferry/consolidation_model.dart';
import 'package:feribot_lines/services/ferry_services.dart';
import 'package:get/get.dart';

import '../../models/ferry/search_model.dart';

class FerryVM extends GetxController {
  setCount(int index, int count) {
    switch (index) {
      case 0:
        SearchModel.adultCount.value = count;
        break;
      case 1:
        SearchModel.childCount.value = count;
        break;
      case 2:
        SearchModel.babyCount.value = count;
        break;
      case 3:
        SearchModel.carType.value = count;
        break;
      case 4:
        SearchModel.carCount.value = count;
        break;
      default:
        break;
    }
  }

  String _carType() {
    switch (SearchModel.carType.value) {
      case 0:
        return "Araçsız";
      case 1:
        return "Bisiklet";
      case 2:
        return "Motosiklet";
      case 3:
        return "Otomobil";
      case 4:
        return "Otobüs";
      case 5:
        return "Minibüs";
      default:
        return "";
    }
  }

  RxString get passengersAndCars {
    int _count = 0;
    String _return = "";
    _count += SearchModel.adultCount.value;
    _count += SearchModel.childCount.value;
    _count += SearchModel.babyCount.value;
    _return = "$_count Yolcu,";
    if (SearchModel.carCount > 0 && SearchModel.carType.value != 0) {
      _return += " ${SearchModel.carCount} ${_carType()}";
    } else {
      _return += " Araçsız";
    }

    return _return.obs;
  }

  void init() {}

  Future<List<ConsolidationModel>> searchTrip(
      int tripIndex /* 0 => gidiş, 1 => dönüş */) {
    return FerryServices.searchTrip(
        tripIndex); // TODO direkt return etme kontrolleri yap
  }
}
