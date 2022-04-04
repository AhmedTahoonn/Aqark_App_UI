import 'package:block/BottomPage/page3.dart';
import 'package:block/BottomPage/page4.dart';
import 'package:block/shared/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../BottomPage/page1.dart';
import '../BottomPage/page2.dart';
import '../BottomPage/page5.dart';

class appCubit extends Cubit<appState>
{
  appCubit() : super(initialState());
  static appCubit get(context)=>BlocProvider.of(context);
  var currentindex=0;
  List<Widget>screens=
  [
    page1(),
    page2(),
    page3(),
    page4(),
    page5(),
  ];
  void changeBottomNavigationBar(index)
  {
    currentindex=index;
    emit(ChangeBottomNavigationBarState());
  }

}