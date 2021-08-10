import 'dart:convert';
//Packages
import 'package:ez_movie/services/http_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';

//Services
import '../services/http_service.dart';
import '../services/movie_service.dart';

//Model
import '../models/app_config.dart';

class SplashPage extends StatefulWidget {
  final VoidCallback onInitializationComplete;

  const SplashPage({
    required Key key,
    required this.onInitializationComplete,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SplashPageState();
  }
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2)).then(
      (_) => _setup(context).then(
        (_) => widget.onInitializationComplete(),
      ),
    );
  }

  Future<void> _setup(BuildContext context) async {
    final getIt = GetIt.instance;

    final configFile = await rootBundle.loadString('assets/config/main.json');
    final configData = jsonDecode(configFile);

    getIt.registerSingleton<AppConfig>(
      AppConfig(
        BASE_API_URL: configData['BASE_API_URL'],
        BASE_IMAGE_API_URL: configData['BASE_IMAGE_API_URL'],
        API_KEY: configData['API_KEY'],
      ),
    );

    getIt.registerSingleton<HTTPService>(
      HTTPService(),
    );

    getIt.registerSingleton<MovieService>(
      MovieService(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EZMovie',
      theme: ThemeData(primaryColor: Colors.blue),
      home: Center(
        child: Container(
          height: 200,
          width: 200,
          decoration: BoxDecoration(
              image: DecorationImage(
            fit: BoxFit.contain,
            image: AssetImage('assets/images/logo.png'),
          )),
        ),
      ),
    );
  }
}
