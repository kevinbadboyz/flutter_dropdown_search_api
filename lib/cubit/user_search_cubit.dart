import 'package:bloc/bloc.dart';
import 'package:flutter_dropdown_search_api/model/user_model.dart';
import 'package:flutter_dropdown_search_api/response/user_response.dart';
import 'package:meta/meta.dart';

import '../repository/user_repository.dart';

part 'user_search_state.dart';

class UserSearchCubit extends Cubit<UserSearchState> {
  final userRepository = UserRepository();
  UserSearchCubit() : super(UserSearchInitial()){
    searchUser();
  }

  void searchUser() async{
    emit(UserSearchLoading());
    try{
      UserResponse response = await userRepository.searchUser();
      emit(UserSearchLoaded(listUserModel: response.listUserModel));
    }catch (e){
      emit(UserSearchError(message: e.toString()));
    }
  }

}
