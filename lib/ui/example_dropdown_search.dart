import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropdown_search_api/model/user_model.dart';

class ExampleDropdownSearch extends StatelessWidget {
  const ExampleDropdownSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dropdown Search Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: DropdownSearch<UserModel>(
          asyncItems: (String? filter) async {
            var response = await Dio().get(
                'https://5d85ccfb1e61af001471bf60.mockapi.io/user',
                queryParameters: {'filter': filter});
            print('Hasil : ${response.data}');

            final data = response.data;
            if (data != null) {
              return UserModel.fromJsonList(data)!.toList();
            }
            return [];
          },
          compareFn: (i, s) => i.isEqual(s),
          onChanged: (UserModel? data) => print(data),
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
      ),

      // body: DropdownSearch<String>(
      //   popupProps: PopupProps.menu(
      //     showSelectedItems: true,
      //     showSearchBox: true
      //     // disabledItemFn: (String s) => s.startsWith('I'),
      //   ),
      //   items: ["Brazil", "Italia (Disabled)", "Tunisia", 'Canada'],
      //   dropdownDecoratorProps: DropDownDecoratorProps(
      //     dropdownSearchDecoration: InputDecoration(
      //       labelText: "Menu mode",
      //       hintText: "country in menu mode",
      //     ),
      //   ),
      //   onChanged: print,
      //   // selectedItem: "Brazil",
      // ),
    );
  }
}
