//Packages
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainPage extends ConsumerWidget {
  double _deviceHeight = 0;
  double _deviceWidth = 0;

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    return _buildUI();
  }

  Widget _buildUI() {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        height: _deviceHeight,
        width: _deviceWidth,
        child: Stack(
          alignment: Alignment.center,
          children: [
            _backgroundWidget(),
          ],
        ),
      ),
    );
  }

  Widget _backgroundWidget() {
    return Container(
      height: _deviceHeight,
      width: _deviceWidth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        image: DecorationImage(
          image: NetworkImage(
              'https://static.wikia.nocookie.net/marvelcinematicuniverse/images/6/6f/Black_Widow_July_9_Poster.png/revision/latest?cb=20210629170602'),
          fit: BoxFit.cover,
        ),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 15.0, sigmaY: 15.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.2),
          ),
        ),
      ),
    );
  }
}
