import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/states.dart';
import 'package:news_app/modules/business.dart';
import 'package:news_app/modules/science.dart';
import 'package:news_app/modules/sports.dart';
import 'package:news_app/shared/network/dio_helper.dart';

import '../modules/settings.dart';

class newsCubit extends Cubit<newsStates> {
  newsCubit() : super(initialState());
  static newsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<BottomNavigationBarItem> bottomItems = [
    BottomNavigationBarItem(
        icon: Icon(
          Icons.business_center_rounded,
        ),
      label: 'Business',
    ),
    BottomNavigationBarItem(
        icon: Icon(
          Icons.sports_basketball,
        ),
      label: 'Sports'
    ),
    BottomNavigationBarItem(
        icon: Icon(
          Icons.science,
        ),
      label: 'Science'
    ),
  ];
  void changeBtmNavBarIndex (int index) {
    currentIndex = index;
    emit(btmNavState());
  }

  List<Widget> screens = [
    businessScreen(),
    sportsScreen(),
    scienceScreen(),
  ];

  List<dynamic> business = [];
  void getBusiness() {
    emit(BloadingState());
      DioHelper.getData(
          path: '/v2/top-headlines',
          query: {
            'country':'us',
            'category':'business',
            'apiKey':'70db812948344046ba19bab83f5b75a1',
          }
      ).then((value) {
        business = value.data['articles'];
        print(business[0]['title']);
        emit(getBusinessTrue());
      }).catchError((error) {
        print('Error when get business : ${error.toString()}');
        emit(getBusinessError(error.toString()));
      });
  }

  List<dynamic> sports = [];
  void getSports() {
    emit(BloadingState());

      DioHelper.getData(
          path: '/v2/top-headlines',
          query: {
            'country':'us',
            'category':'sports',
            'apiKey':'70db812948344046ba19bab83f5b75a1',
          }
      ).then((value) {
        sports = value.data['articles'];
        print(sports[0]['title']);
        emit(getSportsTrue());
      }).catchError((error) {
        print('Error when get sports : ${error.toString()}');
        emit(getSportsError(error.toString()));
      });
  }

  List<dynamic> science = [];
  void getScience() {
    emit(BloadingState());

      DioHelper.getData(
          path: '/v2/top-headlines',
          query: {
            'country':'us',
            'category':'science',
            'apiKey':'70db812948344046ba19bab83f5b75a1',
          }
      ).then((value) {
        science = value.data['articles'];
        print(science[0]['title']);
        emit(getscienceTrue());
      }).catchError((error) {
        print('Error when get science : ${error.toString()}');
        emit(getscienceError(error.toString()));
      });

  }

}