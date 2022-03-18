import 'package:feribot_lines/models/ferry/search_model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../models/ferry/consolidation_model.dart';
import '../viewModels/ferry/ferry_consolidations_vm.dart';
import 'ferry_ticket.dart';

class FerryTicketsList extends StatelessWidget {
  FerryTicketsList(this.data, {Key? key}) : super(key: key);

  final List<ConsolidationModel> data;
  final FerryConsolidationsVM _vm = Get.put(FerryConsolidationsVM());

  @override
  Widget build(BuildContext context) {
    if (data.isNotEmpty && _vm.tabController.activeTab.value == 0) {
      return ListView(
        padding: const EdgeInsets.all(0),
        shrinkWrap: true,
        children: data
            .map(
              (item) => FerryTicket(
                price: item.price,
                deperturePort: item.deperturePort.value,
                arrivePort: item.arrivePort.value,
                departureTime:
                    DateFormat("hh:mm", "tr_TR").format(item.depertureDate),
                departureDate: DateFormat("dd MMM EEE", "tr_TR")
                    .format(item.depertureDate),
                arrivalTime:
                    DateFormat("hh:mm", "tr_TR").format(item.arriveDate),
                arrivalDate:
                    DateFormat("dd MMM EEE", "tr_TR").format(item.arriveDate),
                totalTime: DateFormat("hh", "tr_TR").format(item.totalTime) +
                    " Saat " +
                    DateFormat("mm", "tr_TR").format(item.totalTime) +
                    " Dakika",
                companyName: item.companyName,
                companyLogoPath: "",
                ferryName: item.ferryName,
                isSelected: item.isSelected,
                onTap: () {
                  if (item.isSelected.value) {
                    item.isSelected.value = false;
                    _vm.selectConsolidation(0);
                  } else {
                    List<ConsolidationModel> _selectedItems = data
                        .where((element) => element.isSelected.value == true)
                        .toList();

                    if (_selectedItems.isNotEmpty) {
                      for (var _ in _selectedItems) {
                        _.isSelected.value = false;
                      }
                    }

                    item.isSelected.value = true;
                    _vm.selectConsolidation(item.consolidationID);
                  }
                },
              ),
            )
            .toList(),
      );
    } else {
      if (SearchModel.isOpenReturn.value &&
          _vm.tabController.activeTab.value == 1) {
        return Padding(
          padding: const EdgeInsets.all(20),
          child: Card(
            color: Get.theme.backgroundColor,
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/icons/icon_acik_tarih.png"),
                SizedBox(
                  height: Get.size.height * .01,
                ),
                const Text(
                  "Dönüş biletiniz açık tarihlidir.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
        );
      } else {
        return Padding(
          padding: const EdgeInsets.all(20),
          child: Card(
            color: Get.theme.backgroundColor,
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const FaIcon(FontAwesomeIcons.spinner),
                SizedBox(
                  height: Get.size.height * .01,
                ),
                const Text(
                  "Sefer aranıyor ...",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
        );
      }
    }
  }
}
