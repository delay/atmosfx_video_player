# Dart code to playback AtmosFX videos to three separate screens.

![AtomsFX Unliving Portraits](https://cdn-images-1.medium.com/max/1600/1*dQggyRkBji0bKUhCCYdtvQ@2x.png)

I needed a way to playback [AtmosFX videos](https://atmosfx.com) on three separate screens and stay in sync. Initially I tried using three media players, one per screen and then starting them all together. The problem with this method is they would quickly lose sync. I figured the only way for them to stay in sync would be for one device to control the playback of all video files.

I wrote a small command line program in dart which launches each video file to a separate screen in full screen mode and then loops the video when it reaches the end. This solves the video syncing issue for my use case. The only thing you need is a computer with the ability to playback 1080p videos to three separate monitors.
Below is the relevant code:

```dart
import 'dart:io';

String myVideoPath = 'videos/';
void main() async {
  // Function to play a video in a separate window using mpv video player
  void playVideo(String videoPath, int screen) {
    print('Playing video: $videoPath on screen: $screen');
    Process.run(
        'mpv', ['-fs', '--screen=$screen', '--loop-file=inf', videoPath]);
  }

  playVideo('$myVideoPath/Gent.mp4', 0);
  playVideo('$myVideoPath/Madam.mp4', 1);
  playVideo('$myVideoPath/Daughter.mp4', 2);
}
```

The code uses the free, open source, and cross-platform [mpv media player](https://mpv.io/). You will also need to [install dart and/or flutter](https://docs.flutter.dev/get-started/install) to run the program. You can see more about running command line apps with this [link](https://dart.dev/tools/dart-tool). You should be able to run this code cross platform (windows, mac, linux, etc.).

I was using the video files from the [Unliving Portrait Collection from Atmosfx](https://atmosfx.com/collections/halloween/products/unliving-portraits). I merged the ones in family feud singles directory TV/Wall no frame. There are three different scenes so I used imovie to merge each of the Daughter scenes into one video and then did the same for the Gent and the Madam. It then just plays an infinite loop of the three videos, one video per monitor. I did not include the actual videos. They are available for purchase from atmosFx. I am not affiliated with them I just wanted a way to easily play the videos on 3 separate monitors so I could make three framed monitors and keep all the videos in sync. You need a computer that can support output to three separate monitors.

To run the app, place your video files in the videos folder and name them Gent.mp4, Madam.mp4, Daughter.mp4. If you change the name or video format you will need to edit the /bin/atmosfx_video_player.dart file with the new names. You can also change the monitor order by changing the 0,1,2 after each video name. In order to run the app you need to cd into the project directory from the command line and type 'dart run'.

```
cd atmosfx_video_player
dart run
```

Well hopefully someone will find this code useful. Feel free to use it however you like (MIT license).
