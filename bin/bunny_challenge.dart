import 'dart:io';
import 'dart:math';

void main(List<String> arguments) {
  BunnyChallenge([
    '_',
    '_',
    '_',
    '_',
    '_',
    '_',
    '_',
    '_',
    '_',
    '_',
    '_',
    '_',
    '_',
    '_',
    '_',
    '_',
    '_',
    '_',
    '_',
    '_',
    'R',
    '_',
    '_',
    '_',
    '_',
    '_',
    '_',
    '_',
    '_',
    '_',
    '_',
    '_',
    '_',
    '_',
    '_',
    '_',
    '_',
    '_',
    '_',
    '_',
    '_',
    '_',
    '_',
    '_',
    '_',
    '_',
    '_',
    '_',
    '_',
    '_',
    '_',
    '_',
    '_',
    '_',
    '_',
    '_',
    '_',
    '_',
    '_',
    '_',
    '_',
    '_',
    '_',
    '_',
    '_',
    '_',
    '_',
    '_',
    '_',
    '_',
    '_',
    '_',
    '_',
    '_',
    '_',
    '_',
    '_',
    '_',
    '_',
    '_'
  ]).bunnyPicker();
}

class BunnyChallenge {
  BunnyChallenge(this.rabbithole);

  final List<String> rabbithole;
  int iterations = 0;

  /// Moves the bunny randomly one position to the right or left in the array.
  /// Will move the bunny to the other direction if the min or max of the List is reached
  void _bunnyMovement() {
    final random = Random();
    final bunnyMovement = random.nextInt(2);
    final currentBunnyPosition = rabbithole.indexOf('R');
    if (bunnyMovement == 0) {
      if (currentBunnyPosition == 0) {
        rabbithole[currentBunnyPosition] = '_';
        rabbithole[currentBunnyPosition + 1] = 'R';
      } else {
        rabbithole[currentBunnyPosition] = '_';
        rabbithole[currentBunnyPosition - 1] = 'R';
      }
    } else {
      if (currentBunnyPosition == rabbithole.length - 1) {
        rabbithole[currentBunnyPosition] = '_';
        rabbithole[currentBunnyPosition - 1] = 'R';
      } else {
        rabbithole[currentBunnyPosition] = '_';
        rabbithole[currentBunnyPosition + 1] = 'R';
      }
    }
  }

  /// The function should start at index 2 and pick this index two times.
  /// The function should pick each even index two times and pick each odd index one time.
  /// After each pick it should call the [bunnyMovement] function.
  _bunnyOnSameIndex({bool isFirst = false, int currentIndex = 2, bool reachedEnd = false}) {
    iterations++;
    print('currentIndex: $currentIndex');
    if (rabbithole[currentIndex].contains('R')) {
      print('Bunny Caught!');
      print('Made $iterations iterations on an array with the length of: ${rabbithole.length}');
      exit(0);
    } else if (!isFirst && rabbithole[currentIndex].contains('_')) {
      if (currentIndex == rabbithole.length - 2) {
        _bunnyMovement();
        _bunnyOnSameIndex(isFirst: true, currentIndex: currentIndex - 1, reachedEnd: true);
      }
      if (currentIndex == 0) {
        _bunnyMovement();
        _bunnyOnSameIndex(isFirst: true, currentIndex: currentIndex + 1, reachedEnd: false);
      } else if (!reachedEnd) {
        _bunnyMovement();
        _bunnyOnSameIndex(isFirst: true, currentIndex: currentIndex + 1, reachedEnd: reachedEnd);
      } else {
        _bunnyMovement();
        _bunnyOnSameIndex(isFirst: true, currentIndex: currentIndex - 1, reachedEnd: reachedEnd);
      }
    } else if (isFirst) {
      if (currentIndex % 2 == 0) {
        _bunnyMovement();
        _bunnyOnSameIndex(isFirst: false, currentIndex: currentIndex, reachedEnd: reachedEnd);
      } else {
        if (currentIndex == rabbithole.length - 2) {
          _bunnyMovement();
          _bunnyOnSameIndex(isFirst: true, currentIndex: currentIndex - 1, reachedEnd: true);
        }
        if (currentIndex == 0) {
          _bunnyMovement();
          _bunnyOnSameIndex(isFirst: true, currentIndex: currentIndex + 1, reachedEnd: false);
        } else if (!reachedEnd) {
          _bunnyMovement();
          _bunnyOnSameIndex(isFirst: true, currentIndex: currentIndex + 1, reachedEnd: reachedEnd);
        } else {
          _bunnyMovement();
          _bunnyOnSameIndex(isFirst: true, currentIndex: currentIndex - 1, reachedEnd: reachedEnd);
        }
      }
    }
  }

  void bunnyPicker() {
    _bunnyOnSameIndex(isFirst: true);
  }
}
