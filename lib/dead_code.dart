// ..
// ....
// ......

// List<VideoPlayerController> controllers = [];
// int currentVideoIndex = 0;

// @override
// void initState() {
//   super.initState();

//   for (String url in videoUrls) {
//     controllers.add(VideoPlayerController.networkUrl(Uri.parse(url)));
//   }

//   controllers[currentVideoIndex].initialize().then((_) {
//     setState(() {
//       controllers[currentVideoIndex].play();
//       controllers[currentVideoIndex].setLooping(true);
//     });
//   });

//   controllers[currentVideoIndex].addListener(_videoListener);
// }

// void _videoListener() {
//   if (controllers[currentVideoIndex].value.position >=
//       controllers[currentVideoIndex].value.duration) {
//     // Current video has finished, switch to the next video
//     final nextIndex = (currentVideoIndex + 1) % controllers.length;

//     // Initialize and preload the next video
//     controllers[nextIndex].initialize().then((_) {
//       controllers[nextIndex].setVolume(0.0); // Mute the next video
//       controllers[nextIndex].play();
//       controllers[nextIndex].pause();
//     });

//     setState(() {
//       currentVideoIndex = nextIndex;
//       controllers[currentVideoIndex].play();
//       controllers[currentVideoIndex].setLooping(true);
//     });
//   }
// }

// @override
// void dispose() {
//   for (var controller in controllers) {
//     controller.dispose();
//   }
//   super.dispose();
// }

// ..
// ....
// ......

// List<VideoPlayerController> controllers = [];
// PageController pageController = PageController();
// int currentPage = 0;

// @override
// void initState() {
//   super.initState();

//   for (String url in videoUrls) {
//     controllers.add(VideoPlayerController.networkUrl(Uri.parse(url)));
//   }

//   // Initialize the first video and play it
//   controllers[0].initialize().then((_) {
//     setState(() {
//       controllers[0].play();
//     });
//   });

//   // Add listeners to handle video play/pause
//   pageController.addListener(() {
//     final newPage = pageController.page?.round() ?? 0;

//     if (newPage != currentPage) {
//       controllers[currentPage].pause();
//       controllers[newPage].play();
//       currentPage = newPage;
//     }
//   });
// }

// @override
// void dispose() {
//   for (var controller in controllers) {
//     controller.dispose();
//   }
//   pageController.dispose();
//   super.dispose();
// }


  // void _pageListener() async {
  //   pageController.addListener(() async {
  //     final newPage = pageController.page?.round() ?? 0;

  //     if (newPage != currentPage) {
  //       await controllers[currentPage].pause();
  //       await _initNewController(newPage);
  //       currentPage = newPage;

  //       // Preload the next video when scrolling to a new page
  //       _preloadNextVideo();
  //     }
  //   });
  // }