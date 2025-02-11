import 'package:get/get.dart';

class MainBottomNavController extends GetxController{
  int selectedIndex = 0;

  void setIndex (int index){
    selectedIndex = index;
    update();
  }
}


