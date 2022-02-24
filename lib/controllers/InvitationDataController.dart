import 'package:get/get.dart';

class InvitationDataController extends GetxController {
  //vars
  var name = "أحمد".obs;
  var day = "أحمد".obs;
  var month = "أحمد".obs;
  var city = "أحمد".obs;

  //set functions
  void setName(String value) {
    name.value = value;
    refresh();
  }

  void setDay(String value) {
    day.value = value;
    refresh();
  }

  void setMonth(String value) {
    month.value = value;
    refresh();
  }

  void setCity(String value) {
    city.value = value;
    refresh();
  }

  //get functions
  get currentName => name.value;
  get currentDay => day.value;
  get currentMonth => month.value;
  get currentCity => city.value;
}
