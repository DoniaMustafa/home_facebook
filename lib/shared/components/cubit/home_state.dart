abstract class HomeState {}

class HomeInitialState extends HomeState {}
class LoadingState extends HomeState {}
class SelectState extends HomeState {}
class VisibleState extends HomeState {}

class GetPostsLoadingState extends HomeState {}
class GetPostsSuccessState extends HomeState {}
class GetPostsErrorState extends HomeState {
  final String error;
  GetPostsErrorState({required this.error});
}
class GetCommentsLoadingState extends HomeState {}
class GetCommentsSuccessState extends HomeState {}
class GetCommentsErrorState extends HomeState {
  final String error;
  GetCommentsErrorState({required this.error});
}