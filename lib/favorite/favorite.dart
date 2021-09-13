import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:restaurant/favorite/favar.dart';
import 'package:restaurant/favorite/favoriteList.dart';
import 'package:restaurant/favorite/favoriteService.dart';


class Favorite extends StatefulWidget {
  Favorite({Key? key}) : super(key: key);

  @override
  _FavoriteState createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Favorit>?>.value(
      value: FavoriteService().orders,
      initialData: [],
      child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 80.0,
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            iconTheme: IconThemeData(color: Colors.black),
            leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(
                Icons.arrow_back_ios_new,
                size: 17.0,
              ),
            ),
            title: Text(
              "Orders",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontSize: 16.0,
              ),
            ),
            centerTitle: true,
          ),
          body: FavoriteList()),
    );
  }
}
