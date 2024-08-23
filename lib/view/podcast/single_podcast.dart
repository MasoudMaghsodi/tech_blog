import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tech_blog/component/decorations.dart';
import 'package:tech_blog/component/dimens.dart';
import 'package:tech_blog/controller/podcast/single_podcast_controller.dart';
import 'package:tech_blog/models/podcast_model.dart';

import '../../component/my_component.dart';
import '../../constant/my_colors.dart';
import '../../gen/assets.gen.dart';

// ignore: must_be_immutable
class SinglePodcast extends StatelessWidget {
  late SinglePodcastController controller;
  late PodcastModel podcastModel;
  SinglePodcast({super.key}) {
    podcastModel = Get.arguments;
    controller = Get.put(SinglePodcastController(id: podcastModel.id));
  }

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            // title
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Stack(
                      children: [
                        SizedBox(
                          height: Get.height / 3,
                          width: double.infinity,
                          child: CachedNetworkImage(
                            imageUrl: podcastModel.poster!,
                            imageBuilder: (context, imageProvider) => Image(
                              image: imageProvider,
                              fit: BoxFit.fill,
                            ),
                            placeholder: (context, url) => const Loading(),
                            errorWidget: (context, url, error) => Image.asset(
                              Assets.images.singlePlaceHolder.path,
                            ),
                          ),
                        ),
                        Positioned(
                          child: Container(
                            height: 60,
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: gradiantColors.singleAppbarGradient,
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                const SizedBox(
                                  width: 20,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Get.back();
                                  },
                                  child: const Icon(
                                    Icons.arrow_back,
                                    color: Colors.white,
                                    size: 24,
                                  ),
                                ),
                                const Expanded(child: SizedBox()),
                                const SizedBox(
                                  width: 20,
                                ),
                                const Icon(
                                  Icons.share,
                                  color: Colors.white,
                                  size: 24,
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          podcastModel.title!,
                          maxLines: 2,
                          style: textTheme.headlineLarge,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Image(
                            image: Image.asset(Assets.images.avatar.path).image,
                            height: 50,
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          Text(
                            podcastModel.author!,
                            style: textTheme.headlineSmall,
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Obx(
                        () => ListView.builder(
                          shrinkWrap: true,
                          itemCount: controller.podcastFileList.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () async {
                                await controller.player
                                    .seek(Duration.zero, index: index);
                                controller.currentFileIndex.value =
                                    controller.player.currentIndex!;
                                controller.timerCheck();
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        ImageIcon(
                                          Image.asset(Assets.icons.bluemic.path)
                                              .image,
                                          color: solidColors.seeMore,
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        SizedBox(
                                          width: Get.width / 1.5,
                                          child: Obx(
                                            () => Text(
                                              controller.podcastFileList[index]
                                                  .title!,
                                              style: controller.currentFileIndex
                                                          .value ==
                                                      index
                                                  ? textTheme.headlineSmall
                                                  : textTheme.headlineLarge,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      "${controller.podcastFileList[index].length!}:00",
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            // player manager
            Positioned(
              bottom: 8,
              right: Dimens.bodyMargin,
              left: Dimens.bodyMargin,
              child: Container(
                height: Get.height / 7,
                decoration: MyDecorations.mainGradiant,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Obx(
                        () => ProgressBar(
                          bufferedBarColor: Colors.lightBlue.shade200,
                          timeLabelTextStyle:
                              TextStyle(color: Colors.blueAccent.shade700),
                          progressBarColor: Colors.amber,
                          thumbColor: Colors.amberAccent,
                          baseBarColor: Colors.white,
                          progress: controller.progressValue.value,
                          total: controller.player.duration ??
                              const Duration(seconds: 0),
                          buffered: controller.bufferedValue.value,
                          onSeek: (position) async {
                            controller.player.seek(position);
                            if (controller.player.playing) {
                              controller.startProgress();
                            } else if (position <= const Duration(seconds: 0)) {
                              await controller.player.seekToNext();
                              controller.currentFileIndex.value =
                                  controller.player.currentIndex!;
                              controller.timerCheck();
                            }
                          },
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GestureDetector(
                            onTap: () async {
                              await controller.player.seekToNext();
                              controller.currentFileIndex.value =
                                  controller.player.currentIndex!;
                              controller.timerCheck();
                            },
                            child: const Icon(
                              Icons.skip_next,
                              color: Colors.white,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              controller.player.playing
                                  ? controller.timer!.cancel()
                                  : controller.startProgress();

                              controller.player.playing
                                  ? controller.player.pause()
                                  : controller.player.play();

                              controller.playState.value =
                                  controller.player.playing;
                              controller.currentFileIndex.value =
                                  controller.player.currentIndex!;
                            },
                            child: Icon(
                              controller.player.playing
                                  ? Icons.pause_circle_filled
                                  : Icons.play_circle_filled,
                              color: Colors.white,
                              size: 48,
                            ),
                          ),
                          GestureDetector(
                            onTap: () async {
                              await controller.player.seekToPrevious();
                              controller.currentFileIndex.value =
                                  controller.player.currentIndex!;
                              controller.timerCheck();
                            },
                            child: const Icon(
                              Icons.skip_previous,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(),
                          Obx(
                            () => GestureDetector(
                              onTap: () {
                                controller.setLoop();
                              },
                              child: Icon(
                                Icons.repeat,
                                color: controller.isLoopAll.value
                                    ? Colors.blue
                                    : Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
