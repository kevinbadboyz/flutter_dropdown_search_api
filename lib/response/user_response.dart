import '../model/user_model.dart';

class UserResponse{
  List<UserModel> listUserModel = [];

  UserResponse.fromJson(json){
    for(int i = 0; i < json.length; i++){
      UserModel userModel = UserModel.fromJson(json[i]);
      listUserModel.add(userModel);
    }
  }
}