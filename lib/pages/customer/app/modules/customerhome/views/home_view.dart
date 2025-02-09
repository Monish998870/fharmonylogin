import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../../../../features/toast.dart';
import '../../../../../home.dart';
import '../../../../utils/constants.dart';
import '../../../components/fruitscategory_item.dart';
import '../../../components/grainscategory_item.dart';
import '../../../components/meatscategory_item.dart';
import '../../../components/vegetablescategory_item.dart';
import '../../../components/custom_form_field.dart';
import '../../../components/custom_icon_button.dart';
import '../../../components/dark_transition.dart';
import '../../../components/product_item.dart';
import '../../customerassitant/customerassistant.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);





    //  firstnamecontroller.text= firstname.isEmpty ? 'Loading...':firstname;
    // lastnamecontroller.text= lastname.isEmpty ? 'Loading...':lastname;
    //phonenumbercontroller.text= phonenumber.isEmpty ? 'Loading...':phonenumber;
    //  emailcontroller.text= email.isEmpty ? 'Loading...':email;
    // passwordcontroller.text= password.isEmpty ? 'Loading...':password;





  @override
  Widget build(BuildContext context) {


    final theme = context.theme;
    return DarkTransition(
      offset: Offset(context.width, -1),
      isDark: !controller.isLightTheme,
      builder: (context, _) => Scaffold(
        body: Stack(
          children: [
            Positioned(
              top: -100.h,
              child: SvgPicture.asset(
                Constants.container,
                fit: BoxFit.fill,
                color: theme.canvasColor,
              ),
            ),
            ListView(
              children: [
                Column(
                  children: [
                    ListTile(
                      contentPadding: EdgeInsets.symmetric(horizontal: 24.w),
                      title: Text(
                        'Good morning',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          fontSize: 12.sp
                        ),
                      ),
                      subtitle: Text(
                        "Buddy",
                        style: theme.textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      leading: ProfileIcon(),
                      trailing: CustomIconButton(
                        onPressed: () => controller.onChangeThemePressed(),
                        backgroundColor: theme.primaryColorDark,
                        icon: GetBuilder<HomeController>(
                          id: 'Theme',
                          builder: (_) => Icon(
                            controller.isLightTheme
                              ? Icons.dark_mode_outlined
                              : Icons.light_mode_outlined,
                            color: theme.appBarTheme.iconTheme?.color,
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                    10.verticalSpace,
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      child: CustomFormField(
                        backgroundColor: theme.primaryColorDark,
                        textSize: 14.sp,
                        hint: 'Search category',
                        hintFontSize: 14.sp,
                        hintColor: theme.hintColor,
                        maxLines: 1,
                        borderRound: 60.r,
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 10.h,
                          horizontal: 10.w
                        ),
                        focusedBorderColor: Colors.transparent,
                        isSearchField: true,
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.search,
                        prefixIcon: Icon(
                          Icons.search,
                          color: theme.appBarTheme.iconTheme?.color,
                          size: 24.0,
                          semanticLabel: 'Text to announce in accessibility modes',
                        ),
                      ),
                    ),
                    20.verticalSpace,
                    SizedBox(
                      width: double.infinity,
                      height: 158.h,
                      child: CarouselSlider.builder(
                        options: CarouselOptions(
                          initialPage: 1,
                          viewportFraction: 0.9,
                          enableInfiniteScroll: true,
                          autoPlay: true,
                          autoPlayInterval: const Duration(seconds: 3),
                        ),
                        itemCount: controller.cards.length,
                        itemBuilder: (context, itemIndex, pageViewIndex) {
                          return Image.asset(controller.cards[itemIndex]);
                        },
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Column(
                    children: [
                      20.verticalSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Categories 😋',
                            style: theme.textTheme.headlineMedium,
                          ),
                          Text(
                            'See all',
                            style: theme.textTheme.titleLarge?.copyWith(
                              color: theme.primaryColor,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                      16.verticalSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: controller.categories.map((category) {
                        if(category.title=="Vegetables"){
                          return VegetablesCategoryItem(category: category);}
                        if(category.title=="Fruits"){
                          return FruitsCategoryItem(category: category);}
                        if(category.title=="Grains"){
                          return GrainsCategoryItem(category: category);}
                        if(category.title=="Meats"){
                          return MeatsCategoryItem(category: category);}
                        return VegetablesCategoryItem(category: category);

                        }).toList(),
                      ),
                      20.verticalSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Best selling 🔥',
                            style: theme.textTheme.headlineMedium,
                          ),
                          Text(
                            'See all',
                            style: theme.textTheme.titleLarge?.copyWith(
                              color: theme.primaryColor,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                      16.verticalSpace,
                      GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 16.w,
                          mainAxisSpacing: 16.h,
                          mainAxisExtent: 214.h,
                        ),
                        shrinkWrap: true,
                        primary: false,
                        itemCount: 2,
                        itemBuilder: (context, index) => ProductItem(
                          product: controller.bestproducts[index],
                        ),
                      ),
                      20.verticalSpace,
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
class ProfileIcon extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return PopupMenuButton<String>(
      color: theme.scaffoldBackgroundColor,
      icon: CircleAvatar(
        backgroundImage: AssetImage("assets/images/avatar2.jpg"),
      ),
      offset: Offset(0, 50),

      onSelected: (String result) {
        if (result=='MediMate')
          Navigator.push(context, MaterialPageRoute(builder: (context) => CustomerAssistant()));

        else {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home()));
          showToastMsg(message: "Successfully Logout");
        }


      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[

        PopupMenuItem<String>(
          value: 'MediMate',
          child: Text('Assistant',style: context.textTheme.headlineMedium,),
        ),
        PopupMenuItem<String>(
          value: 'Logout',
          child: Text('Logout',style: context.textTheme.headlineMedium,),
        ),
      ],
    );
  }
}