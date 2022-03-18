import 'package:feribot_lines/models/ferry/search_model.dart';
import 'package:feribot_lines/models/key_value_model.dart';
import 'package:feribot_lines/services/ferry_services.dart';
import 'package:get/get.dart';

class FerryScreenVM extends GetxController {
  RxBool choosePassengers = false.obs;

  Rx<List<KeyValue>> deperturePorts = Rx([]);

  Rx<List<KeyValue>> arrivePorts = Rx([]);

  init() {
    FerryServices.getDeperturePorts().then((value) {
      deperturePorts.value = value;
      deperturePorts.refresh();
      SearchModel.deperturePort.value = deperturePorts.value.first;
    });

    FerryServices.getArrivePorts(SearchModel.deperturePort.value.key)
        .then((value) {
      arrivePorts.value = value;
      arrivePorts.refresh();
      SearchModel.arrivePort.value = arrivePorts.value.first;
    });
  }
}
