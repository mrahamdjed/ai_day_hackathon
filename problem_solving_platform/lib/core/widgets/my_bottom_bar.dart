import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

class MyBottomBar extends StatelessWidget {
  const MyBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 95,
      padding: EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Contact us',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: "WorkSans",
                  fontWeight: FontWeight.w300,
                  fontSize: 18,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  SvgPicture.asset(
                    height: 25,
                    'assets/vectors/Platform=X (Twitter), Color=Negative.svg'
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  SvgPicture.asset(
                    height: 25,
                    'assets/vectors/Social Icons.svg'
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  SvgPicture.asset(
                    height: 25,
                    'assets/vectors/Social Icons-12.svg'),
                  SizedBox(
                    width: 10,
                  ),
                  SvgPicture.asset(
                    height: 25,
                    'assets/vectors/Social Icons-11.svg')
                  
                ],
              )
            ],
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Text('© 2023 All rights reserved',
              style: TextStyle(
                color: Colors.white,
                fontFamily: "WorkSans",
                fontWeight: FontWeight.w300,
                fontSize: 18,
              ),
            ),
          )
        ],
      ),
    );
  }
}