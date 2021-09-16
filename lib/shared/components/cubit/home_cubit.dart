import 'package:dio/dio.dart';
import 'package:facebook_feed/models/comment_model.dart';
import 'package:facebook_feed/models/user_model.dart';
import 'package:facebook_feed/models/users_posts_model.dart';
import 'package:facebook_feed/shared/components/cubit/home_state.dart';
import 'package:facebook_feed/shared/components/general_components/general_component.dart';
import 'package:facebook_feed/shared/network/end_point.dart';
import 'package:facebook_feed/shared/network/remot/dio_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FacebookHomeCubit extends Cubit<HomeState> {
  FacebookHomeCubit() : super(HomeInitialState());

  static FacebookHomeCubit get(context) => BlocProvider.of(context);

  TabController? controller;
  TabController? diskController;
  UsersPostsModel? userPosts;
  List<PostsData>? postsData;
  Owner? owner;
  CommentsModel? commentsModel;

  TextEditingController? searchControl;

  bool? visible= false;

  visibleMenu() {
    visible =!visible!;
    print(visible);
    emit(VisibleState());
  }




  void initialControllerDiskTob(TickerProvider vsync) {
    diskController =
        TabController(length: desktopTabBarIcon.length, vsync: vsync);
    emit(LoadingState());
  }

  void initialController(TickerProvider vsync) {
    controller = TabController(length: tabBarIcon.length, vsync: vsync);
    emit(LoadingState());
  }

  void changeSelectColor(int? i) {
    controller!.index = i!;
    print(controller!.index);
    emit(SelectState());
  }

  Future<Response?> getPosts() async {
    print('ok');
    emit(GetPostsLoadingState());
    return await DioHelper.getData(url:PostS_End_Point).then((value) {
      userPosts = usersPostsModelFromJson(value.toString());
      postsData = userPosts!.data;

      userPosts!.data!.forEach((element) {
         owner = element.owner;
        print(owner);
      });
      print(value.data);
      print(userPosts!.data!.take(2));
      print(userPosts!.data);
      print('post');
      emit(GetPostsSuccessState());
    }).catchError((error) {
      print(error.toString());
      print('error');
      emit(GetPostsErrorState(error: error.toString()));
    });
  }


  UserModel? userModel;
  Future<Response?> getUsers() async {
    print('ok');
    emit(GetPostsLoadingState());
    return await DioHelper.getData(url: Users_End_Point).then((value) {
      userModel = userModelFromJson(value.toString());


      print(value.data);
      print(userModel!.data);
      print('user');


      emit(GetPostsSuccessState());
    }).catchError((error) {
      print(error.toString());
      print('error');

      emit(GetPostsErrorState(error: error.toString()));
    });
  }


  Future<Response?> getComment(String id) async {
    print('ok');
    emit(GetCommentsLoadingState());
    return await DioHelper.getData(url:'post/$id/comment').then((value) {
      commentsModel = commentsModelFromJson(value.toString());
      print(value.data);
      print(commentsModel!.data);
      print('commentsModel');

      emit(GetCommentsSuccessState());
    }).catchError((error) {
      print(error.toString());
      print('error');

      emit(GetCommentsErrorState(error: error.toString()));
    });
  }
}
