
import 'package:block/BottomPage/page1.dart';
import 'package:block/BottomPage/page2.dart';
import 'package:block/BottomPage/page3.dart';
import 'package:block/BottomPage/page4.dart';
import 'package:block/BottomPage/page5.dart';
import 'package:block/shared/cuibt.dart';
import 'package:block/shared/states.dart';
import 'package:block/styles/icon_broken.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'constant/constant.dart';

class Layout extends StatefulWidget {
  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {




  @override
  Widget build(BuildContext context) {
    return BlocConsumer<appCubit,appState>(
     builder: (context, state) {
       return Scaffold(
         bottomNavigationBar: BottomNavigationItem(),
         body: appCubit.get(context).screens[appCubit.get(context).currentindex],

       );
     },
      listener:  (context, state){

      },
    );
  }
  Widget BottomNavigationItem()=>BottomNavigationBar(
      currentIndex: appCubit.get(context).currentindex,
      onTap: (index){
       appCubit.get(context).changeBottomNavigationBar(index);
      },
      type: BottomNavigationBarType.fixed,
      items:
      [
        BottomNavigationBarItem(icon: Icon(IconBroken.Home),label: ''),
        BottomNavigationBarItem(icon: Icon(IconBroken.Search),label: ''),
        BottomNavigationBarItem(icon: Icon(IconBroken.Heart),label: ''),
        BottomNavigationBarItem(icon: Icon(IconBroken.Message),label: ''),
        BottomNavigationBarItem(icon: Icon(IconBroken.Setting),label: ''),



      ],
    );
}
