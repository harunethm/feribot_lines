import 'package:feribot_lines/models/ferry/search_model.dart';
import 'package:feribot_lines/models/others/key_value_model.dart';
import 'package:feribot_lines/services/ferry_services.dart';
import 'package:get/get.dart';

class FerryScreenVM extends GetxController {
  RxBool choosePassengers = false.obs;

  Rx<List<KeyValue>> departurePorts = Rx([]);

  Rx<List<KeyValue>> arrivePorts = Rx([]);

  init() {
    updatedeparturePorts();
    updateArrivePorts();
  }

  void updatedeparturePorts() {
    FerryServices.getdeparturePorts().then((value) {
      departurePorts.value =
          value.map((e) => KeyValue(e.id ?? -1, e.name ?? "")).toList();
      departurePorts.refresh();
      if (departurePorts.value.isNotEmpty) {
        SearchModel.departurePort.value = departurePorts.value.first;
        updateArrivePorts();
      }
    });
  }

  void updateArrivePorts() {
    FerryServices.getArrivePorts(SearchModel.departurePort.value.key)
        .then((value) {
      arrivePorts.value =
          value.map((e) => KeyValue(e.id ?? -1, e.name ?? "")).toList();
      arrivePorts.refresh();
      if (arrivePorts.value.isNotEmpty) {
        SearchModel.arrivePort.value = arrivePorts.value.first;
      }
    });
  }
}
