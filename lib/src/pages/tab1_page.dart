import 'package:flutter/material.dart';
import 'package:noticiero/src/providers/zenotiProvider.dart';
import 'package:noticiero/src/widgets/header1.dart';
import 'package:noticiero/src/widgets/listItems.dart';
import 'package:provider/provider.dart';


class Tab1Page extends StatefulWidget {
  
  @override
  _Tab1PageState createState() => _Tab1PageState();
}

class _Tab1PageState extends State<Tab1Page> with AutomaticKeepAliveClientMixin {
 
  @override
  Widget build(BuildContext context) {
     final _screenSize = MediaQuery.of(context).size;
     final currentStatus = Provider.of<ZenotiProvider>(context);

    return Scaffold(
      body: SafeArea(
              child: Stack(
                  overflow: Overflow.clip,
                  children: <Widget>[
                        Positioned(
                              top: 0,
                              right: 0,
                              child: Container(
                            
                                    height: _screenSize.height * 0.4,
                                    width:  _screenSize.width,
                                    child: getheader1(context),
                              
                                    ),
                        ),
                        Positioned(
                                top: 230,
                                right: 0,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15.0),
                                      child: Container(
                                      padding: EdgeInsets.only(left: 8.0, right: 8.0),
                                      height: _screenSize.height * 0.55,
                                      width:  _screenSize.width,
                                       child: getListItems()),
                                ),
                        ),
                ],
                )
        ),
      );
  }

  @override
  bool get wantKeepAlive => true;

  Widget _createBackground(){
    return Container(
              height: double.infinity,
              width: double.infinity,
             // color: Color(0xff615AAB),
              child: CustomPaint(
                                painter: _HeaderWavePainter(),
                        ),
            );
  }

 
}

class _HeaderWavePainter extends CustomPainter{
  
  @override
  void paint(Canvas canvas, Size size) {
    
    final lapiz = new Paint();
    lapiz.color = Colors.lightBlue; //Color(0xff615AAB);
    lapiz.style = PaintingStyle.fill; //bordes
    lapiz.strokeWidth = 20.0;
    lapiz.strokeWidth = 5.0;

    final path = new Path();
    path.lineTo(0, size.height * 0.25);
    path.lineTo(size.width, size.height * 0.25);
    path.lineTo(size.width, 0);
    canvas.drawPath(path, lapiz);
    
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    
    return true;
  }

}

