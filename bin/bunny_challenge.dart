import 'dart:io';
import 'dart:math';

void main(List<String> arguments) {
  BunnyChallenge(['_', '_', '_', '_', 'R', '_', '_', '_', '_', '_']).bunnyLoop();
}

class BunnyChallenge {
  const BunnyChallenge(this.rabbithole);

  final List<String> rabbithole;

  /// Moves the bunny randomly one position to the right or left in the array.
  /// Will move the bunny to the other direction if the min or max of the List is reached
  void bunnyMovement() {
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

  /// Picks up randomly one index in the given array to check if the bunny is on the same index.
  bool bunnyOnSameIndex() {
    final random = Random();
    final bunnyIndex = random.nextInt(rabbithole.length);
    print('Try to pick bunny at: $bunnyIndex');
    print('Currentlist: ${rabbithole.toString()}');
    return rabbithole[bunnyIndex] == 'R';
  }

  /// Checks if [bunnyOnSameIndex] returns true and if so, the bunny is caught.
  /// If not, the bunny is not caught.
  /// If the bunny is caught the programm will exit.
  /// If the bunny is not caught the programm will continue with the next bunnyMovement and then repeat.
  void bunnyCaught() {
    if (bunnyOnSameIndex()) {
      print('Bunny caught!');
      exit(0);
    } else {
      bunnyMovement();
    }
  }

  /// The main loop of the programm.
  void bunnyLoop() {
    while (true) {
      bunnyCaught();
    }
  }
}
