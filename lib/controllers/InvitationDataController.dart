import 'package:get/get.dart';

class InvitationDataController extends GetxController {
  //vars
  var name = "أحمد".obs;
  var day = "19".obs;
  var month = "فبراير".obs;
  var city = "الرياض".obs;
  var imageUrl = "images/dash_1.png".obs;

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

  void setImageUrl(String value) {
    imageUrl.value = value;
    refresh();
  }

  //get functions
  get currentName => name.value;
  get currentDay => day.value;
  get currentMonth => month.value;
  get currentCity => city.value;
  get currentImageUrl => imageUrl.value;
}
