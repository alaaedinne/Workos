import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class login extends StatefulWidget {
  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> with TickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> _animation;

  @override
  void dispose() {
    _animationController.dispose();

    super.dispose();
  }

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 20));
    _animation =
        CurvedAnimation(parent: _animationController, curve: Curves.linear)
          ..addListener(() {
            setState(() {});
          })
          ..addStatusListener((animationStatus) {
            if (animationStatus == AnimationStatus.completed) {
              _animationController.reset();
              _animationController.forward();
            }
          });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CachedNetworkImage(
            imageUrl:
                "https://media.istockphoto.com/photos/businesswoman-using-computer-in-dark-office-picture-id557608443?k=6&m=557608443&s=170667a&w=0&h=Nht6OavIB2YRfdU206QBW3dGoCw_vbLMuXS1HDkuHMY=",
            placeholder: (context, url) =>
                Image.asset("asset/images/wallpaper.jpg", fit: BoxFit.fill),
            errorWidget: (context, url, error) => Icon(Icons.error),
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
            alignment: FractionalOffset(_animation.value, 0),
          ),
          // Start Login page #############################################
          ListView(
            children: [
              Text(
                "Login",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              )
            ],
          )
        ],
      ),
    );
  }
}
