import 'package:feribot_lines/models/ferry/consolidation_model.dart';
import 'package:feribot_lines/models/ferry/search_model.dart';
import 'package:feribot_lines/models/key_value_model.dart';
import 'package:get/get.dart';

class FerryServices {
  static Future<List<ConsolidationModel>> searchTrip(
      int searchType /* 0 => gidiş, 1 => dönüş */) async {
    // TODO modeldeki tek yön, açık bilet bilgise göre doldur
    List<ConsolidationModel> _searchResults = [];
    await Future.delayed(const Duration(seconds: 2), () {
      return [
        ConsolidationModel(
          consolidationID: 1,
          arriveDate: DateTime.now(),
          depertureDate: DateTime.now(),
          totalTime: DateTime.now(),
          deperturePort: KeyValue(1, "FETHİYE"),
          arrivePort: KeyValue(1, "RODOS"),
          companyName: "UZUN ŞİRKET İSMİ",
          ferryName: "UZUN FERİBOT İSMİ",
          isSelected: false.obs,
          price: 634.5,
        ),
        ConsolidationModel(
          consolidationID: 2,
          arriveDate: DateTime.now(),
          depertureDate: DateTime.now(),
          totalTime: DateTime.now(),
          deperturePort: KeyValue(1, "FETHİYE"),
          arrivePort: KeyValue(1, "RODOS"),
          companyName: "UZUN ŞİRKET İSMİ",
          ferryName: "UZUN FERİBOT İSMİ",
          isSelected: false.obs,
          price: 634.5,
        ),
        ConsolidationModel(
          consolidationID: 3,
          arriveDate: DateTime.now(),
          depertureDate: DateTime.now(),
          totalTime: DateTime.now(),
          deperturePort: KeyValue(1, "FETHİYE"),
          arrivePort: KeyValue(1, "RODOS"),
          companyName: "UZUN ŞİRKET İSMİ",
          ferryName: "UZUN FERİBOT İSMİ",
          isSelected: false.obs,
          price: 634.5,
        ),
      ];
    }).then((value) => _searchResults = value);
    return _searchResults;
  }

  static Future<List<KeyValue>> getDeperturePorts() async {
    return [
      KeyValue(0, "Fethiye"),
      KeyValue(1, "Atina"),
      KeyValue(2, "Ayvalık"),
      KeyValue(3, "Bodrum"),
      KeyValue(4, "Çeşme"),
      KeyValue(5, "Didim"),
    ];
  }

  static Future<List<KeyValue>> getArrivePorts(int deperturePort) async {
    return [
      KeyValue(0, "Paros"),
      KeyValue(1, "Patmos"),
      KeyValue(2, "Rodos"),
      KeyValue(3, "Sakarya"),
      KeyValue(4, "Sarız"),
      KeyValue(5, "Samoz"),
    ];
  }
}
