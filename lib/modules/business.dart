import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:news_app/cubit/cubit.dart';
import 'package:news_app/cubit/states.dart';

import '../shared/components.dart';

class businessScreen extends StatelessWidget {
  const businessScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<newsCubit, newsStates>(
      listener: (BuildContext context, newsStates state) {  },
      builder: (BuildContext context, newsStates state) {
        var list = newsCubit.get(context).business;
        return (list.length > 0) ? ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            var article = list[index];
            if (article['urlToImage'] != null) {
              return buildArticle(article, context);
            } else {
              return SizedBox.shrink(); // This will create a zero-sized box
            }
          },
          itemCount: 20,
        ) : Center(child: CircularProgressIndicator(color: Colors.deepOrange,)) ;
      },
    );
  }
}
