import 'package:get/get.dart';

import '../../../../data/providers/local/local_storage.dart';
import '../../../../utils/utils.dart';

class PronosticosController extends GetxController {
  final LocalStorage _localStorage = Get.find<LocalStorage>();

  bool _showScreen = false;
  bool get showScreen => _showScreen;

  @override
  void onInit() {
    checkForecastSave();
    super.onInit();
  }

  void checkForecastSave() async {
    String day = Utils().onlyDate(DateTime.now());
    bool pronosticoRealizado = await _localStorage.getForecastDayDone(day);
    _showScreen = pronosticoRealizado ?? false;
    update(['contenedorGral']);
  }
}
