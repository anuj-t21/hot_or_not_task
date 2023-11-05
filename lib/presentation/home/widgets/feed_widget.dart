part of 'widgets.dart';

class FeedWidget extends StatefulWidget {
  const FeedWidget({super.key});

  @override
  State<FeedWidget> createState() => _FeedWidgetState();
}

class _FeedWidgetState extends State<FeedWidget> {
  late final PageController pageController;
  final List<String> videoUrls = AppFeedData.videos;

  List<VideoPlayerController> controllers = [];
  int currentPage = 0;

  InitEnum controllerInitStatus = InitEnum.uninitialised;

  @override
  void initState() {
    super.initState();
    _init();
  }

  Future<void> _init() async {
    for (String url in videoUrls) {
      controllers.add(VideoPlayerController.networkUrl(Uri.parse(url)));
    }

    // Setting initial page count to an arbitrary large number
    // to achieve infinite scrolling
    pageController = PageController(
        viewportFraction: 1.0, initialPage: (controllers.length) * 1000);

    // Initialize the first video and play it
    _initNewController(0);

    // Initialize and preload the next video
    _preloadNextVideo();
  }

  Future<void> _initNewController(int index) async {
    if ((controllers[index].value.isInitialized.not)) {
      setState(() {
        controllerInitStatus = InitEnum.initialising;
      });
      await controllers[index].initialize();
    }
    controllers[index].setVolume(1.0);
    await controllers[index].play();
    await controllers[index].seekTo(Duration.zero);
    controllers[index].setLooping(true);
    setState(() {
      controllerInitStatus = InitEnum.initialised;
    });
  }

  void _preloadNextVideo() {
    // We are only preloading one video here
    // but we can preload as many as required

    final nextIndex = (currentPage + 1) % controllers.length;

    if (controllers[nextIndex].value.isInitialized.not) {
      controllers[nextIndex].initialize().then((_) {
        controllers[nextIndex].setVolume(0.0);
        controllers[nextIndex].play();
        controllers[nextIndex].pause();
      });
    }
  }

  @override
  void dispose() {
    for (var controller in controllers) {
      controller.dispose();
    }
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: pageController,
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        VideoPlayerController currentController =
            controllers[index % controllers.length];
        return _FeedItem(
          controller: currentController,
          controllerInitStatus: controllerInitStatus,
        );
      },
      onPageChanged: (value) async {
        final newPage = value % controllers.length;

        if (newPage != currentPage) {
          // Pause the current video
          await controllers[currentPage].pause();

          // Init new video
          await _initNewController(newPage);

          currentPage = newPage;

          // Preload the next video when scrolling to a new page
          _preloadNextVideo();
        }
      },
    );
  }
}

class _FeedItem extends StatefulWidget {
  final VideoPlayerController controller;
  final InitEnum controllerInitStatus;
  const _FeedItem({
    required this.controller,
    required this.controllerInitStatus,
  });

  @override
  State<_FeedItem> createState() => __FeedItemState();
}

class __FeedItemState extends State<_FeedItem> {
  @override
  Widget build(BuildContext context) {
    bool soundOn = widget.controller.value.volume != 0.0;

    return SizedBox(
      height: 1.sh,
      width: 1.sw,
      child: GestureDetector(
        onTap: () {
          bool isPlaying = widget.controller.value.isPlaying;
          if (isPlaying.not) {
            widget.controller.play();
          } else {
            widget.controller.pause();
          }
        },
        child: Stack(
          children: [
            if (widget.controllerInitStatus == InitEnum.initialising) ...{
              const Center(child: CircularProgressIndicator()),
            } else ...{
              VideoPlayer(widget.controller),
            },
            Positioned(
              top: 40.h,
              right: 16.w,
              child: IconButton(
                onPressed: () {
                  if (soundOn) {
                    widget.controller.setVolume(0.0);
                  } else {
                    widget.controller.setVolume(1.0);
                  }
                  setState(() {});
                },
                icon: Icon(
                  soundOn ? Icons.volume_up : Icons.volume_off,
                  color: AppColors.appWhite,
                  size: 32.r,
                ),
              ),
            ),
            Positioned(
              bottom: 80.h,
              child: const _FeedDetailsTile(),
            ),
            Positioned(
              bottom: 80.h,
              right: 16.w,
              child: const _FeedActionTile(),
            ),
          ],
        ),
      ),
    );
  }
}

class _FeedDetailsTile extends StatelessWidget {
  const _FeedDetailsTile();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 0.7.sw,
      padding: AppPaddings.paddingH16,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: AppColors.brightOrange,
                radius: 24.r,
              ),
              SizedBox(width: 8.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Anuj',
                    style: AppTextStyles.inter.s16.w6,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.remove_red_eye_outlined,
                        color: AppColors.appWhite.o9,
                      ),
                      SizedBox(width: 4.w),
                      Text(
                        '2500',
                        style: AppTextStyles.inter.s12.w5,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Text(
            'This will be a dummy caption for this video.',
            style: AppTextStyles.inter.s14.w5,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}

class _FeedActionTile extends StatelessWidget {
  const _FeedActionTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          Icons.favorite,
          color: AppColors.appWhite,
          size: 28.r,
        ),
        SizedBox(height: 20.h),
        Icon(
          Icons.send,
          color: AppColors.appWhite,
          size: 28.r,
        ),
        SizedBox(height: 20.h),
        Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            gradient: AppColors.orangeGradient,
          ),
          padding: AppPaddings.paddingH12V12,
          child: Icon(
            Icons.auto_awesome,
            color: AppColors.appWhite,
            size: 28.r,
          ),
        ),
      ],
    );
  }
}
