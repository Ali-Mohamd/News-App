import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/cubit.dart';
import 'package:news_app/cubit/states.dart';

class news_layout extends StatelessWidget {
  const news_layout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<newsCubit, newsStates>(
      listener: (BuildContext context, newsStates state) {  },
      builder: (BuildContext context, newsStates state) {
        var cubit = newsCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            titleSpacing: 18,
            title: Text(
              'News App',
            ),
          ),
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            onTap: (index){
              cubit.changeBtmNavBarIndex(index);
            },
            items: cubit.bottomItems,
          ),
        );
      },
    );
  }
}
