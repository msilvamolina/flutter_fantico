import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../data/models/user_streaks_min/user_streaks_min.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/responsive.dart';

class RankingsUserCard extends StatelessWidget {
  final UserStreakMin user;

  const RankingsUserCard({Key key, @required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double sizeTitle = Responsive.of(context).percent(1.5);

    return Container(
      padding: EdgeInsets.only(bottom: 0),
      child: Row(
        children: [
          Hero(
            tag: "${user.userEmail}img",
            child: CircleAvatar(
              backgroundColor: AppColors.colorBackgroundBox,
              backgroundImage: user.image != ''
                  ? CachedNetworkImageProvider(user.image)
                  : AssetImage('assets/images/user.png'),
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Hero(
              tag: "${user.userEmail}title",
              child: Material(
                color: Colors.transparent,
                child: Text(
                  user.username,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: sizeTitle,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          Text(
            user.racha.toString(),
            style: TextStyle(
              color: AppColors.colorFour,
              fontSize: sizeTitle,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
