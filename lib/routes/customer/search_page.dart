import 'package:flutter/material.dart';
import 'package:locabite/core/utility/app_colours.dart';
import 'package:locabite/core/utility/demensions.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController textEditingController = TextEditingController();
    return Scaffold(
      backgroundColor: AppColours.cream,
      body: Column(
        children: [
          SizedBox(height: Demensions.height60 / 1.5,),
          Center(
            child: Container(
              height: Demensions.height60/1.3,
              width: Demensions.width100*3.5,
              decoration: BoxDecoration(
                color: AppColours.white,
                border: Border.all(color: AppColours.darkbrown, width: 2),
                borderRadius: BorderRadius.circular(Demensions.radius15)
              ),
              child: TextField(
                controller: textEditingController,
                enableSuggestions: true,
                decoration: InputDecoration(
                  icon: Icon(Icons.search_outlined, size: Demensions.height35,),
                  border: InputBorder.none,
                  hintText: 'Search by food or chef brand name'
                ),
              )
              ),
          )]));
  }
}
