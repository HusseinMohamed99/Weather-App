import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wakelock/wakelock.dart';
import 'package:weather_app/main_screen.dart';
import 'package:weather_app/weather/data/datasource/remote_datasource.dart';
import 'package:weather_app/weather/data/repository/weather_repository.dart';
import 'package:weather_app/weather/domain/entities/weather.dart';
import 'package:weather_app/weather/domain/repository/base_weather_repository.dart';
import 'package:weather_app/weather/domain/usecase/get_weather_by_country.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Wakelock.enable();
  ScreenUtil.ensureScreenSize();
  BaseRemoteDataSource baseRemoteDataSource = RemoteDataSource();
  BaseWeatherRepository baseWeatherRepository =
      WeatherRepository(baseRemoteDataSource);

  Weather weather =
      await GetWeatherCountryName(baseWeatherRepository).execute("Moscow");
  if (kDebugMode) {
    print("Weather === $weather");
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.portraitUp,
          DeviceOrientation.portraitDown,
        ]);
        return ScreenUtilInit(
          designSize: const Size(360, 690),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            return const MaterialApp(
              debugShowCheckedModeBanner: false,
              home: MainScreen(),
            );
          },
        );
      },
    );
  }
}
