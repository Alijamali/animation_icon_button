import 'package:flutter/material.dart';
import 'package:flutter_animated_icons/icons8.dart';
import 'package:flutter_animated_icons/lottiefiles.dart';
import 'package:lottie/lottie.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

// When you are using single AnimationController use SingleTickerProviderStateMixin.
// If you need more than one AnimationController use TickerProviderStateMixin

class _MyHomePageState extends State<MyHomePage>
    with TickerProviderStateMixin {
  late AnimationController _settingController;
  late AnimationController _favoriteController;
  late AnimationController _bellController;
  late AnimationController _bookController;

  @override
  void initState() {
    super.initState();

    _settingController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _favoriteController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _bellController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat();
    _bookController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
  }

  @override
  void dispose() {
    _settingController.dispose();
    _favoriteController.dispose();
    _bellController.dispose();
    _bookController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animated Icons"),
        centerTitle: true,
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              /// Tap with animation example
              Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Tap'),
                  ),
                  IconButton(
                    splashRadius: 150,
                    iconSize: 400,
                    onPressed: () {
                      _settingController.reset();
                      _settingController.forward();
                    },
                    icon: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Lottie.asset(Icons8.whatsapp_rotation_color,
                          controller: _settingController,
                          width: 100,
                          height: 100,
                          fit: BoxFit.fill),
                    ),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Divider(height: 1, color: Colors.black87),
              ),

              /// Toggle example
              Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Toggle'),
                  ),
                  IconButton(
                    splashRadius: 50,
                    iconSize: 100,
                    onPressed: () {
                      if (_favoriteController.status ==
                          AnimationStatus.dismissed) {
                        _favoriteController.reset();
                        _favoriteController.animateTo(0.6);
                      } else {
                        _favoriteController.reverse();
                      }
                    },
                    icon: Lottie.asset(Icons8.heart_color,
                        controller: _favoriteController,
                        height: 100,
                        fit: BoxFit.cover),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Divider(height: 1, color: Colors.black87),
              ),

              /// Hover example
              Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Hover'),
                  ),
                  MouseRegion(
                    onEnter: (event) {
                      _bookController.repeat();
                    },
                    onExit: (event) {
                      _bookController.stop();
                    },
                    child: IconButton(
                      splashRadius: 50,
                      iconSize: 100,
                      onPressed: () {
                        if (_bookController.status ==
                            AnimationStatus.dismissed) {
                          _bookController.reset();
                          _bookController.animateTo(1);
                        } else {
                          _bookController.reverse();
                        }
                      },
                      icon: Lottie.asset(Icons8.book,
                          controller: _bookController,
                          height: 100,
                          fit: BoxFit.cover),
                    ),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Divider(height: 1, color: Colors.black87),
              ),

              /// repeat example
              Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Repeat'),
                  ),
                  IconButton(
                    splashRadius: 50,
                    iconSize: 100,
                    onPressed: () {
                      // print(_bellController.status);
                      if (_bellController.isAnimating) {
                        _bellController.stop();
                        _bellController.reset();
                      } else {
                        _bellController.repeat();
                      }
                    },
                    icon: Lottie.asset(LottieFiles.$63128_bell_icon,
                        controller: _bellController,
                        height: 100,
                        fit: BoxFit.cover),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
