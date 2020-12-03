import 'package:flutter/material.dart';
import 'package:intro_slider/dot_animation_enum.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';
import 'package:rencanggunung_app/login.dart';

class Splash extends StatefulWidget {
  Splash({Key key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  DateTime currentBackPressTime;
  List<Slide> slides = new List();
  Function goToTab;

  @override
  void initState() {
    super.initState();
    // Timer(Duration(seconds: 5), () {
    //   navigateUser();
    // });

    slides.add(
      new Slide(
        title: "Pesan",
        description: "Welcome to Rencang Gunung Outdoor",
        pathImage: "assets/images/rg_logo.png",
      ),
    );
    slides.add(new Slide(
      title: "Bersedekah",
      description: "Selamat Datang Rencang Gunung Outdoor",
      pathImage: "assets/images/kufi_tdc.png",
    ));
    slides.add(new Slide(
      title: "Dukung UMKM",
      description: "Sugeng Rawuh Rencang Gunung Outdoor",
      pathImage: "assets/images/pricelist.png",
    ));
  }

  void onDonePress() {
    // Back to the first tab
    // this.goToTab(0);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginApp()),
    );
  }

  void onTabChangeCompleted(index) {
    // Index of current tab is focused
  }

  Widget renderNextBtn() {
    return Icon(
      Icons.navigate_next,
      color: Color(0xffffcc5c),
      size: 35.0,
    );
  }

  Widget renderDoneBtn() {
    return Icon(
      Icons.done,
      color: Color(0xffffcc5c),
    );
  }

  Widget renderSkipBtn() {
    return Icon(
      Icons.skip_next,
      color: Color(0xffffcc5c),
    );
  }

  List<Widget> renderListCustomTabs() {
    List<Widget> tabs = new List();
    for (int i = 0; i < slides.length; i++) {
      Slide currentSlide = slides[i];
      tabs.add(Container(
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment.bottomCenter,
        child: Center(
          child: Container(
            margin: EdgeInsets.fromLTRB(20, 200, 20, 50),
            alignment: Alignment.bottomCenter,
            child: ListView(
              children: <Widget>[
                GestureDetector(
                    child: Image.asset(
                  currentSlide.pathImage,
                  width: 200.0,
                  height: 200.0,
                  fit: BoxFit.contain,
                )),
                Container(
                  child: Text(
                    currentSlide.title,
                    style: currentSlide.styleTitle,
                    textAlign: TextAlign.center,
                  ),
                  margin: EdgeInsets.only(top: 20.0),
                ),
                Container(
                  child: Text(
                    currentSlide.description,
                    style: currentSlide.styleDescription,
                    textAlign: TextAlign.center,
                    maxLines: 5,
                    overflow: TextOverflow.ellipsis,
                  ),
                  margin: EdgeInsets.only(top: 20.0),
                ),
              ],
            ),
          ),
        ),
      ));
    }
    return tabs;
  }

  @override
  Widget build(BuildContext context) {
    return new IntroSlider(
      // List slides
      slides: this.slides,

      // Skip button
      renderSkipBtn: this.renderSkipBtn(),
      colorSkipBtn: Color(0x33ffcc5c),
      highlightColorSkipBtn: Color(0xFF38D7F3),

      // Next button
      renderNextBtn: this.renderNextBtn(),

      // Done button
      renderDoneBtn: this.renderDoneBtn(),
      onDonePress: this.onDonePress,
      colorDoneBtn: Color(0x33ffcc5c),
      highlightColorDoneBtn: Color(0xFFA0DBE5),

      // Dot indicator
      colorDot: Color(0xFF2AA4EB),
      sizeDot: 13.0,
      typeDotAnimation: dotSliderAnimation.SIZE_TRANSITION,

      // Tabs
      listCustomTabs: this.renderListCustomTabs(),
      backgroundColorAllSlides: Colors.white,
      refFuncGoToTab: (refFunc) {
        this.goToTab = refFunc;
      },

      // Show or hide status bar
      shouldHideStatusBar: true,

      // On tab change completed
      onTabChangeCompleted: this.onTabChangeCompleted,
    );
  }
}
