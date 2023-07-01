import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dropdown_search_api/cubit/user_search_cubit.dart';
import 'package:flutter_dropdown_search_api/model/user_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dropdown Search with Cubit'),
      ),
      body: BlocProvider(
        create: (context) => UserSearchCubit(),
        child: BlocBuilder<UserSearchCubit, UserSearchState>(
          builder: (context, state) {
            if (state is UserSearchLoading) {
              // return const Center(child: CircularProgressIndicator(),);
              return Container();
            } else if (state is UserSearchError) {
              return Center(
                child: Text(state.message),
              );
            } else if (state is UserSearchLoaded) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownSearch<UserModel>(
                  items: state.listUserModel,
                  compareFn: (i, s) => i.isEqual(s),
                  // method to get the ID of User Model
                  onChanged: (UserModel? data) =>
                      print('ID User Model : ${data!.id}'),
                  dropdownBuilder: (context, selectedItem) =>
                      Text(selectedItem?.name ?? 'Please choose one'),
                  popupProps: PopupProps.menu(
                      showSelectedItems: true,
                      showSearchBox: true,
                      itemBuilder: (context, item, isSelected) => ListTile(
                            leading: CircleAvatar(
                              child: Text(item.id!),
                            ),
                            title: Text(item.name!),
                          )),
                ),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
