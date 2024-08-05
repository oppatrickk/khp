import 'package:flutter/material.dart';
import 'package:khp/constants/app_colors.dart';

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
                decoration: const BoxDecoration(
                  color: AppColors.secondary,
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                ),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Padding(
                      padding: EdgeInsets.only(top: 16, left: 16, right: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Hallo,',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'Mont',
                            ),
                          ),
                          Text(
                            'Andreas!',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 32,
                              fontWeight: FontWeight.w900,
                              fontFamily: 'Mont',
                            ),
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
