import 'package:get/get.dart';

class TaskItemWidgetController extends GetxController{
  RxString selectedStatus =''.obs;

  void updateStatus(String newStatus){
    selectedStatus.value = newStatus;
    update();
  }
}