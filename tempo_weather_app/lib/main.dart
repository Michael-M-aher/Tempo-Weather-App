import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'config/strings.dart';

import 'app_route.dart';
import 'bloc/cubit/weather1d_cubit.dart';
import 'bloc/cubit/weather1h_cubit.dart';
import 'bloc/cubit/weather_cubit.dart';
import 'repository/weather_repository.dart';
import 'services/shared_prefs.dart';
import 'services/web_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await sharedPrefs.init();
  runApp(
    WeatherApp(
      appRouter: AppRouter(),
    ), // Wrap your app
  );
}

class WeatherApp extends StatelessWidget {
  final AppRouter appRouter;
  const WeatherApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    WeatherRepository weatherRepository =
        WeatherRepository(WeatherWebService());
    WeatherCubit weatherCubit = WeatherCubit(weatherRepository);
    Weather1hCubit weather1hCubit = Weather1hCubit(weatherRepository);
    Weather1dCubit weather1dCubit = Weather1dCubit(weatherRepository);
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => weatherCubit,
        ),
        BlocProvider(
          create: (context) => weather1hCubit,
        ),
        BlocProvider(
          create: (context) => weather1dCubit,
        ),
      ],
      child: MaterialApp(
        title: 'Tempo-Weather',
        debugShowCheckedModeBanner: false,
        onGenerateRoute: appRouter.generateRoute,
        initialRoute: sharedPrefs.firstOpen ? onboardingScreen : mainScreen,
      ),
    );
  }
}
