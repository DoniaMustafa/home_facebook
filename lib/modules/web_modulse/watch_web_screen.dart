import 'package:facebook_feed/shared/components/cubit/home_cubit.dart';
import 'package:facebook_feed/shared/components/cubit/home_state.dart';
import 'package:facebook_feed/shared/style/font_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class WatchDiskTobScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FacebookHomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: Container(
            child: Text('Watch'),
          ),

        );
      },
    );
  }
}
