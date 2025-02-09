import 'package:fharmony/pages/customer/app/modules/customerassitant/customerassistant.dart';
import 'package:get/get.dart';

import '../../../farmer/farmerlogin.dart';
import '../../../home.dart';
import '../../../organizerlogin.dart';
import '../../customerlogin.dart';
import '../../customersignup.dart';
import '../../customersignup2.dart';
import '../../customerintro.dart';
import '../../passwordreset.dart';
import '../../passwordresetmailresend.dart';
import '../modules/Fruitsproducts/bindings/fruitsproducts_binding.dart';
import '../modules/Fruitsproducts/views/fruitsproducts_view.dart';
import '../modules/Grainsproducts/bindings/grainsproducts_binding.dart';
import '../modules/Grainsproducts/views/grainsproducts_view.dart';
import '../modules/Meatsproducts/bindings/meatsproducts_binding.dart';
import '../modules/Meatsproducts/views/meatsproducts_view.dart';
import '../modules/base/bindings/base_binding.dart';
import '../modules/base/views/base_view.dart';
import '../modules/calendar/bindings/calendar_binding.dart';
import '../modules/calendar/views/calendar_view.dart';
import '../modules/cart/bindings/cart_binding.dart';
import '../modules/cart/views/cart_view.dart';
import '../modules/customerhome/bindings/home_binding.dart';
import '../modules/customerhome/views/home_view.dart';
import '../modules/product_details/bindings/product_details_binding.dart';
import '../modules/product_details/views/product_details_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../../editprofile.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/track/bindings/track_binding.dart';
import '../modules/track/views/track_view.dart';
import '../modules/vegetablesproducts/bindings/vegetablesproducts_binding.dart';
import '../modules/vegetablesproducts/views/vegetablesproducts_view.dart';
import '../modules/welcome/bindings/welcome_binding.dart';
import '../modules/welcome/views/welcome_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.WELCOME,
      page: () => const WelcomeView(),
      binding: WelcomeBinding(),
    ),
    GetPage(
      name: _Paths.BASE,
      page: () => const BaseView(),
      binding: BaseBinding(),
    ),
    GetPage(
      name: _Paths.CHOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.CART,
      page: () => const CartView(),
      binding: CartBinding(),
    ),
    GetPage(
      name: _Paths.PRODUCT_DETAILS,
      page: () => const ProductDetailsView(),
      binding: ProductDetailsBinding(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 250),
    ),
    GetPage(
      name: _Paths.TRACK,
      page: () => const TrackView(),
      binding: TrackBinding(),
    ),

    GetPage(
      name: _Paths.CALENDAR,
      page: () => const CalendarView(),
      binding: CalendarBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.VEGETABLESPRODUCTS,
      page: () => const VegetablesProductsView(),
      binding: VegetablesProductsBinding(),
    ),
    GetPage(
      name: _Paths.FRUITSPRODUCTS,
      page: () => const FruitsProductsView(),
      binding: FruitsProductsBinding(),
    ),
    GetPage(
      name: _Paths.GRAINSPRODUCTS,
      page: () => const GrainsProductsView(),
      binding: GrainsProductsBinding(),
    ),
    GetPage(
      name: _Paths.MEATSPRODUCTS,
      page: () => const MeatsProductsView(),
      binding: MeatsProductsBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => Home(),
      //binding: ProductsBinding(),
    ),
    GetPage(
      name: _Paths.CUSTOMERLOGIN,
      page: () => CustomerLogin(),
     // binding: ProductsBinding(),
    ),
    GetPage(
      name: _Paths.FARMERLOGIN,
      page: () => FarmerLogin(),
    //  binding: ProductsBinding(),
    ),
    GetPage(
      name: _Paths.ORGANIZATIONLOGIN,
      page: () => OrganizerLogin(),
    //  binding: ProductsBinding(),
    ),
    GetPage(
      name: _Paths.CUSTOMERSIGNUP,
      page: () => CustomerSignUp(),
     // binding: ProductsBinding(),
    ), GetPage(
      name: _Paths.CUSTOMERSIGNUP2,
      page: () => CustomerSignUp2(),
     // binding: ProductsBinding(),
    ), GetPage(
      name: _Paths.CUSTOMERINTRO,
      page: () => CustomerIntro(),
    //  binding: ProductsBinding(),
    ), GetPage(
      name: _Paths.PASSWORDRESET,
      page: () => ResetPwPage(),
      //binding: ProductsBinding(),
    ),
    GetPage(
      name: _Paths.PASSWORDRESETMAILRESEND,
      page: () => const PasswordResetResentPage(mail: '',),
      binding: VegetablesProductsBinding(),
    ),
    GetPage(
      name: _Paths.EDITPROFILE,
      page: () => EditProfile(),
     // page: () => EditProfile(docId: '',),
      //binding: ProductsBinding(),
    ),
    GetPage(
      name: _Paths.CUSTOMERASSISTANT,
      page: () => CustomerAssistant()
  ),
      // page: () => EditProfile(docId: '',),
      //binding: ProductsBinding(),














  ];
}
