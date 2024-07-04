import 'package:blinqpay/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../controllers/theme_ctr.dart';
import '../widgets/feed_widget.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  var themeCtr = Get.put(ThemeCtr());

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        actions: [
          InkWell(
            onTap: () {
              themeCtr.switchTheme();
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: theme.hoverColor, shape: BoxShape.circle),
              child: Obx(
                () => Text(themeCtr.isDarkMode ? "☀️" : "🌙",
                    style: theme.textTheme.titleMedium),
              ),
            ),
          ),
          const SizedBox(width: 16)
        ],
        bottom: PreferredSize(
            preferredSize: const Size(0, 8),
            child: Divider(
              color: theme.dividerColor.withOpacity(0.2),
            )),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text("Blinq Pay", style: theme.textTheme.titleMedium),
        leading: Hero(
          tag: "logo.svg",
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SvgPicture.asset("$assetPath/logo.svg",
                width: 24, color: primaryColor),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        elevation: 0,
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FeedWidget(),
      ),
    );
  }
}
