import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/no_data.dart';
import '../controllers/track_controller.dart';

class TrackView extends GetView<TrackController> {
  const TrackView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Track Your Orders', style: context.theme.textTheme.displaySmall),
        centerTitle: true,
      ),
      body: const NoData(text: 'No Internet'),
    );
  }
}