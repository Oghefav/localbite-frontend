import 'dart:io';
import 'package:flutter/material.dart';
import 'package:locabite/core/utility/app_colours.dart';
import 'package:locabite/core/utility/big_text.dart';
import 'package:locabite/core/utility/demensions.dart';
import 'package:locabite/core/utility/small_text.dart';
import 'package:intl/intl.dart';

class MainFoodBody extends StatelessWidget {
  const MainFoodBody({super.key});

  static currency(context) {
      // Locale locale = Localizations.localeOf(context);
      var format = NumberFormat.simpleCurrency(
        locale: Platform.localeName,
        name: 'NGN',
      );
      return format;
    }

  @override
  Widget build(BuildContext context) {

    return Expanded(
      child: GridView.builder(
        padding: EdgeInsets.only(left: Demensions.width10, right: Demensions.width10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.7,
        ),
        itemCount: 8,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(right: Demensions.width10, bottom: Demensions.width10),
            padding: EdgeInsets.only(left: Demensions.width10, right: Demensions.width10, top: Demensions.height5),
            width: Demensions.width100,
            decoration: BoxDecoration(
              color: AppColours.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                BigText(text: 'Pepper Soup'),
                SmallText(text: '${currency(context).currencySymbol} 4500'),
                SizedBox(height: 10),
                Container(
                  height: Demensions.height100,
                  width: Demensions.width80,
                  child: ClipRRect(
                    clipBehavior: Clip.hardEdge,
                    borderRadius: BorderRadius.circular(Demensions.radius15),
                    child: Image(
                      image: AssetImage('assets/images/food1.jpeg'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                SizedBox(height: Demensions.height10),
                Container(
                  // color: Colors.blue,
                  height: Demensions.height60,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        // color: Colors.amber,
                        width: Demensions.width100,
                        height: Demensions.height10 * 5,
                        child: Stack(
                          children: [
                            Positioned(
                              child: Container(
                                height: Demensions.height15 * 2,
                                width: Demensions.width15 * 2,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(Demensions.radius15 * 2),
                                  image: DecorationImage(
                                    image: AssetImage(
                                      'assets/images/brandimage.jpg',
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              top: Demensions.height10 * 3,
                              child: SizedBox(
                                width: Demensions.width100,
                                height: Demensions.height15 * 3,
                                child: Text(
                                  'By vikedcakdes',
                                  style: TextStyle(
                                    color: AppColours.lightBrown,
                                    fontSize: Demensions.fontSize10,
                                  ),
                                  maxLines: 2,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: Demensions.height15 * 2,
                        width: Demensions.width15 * 2,
                        decoration: BoxDecoration(
                          color: AppColours.darkbrown,
                          borderRadius: BorderRadius.circular(Demensions.radius10),
                        ),
                        child: Icon(Icons.add, color: AppColours.white),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
