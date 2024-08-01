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
