import 'package:flutter/material.dart';

import '../config/colors.dart';

class OfflineWidget extends StatelessWidget {
  const OfflineWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: AppColors.myDark,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 50,
            ),
            Image.asset('assets/images/offline.png'),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Can\'t connect ... please connect to the network to load the new data',
                style: TextStyle(fontSize: 18, color: AppColors.myGrey),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
