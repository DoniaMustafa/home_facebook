import 'dart:io';

import 'package:desktop_window/desktop_window.dart';
import 'package:device_preview/device_preview.dart';
import 'package:facebook_feed/layout/layout_screen.dart';
import 'package:facebook_feed/models/comment_model.dart';
import 'package:facebook_feed/shared/components/cubit/home_cubit.dart';
import 'package:facebook_feed/shared/components/cubit/home_state.dart';
import 'package:facebook_feed/shared/network/remot/dio_helper.dart';
import 'package:facebook_feed/shared/style/them_style.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  // if(Platform.isWindows)
  //   await DesktopWindow.setMinWindowSize(Size(840,840));
  // if(Platform.isMacOS)
  //   await DesktopWindow.setMinWindowSize(Size(840,840));
  //
  // if(Platform.isLinux)
  //   await DesktopWindow.setMinWindowSize(Size(840,840));

  DioHelper();

  runApp(
      DevicePreview(
          enabled: !kReleaseMode,
          builder: (context) => MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => FacebookHomeCubit()
          ..initialController(this)
          ..getPosts()
          ..getUsers(),
        child: BlocConsumer<FacebookHomeCubit, HomeState>(
          listener: (context, state) {},
          builder: (context, state) {
            return MaterialApp(
              locale: DevicePreview.locale(context), // Add the locale here
              builder: DevicePreview.appBuilder, // Add the builder here
              debugShowCheckedModeBanner: false,
              theme: themeData(),
              home: LayoutScreens(),
            );
          },
        ));
  }
}
