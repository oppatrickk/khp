import 'package:flutter/material.dart';
import 'package:khp/constants/app_colors.dart';
import 'package:khp/constants/app_text.dart';

class HomeCard extends StatelessWidget {
  const HomeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 254,
      child: Column(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(32),
              child: Container(
                decoration: BoxDecoration(
                  color: lightColorScheme.secondary,
                  borderRadius: const BorderRadius.all(Radius.circular(16)),
                ),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Hallooooo,',
                            style: hero2(),
                          ),
                          Text(
                            'Andreas!',
                            style: hero1(),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Image.asset('assets/logo/khp_logo3.png', width: 48),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 4),
                            child: Image.asset('assets/img/mascot.png'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
