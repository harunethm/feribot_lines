import 'package:feribot_lines/models/ferry/search_model.dart';
import 'package:feribot_lines/models/key_value_model.dart';
import 'package:feribot_lines/services/ferry_services.dart';
import 'package:get/get.dart';

class FerryScreenVM extends GetxController {
  // final FerryVM _ferryVM = Get.put(FerryVM());
  RxBool choosePassengers = false.obs;

  Rx<List<KeyValue>> deperturePorts = Rx([]);

  Rx<List<KeyValue>> arrivePorts = Rx([]);

  init() {
    // deperturePorts = Rx(await FerryServices.getDeperturePorts());

    FerryServices.getDeperturePorts()
        .then((value) => deperturePorts.value = value);
    deperturePorts.refresh();

    // arrivePorts = Rx(
    //     await FerryServices.getArrivePorts(_ferryVM.deperturePort.value.value));
    FerryServices.getArrivePorts(SearchModel.deperturePort.value.key)
        .then((value) => arrivePorts.value = value);
    arrivePorts.refresh();
  }
}
