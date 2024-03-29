import 'package:feribot_lines/models/user.dart';
import 'package:feribot_lines/viewModels/ferry/ferry_consolidations_vm.dart';
import 'package:feribot_lines/viewModels/ferry/ferry_information_vm.dart';
import 'package:get/get.dart';

import '../../models/ferry/search_model.dart';
import '../../views/login/login.dart';
import '../../views/profile/profile.dart';

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

  String carType() {
    switch (SearchModel.carType.value) {
      case 0:
        return "Araçsız";
      case 1:
        return "Bisiklet";
      case 2:
        return "Motorsiklet";
      case 3:
        return "Otomobil";
      case 4:
        return "Minibüs";
      case 5:
        return "Otobüs";
      default:
        return "";
    }
  }

  RxString passengersAndCars({String joinString = " ", int type = 0}) {
    switch (type) {
      case 0:
        int _count = 0;
        String _return = "";
        _count += SearchModel.adultCount.value;
        _count += SearchModel.childCount.value;
        _count += SearchModel.babyCount.value;
        _return = "$_count Yolcu,";
        if (SearchModel.carCount > 0 && SearchModel.carType.value != 0) {
          _return += SearchModel.carCount.value.toString() + " " + carType();
        } else {
          _return += " Araçsız";
        }
        return _return.obs;
      case 1:
        List<String> _list = [];
        _list.add(SearchModel.adultCount.value.toString() + " Yetişkin");
        _list.add(SearchModel.childCount.value.toString() + " Çocuk");
        _list.add(SearchModel.babyCount.value.toString() + " Bebek");

        if (SearchModel.carCount > 0 && SearchModel.carType.value != 0) {
          _list.add(SearchModel.carCount.value.toString() + " " + carType());
        } else {
          _list.add("Araçsız");
        }
        return _list.join(joinString).obs;
      default:
        return "".obs;
    }
  }

  void openProfile() {
    if (USER_old.isLogined) {
      Get.to(
        () => Profile(),
        duration: Duration(milliseconds: 300),
        transition: Transition.rightToLeft,
      );
    } else {
      Get.offAll(
        () => Login(),
        duration: Duration(milliseconds: 300),
        transition: Transition.rightToLeft,
      );
    }
  }

  void init() {
    Get.put(FerryInformationVM());
    Get.put(FerryConsolidationsVM());
  }
}
