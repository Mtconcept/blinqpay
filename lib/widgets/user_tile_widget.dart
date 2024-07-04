import 'package:blinqpay/models/user_model.dart';
import 'package:flutter/material.dart';

import '../utils/constants.dart';

class UserTileWidget extends StatelessWidget {
  UserModel data;
  UserTileWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: CircleAvatar(
        backgroundColor: theme.indicatorColor,
        child: ClipOval(
          child: FadeInImage.assetNetwork(
            placeholder: "$assetPath/img.png",
            placeholderColor: Colors.grey,
            placeholderCacheHeight: 24,
            placeholderCacheWidth: 24,
            placeholderFit:
                BoxFit.contain, // Placeholder image shown while loading
            image: data.photo, // Network image URL
            fit: BoxFit.cover,
            fadeInDuration: const Duration(milliseconds: 300),
            fadeOutDuration: const Duration(milliseconds: 300),
            imageErrorBuilder: (context, error, stackTrace) {
              return Text(data.name[0], style: theme.textTheme.bodyMedium);
            },
          ),
        ),
      ),
      title: Text(
        data.name,
        style: theme.textTheme.bodyLarge,
      ),
      subtitle: Text(
        "@${data.username.replaceAll("_", "")}",
        style: theme.textTheme.bodyMedium!.copyWith(color: theme.disabledColor),
      ),
    );
  }
}
