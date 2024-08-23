import 'dart:async';

import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:tech_blog/constant/api_constant.dart';
import 'package:tech_blog/models/podcast_file_model.dart';
import 'package:tech_blog/services/dio_service.dart';

class SinglePodcastController extends GetxController {
  // ignore: prefer_typing_uninitialized_variables
  var id;
  SinglePodcastController({this.id});

  RxBool loading = false.obs;
  RxList<PodcastFileModel> podcastFileList = RxList();
  final player = AudioPlayer();
  late ConcatenatingAudioSource playList;
  RxBool playState = false.obs;
  RxBool isLoopAll = false.obs;
  RxInt currentFileIndex = 0.obs;
  Rx<Duration> progressValue = Duration(seconds: 0).obs;
  Rx<Duration> bufferedValue = Duration(seconds: 0).obs;

  @override
  onInit() async {
    super.onInit();
    playList = ConcatenatingAudioSource(
      useLazyPreparation: true,
      children: [],
    );
    await getPodcastFiles();
    await player.setAudioSource(playList,
        initialIndex: 0, initialPosition: Duration.zero);
  }

  getPodcastFiles() async {
    loading.value = true;

    var response = await DioService().getMethod(ApiConstant.podcastFile + id);
    if (response.statusCode == 200) {
      for (var element in response.date["files"]) {
        podcastFileList.add(PodcastFileModel.fromJson(element));
        playList.add(
          AudioSource.uri(
            Uri.parse(PodcastFileModel.fromJson(element).file!),
          ),
        );
      }
      loading.value = false;
    }
  }

  Timer? timer;
  startProgress() {
    const tick = Duration(seconds: 1);
    int duration = player.duration!.inSeconds - player.position.inSeconds;

    if (timer != null) {
      if (timer!.isActive) {
        timer!.cancel();
        timer = null;
      }
    }
    timer = Timer.periodic(tick, (timer) {
      duration--;
      progressValue.value = player.position;
      bufferedValue.value = player.bufferedPosition;
      if (duration <= 0) {
        timer.cancel();
        progressValue.value = const Duration(seconds: 0);
        bufferedValue.value = const Duration(seconds: 0);
      }
    });
  }

  timerCheck() {
    if (player.playing) {
      startProgress();
    } else {
      timer!.cancel();
      progressValue.value = const Duration(seconds: 0);
      bufferedValue.value = const Duration(seconds: 0);
    }
  }

  setLoop() {
    if (isLoopAll.value) {
      isLoopAll.value = false;
      player.setLoopMode(LoopMode.off);
    } else {
      isLoopAll.value = true;
      player.setLoopMode(LoopMode.all);
    }
  }
}
