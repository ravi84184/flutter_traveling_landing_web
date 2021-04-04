import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_traveling_landing/utils/app_assets.dart';
import 'package:flutter_traveling_landing/utils/app_color.dart';

class LandingScreen extends StatefulWidget {
  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: Image.asset(
              AppAssets.background,
              fit: BoxFit.contain,
            ).image,
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.4),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                offset: Offset(0, 0),
                blurRadius: 15,
                spreadRadius: 15,
              )
            ],
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 5,
              sigmaY: 5,
              tileMode: TileMode.decal,
            ),
            child: ListView(
              shrinkWrap: true,
              // mainAxisSize: MainAxisSize.min,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _headerWidget(),
                _bodyWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _bodyWidget() {
    return Container(
      child: Stack(
        children: [
          Positioned(child: _forgroundImageWidget()),
          _textContainer(),
        ],
      ),
    );
  }

  Widget _forgroundImageWidget() {
    return Image.asset(
      AppAssets.forground,
      fit: BoxFit.contain,
    );
  }

  Widget _textContainer() {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 40,
      ).copyWith(top: 100),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          RichText(
            text: TextSpan(
              style: TextStyle(
                fontSize: 60,
                fontWeight: FontWeight.bold,
              ),
              children: [
                TextSpan(text: "Join The"),
                TextSpan(
                  text: " Biggest\nCommunity",
                  style: TextStyle(color: AppColors.primary),
                ),
                TextSpan(text: " Of\nTravelers"),
              ],
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 50,
                width: 250,
                child: Container(
                  color: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Enter Zip Code",
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
                child: RaisedButton(
                  onPressed: () {},
                  color: AppColors.primary,
                  child: Icon(
                    Icons.navigate_next,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _headerWidget() {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Row(
        children: [
          _logoWidget(),
          Spacer(),
          _menuWidget(text: "Home", isSelected: true),
          _menuWidget(text: "My Trips"),
          _menuWidget(text: "Destination"),
          _menuWidget(text: "Contact Us"),
          SizedBox(
            height: 40,
            child: RaisedButton(
              onPressed: () {},
              child: Text(
                "Login",
                style: TextStyle(fontWeight: FontWeight.normal, fontSize: 18),
              ),
              color: AppColors.primary,
              textColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _menuWidget({String text, bool isSelected = false}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5),
      margin: EdgeInsets.symmetric(horizontal: 5),
      child: Text(
        text,
        style: TextStyle(
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            fontSize: 20,
            color: isSelected ? AppColors.primary : Colors.black),
      ),
    );
  }

  Widget _logoWidget() {
    return Image.asset(
      AppAssets.appLogo,
      height: 100,
    );
  }
}
