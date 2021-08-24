import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:workos_en/screen/auth/register.dart';

class forgetPassScreen extends StatefulWidget {
  @override
  _forgetPassScreenState createState() => _forgetPassScreenState();
}

class _forgetPassScreenState extends State<forgetPassScreen>
    with TickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> _animation;

  TextEditingController _forgetPasstextController =
      TextEditingController(text: '');

  @override
  void dispose() {
    _animationController.dispose();
    _forgetPasstextController.dispose();

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

  void _forgetPassFCT() {
    print("the text is : ${_forgetPasstextController.text}");
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ListView(
              children: [
                SizedBox(
                  height: size.height * 0.1,
                ),
                Text(
                  "Forget password",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Email address",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      fontSize: 20),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: _forgetPasstextController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(
                  height: 10,
                ),
                MaterialButton(
                  onPressed: _forgetPassFCT,
                  color: Colors.pink.shade700,
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(13)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    child: Text(
                      "Reset now ",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          fontStyle: FontStyle.italic),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
