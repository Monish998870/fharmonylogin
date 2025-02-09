import 'package:get/get.dart';
import '../../calendar/controllers/calendar_controller.dart';
import '../../customerhome/controllers/home_controller.dart';
import '../../profile/controllers/profile_controller.dart';
import '../../track/controllers/track_controller.dart';
import '../controllers/base_controller.dart';

class BaseBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BaseController>(() => BaseController());
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<TrackController>(() => TrackController());
    Get.lazyPut<CalendarController>(() => CalendarController());
    Get.lazyPut<ProfileController>(() => ProfileController());
  }
}
