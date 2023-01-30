import 'package:feribot_lines/models/response/ferry/search_trip_response.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../models/ferry/consolidation_model.dart';
import '../viewModels/ferry/ferry_consolidations_vm.dart';
import 'ferry_ticket.dart';

class FerryTicketsList extends StatelessWidget {
  FerryTicketsList(this.data, {Key? key}) : super(key: key);

  final List<Trip> data;
  final FerryConsolidationsVM _vm = Get.put(FerryConsolidationsVM());

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(0),
      shrinkWrap: true,
      children: data
          .map(
            (item) => FerryTicket(
              price: item.totalAmount?.toDouble() ?? 0.toDouble(),
              exchange: item.exchangeCode ?? "",
              departurePort: item.departurePortName ?? "",
              arrivePort: item.arrivePortName ?? "",
              bestPriceGuarantee: item.bestPriceGuarantee == "1",
              departureTime:
                  DateFormat("hh:mm", "tr_TR").format(DateTime.now()),
              departureDate:
                  DateFormat("dd MMM EEE", "tr_TR").format(DateTime.now()),
              arrivalTime: DateFormat("hh:mm", "tr_TR").format(DateTime.now()),
              arrivalDate:
                  DateFormat("dd MMM EEE", "tr_TR").format(DateTime.now()),
              totalTime: DateFormat("hh", "tr_TR").format(DateTime.now()) +
                  " Saat " +
                  DateFormat("mm", "tr_TR").format(DateTime.now()) +
                  " Dakika",
              companyName: item.companyName ?? "",
              companyLogoPath: item.companyLogo ??
                  "https://feribotlines.com/static/app/img/header/feribotlines_logo.svg",
              ferryName: item.ferryName?.split("/")[1].trim() ?? "",
              isSelected: item.isSelected ?? false.obs,
              onTap: () {
                if (item.isSelected!.value) {
                  item.isSelected!.value = false;
                  _vm.selectConsolidation(null);
                } else {
                  List<Trip> _selectedItems = data
                      .where((element) => element.isSelected!.value == true)
                      .toList();

                  if (_selectedItems.isNotEmpty) {
                    for (var _ in _selectedItems) {
                      _.isSelected!.value = false;
                    }
                  }

                  item.isSelected!.value = true;
                  _vm.selectConsolidation(item);
                }
              },
            ),
          )
          .toList(),
    );
  }
}
