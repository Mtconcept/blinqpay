import 'package:blinqpay/controllers/home_ctr.dart';
import 'package:blinqpay/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../widgets/user_tile_widget.dart';

class SearchView extends StatelessWidget {
  SearchView({super.key});

  var homeCtr = Get.put(HomeCtr());

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(50),
            TextField(
              onChanged: (val) {
                homeCtr.searchUsers(val);
              },
              decoration: InputDecoration(
                fillColor: theme.indicatorColor,
                filled: true,
                enabled: true,
                hintText: "Search by username",
                focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.transparent, width: 2),
                    borderRadius: BorderRadius.circular(100)),
                enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(100)),
              ),
            ),
            const Gap(24),
            Text(
              "People on Blinq".toUpperCase(),
              style: theme.textTheme.bodyMedium!
                  .copyWith(letterSpacing: 1, color: theme.disabledColor),
            ),
            const Gap(16),
            Obx(
              () => Expanded(
                child: ListView.builder(
                    itemCount: homeCtr.filteredUsers.length,
                    padding: EdgeInsets.zero,
                    itemBuilder: (context, index) {
                      var data = homeCtr.filteredUsers[index];
                      return UserTileWidget(data: data);
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
