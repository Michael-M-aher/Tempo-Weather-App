import 'package:flutter/material.dart';
import 'package:location_picker_flutter_map/location_picker_flutter_map.dart';

import '../config/colors.dart';
import '../config/strings.dart';
import '../services/shared_prefs.dart';
import '../widgets/loading_widget.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FlutterLocationPicker(
      trackMyPosition: true,
      locationButtonsBackgroundColor: AppColors.myDark,
      locationButtonsColor: AppColors.mycyan,
      zoomButtonsBackgroundColor: AppColors.myDark,
      zoomButtonsColor: AppColors.mycyan,
      selectLocationButtonColor: AppColors.myDark,
      selectLocationTextColor: AppColors.mylightGrey,
      markerIconColor: AppColors.mycyan,
      searchBarBackgroundColor: AppColors.myDark,
      searchBarTextColor: AppColors.mycyan,
      mapIsLoading: const LoadingWidget(),
      mapLoadingBackground: AppColors.myDark,
      urlTemplate:
          'https://tiles.stadiamaps.com/tiles/alidade_smooth_dark/{z}/{x}/{y}.png?api_key=77e3687f-e3f4-47b9-a4c8-aa5f87ab31e4',
      onPicked: (pickedData) {
        sharedPrefs.setAddress(pickedData.latLong);
        sharedPrefs.location = pickedData.latLong;
        Navigator.pushNamedAndRemoveUntil(
            context, settingsScreen, (route) => false);
      },
    ));
  }
}
