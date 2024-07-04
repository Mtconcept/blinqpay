import 'package:blinqpay/utils/constants.dart';
import 'package:blinqpay/widgets/video_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import '../controllers/home_ctr.dart';
import '../utils/methods.dart';

class FeedWidget extends StatelessWidget {
  FeedWidget({super.key});

  var homeCtr = Get.put(HomeCtr());

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Obx(
      () => homeCtr.isLoading.value
          ? const Center(child: CircularProgressIndicator(strokeWidth: 1))
          : ListView.builder(
              itemCount: homeCtr.allPost.length,
              itemBuilder: (context, index) {
                var data = homeCtr.allPost[index];
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 32,
                            height: 32,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                gradient: LinearGradient(colors: [
                                  primaryColor.withGreen(2),
                                  primaryColor,
                                ])),
                            child: Center(
                                child: Text(
                              data.username[0],
                              style: theme.textTheme.bodyMedium!.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600),
                            )),
                          ),
                          const Gap(12),
                          Expanded(
                            child: Column(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(data.username,
                                        style: theme.textTheme.bodyLarge),
                                    const Gap(8),
                                    Text(
                                        "• ${convertTimeStamp(data.timestamp)}",
                                        style: theme.textTheme.bodySmall!
                                            .copyWith(
                                                color: theme
                                                    .unselectedWidgetColor)),
                                  ],
                                ),
                                const Gap(4),
                                Text(data.description.trim(),
                                    textAlign: TextAlign.left,
                                    style: theme.textTheme.bodyMedium!
                                        .copyWith(color: theme.canvasColor)),
                                const Gap(12),
                                data.noMedia == true
                                    ? const SizedBox()
                                    : data.video == "true" || data.video == true
                                        ? VideoWidget(videoUrl: data.link)
                                        : Container(
                                            height: Get.height / 3,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(16),
                                                image: DecorationImage(
                                                    fit: BoxFit.cover,
                                                    image: NetworkImage(
                                                        data.thumbnail))),
                                          )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(color: theme.dividerColor),
                    const Gap(8)
                  ],
                );
              },
            ),
    );
  }
}
