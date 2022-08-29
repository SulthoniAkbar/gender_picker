// ignore_for_file: use_key_in_widget_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, prefer_const_constructors, sized_box_for_whitespace, unnecessary_import
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_provider/gender_provider.dart';
import 'package:provider/provider.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<GenderProvider>(
      create:(context) => GenderProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 20
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Consumer<GenderProvider>(
                  builder: (context, genderProvider,_) =>  Text(
                    'Gender Picker',
                    style: TextStyle(
                      fontSize: 24, 
                      fontWeight: FontWeight.w500,
                      color: genderProvider.color,
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Consumer<GenderProvider>(
                        builder: (context,genderProvider,_) => GestureDetector(
                          onTap: (){
                            genderProvider.isMale = true;
                          },
                          child: Container(
                            height: 150,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: genderProvider.malecolor,
                              ),
                              borderRadius: BorderRadius.circular(12)
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.asset(
                                    'assets/male.png',
                                    height: 60,
                                    color: genderProvider.malecolor,
                                  ),
                                ),
                                Text(
                                  "Male",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    color: genderProvider.malecolor,
                                  ),
                                )
                              ],
                            ), 
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                     Expanded(
                       child: Consumer<GenderProvider>(
                         builder: (context, genderProvider,_) => GestureDetector(
                          onTap: (){
                            genderProvider.isMale = false;
                          },
                           child: Container(
                            height: 150,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: genderProvider.femalecolor,
                              ),
                              borderRadius: BorderRadius.circular(12)
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.asset(
                                    'assets/female.png',
                                    height: 60,
                                    color: genderProvider.femalecolor,
                                  ),
                                ),
                                Text(
                                  "Female",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    color: genderProvider.femalecolor,
                                  ),
                                )
                              ],
                            ), 
                                           ),
                         ),
                       ),
                     )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
