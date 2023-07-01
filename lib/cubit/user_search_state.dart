part of 'user_search_cubit.dart';

@immutable
abstract class UserSearchState {}

class UserSearchInitial extends UserSearchState {}

class UserSearchLoading extends UserSearchState {}

class UserSearchLoaded extends UserSearchState {
  final List<UserModel> listUserModel;
  UserSearchLoaded({required this.listUserModel});
}

class UserSearchError extends UserSearchState {
  final String message;
  UserSearchError({required this.message});
}
