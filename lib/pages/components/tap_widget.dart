import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TapWidget extends StatefulWidget {
  const TapWidget({
    Key? key,
    required this.posx,
    required this.posy,
  }) : super(key: key);
  final double posx;
  final double posy;
  @override
  _TapWidgetState createState() => _TapWidgetState();
}

class _TapWidgetState extends State<TapWidget> with TickerProviderStateMixin {
  late AnimationController _controller;

  late Animation<double> _rotateAnimation;
  late Animation<double> _slideAnimation;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );

    // _rotateAnimation = Tween(end: 0.15, begin: 0.0)
    //     .animate(
    //   CurvedAnimation(
    //       parent: _controller,
    //       curve: Interval(0.0, 0.5, curve: Curves.bounceInOut),
    //   ),
    // );

    _slideAnimation =
        Tween(begin: widget.posy, end: widget.posy - 300.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.5, 1.0, curve: Curves.fastOutSlowIn),
      ),
    );

    _opacityAnimation = Tween(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.5, 1.0, curve: Curves.fastOutSlowIn),
      ),
    );
    _controller.forward();
    //   _controller.addStatusListener((AnimationStatus status) {
    //   if (status == AnimationStatus.completed) {
    //     //_controller.repeat();
    //     final TapBloc userAuthBloc = BlocProvider.of<TapBloc>(context);
    //     userAuthBloc.add(RemoveOldWidgetEvent(index: widget.index));
    //   }
    // });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _slideAnimation,
        builder: (ctx, ch) => Positioned(
              left: widget.posx,
              top: _slideAnimation.value,
              child: Center(
                  child: Text('1',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Color.fromRGBO(
                              255, 250, 250, _opacityAnimation.value),
                          fontSize: 16))

                  //color: Color.fromRGBO(0, 0, 128, _opacityAnimation.value)
                  ),
            ));

    // Positioned(
    //       child: FadeTransition(
    //       opacity: _myAnimation,
    //       child:  new Text('TAP!'),),
    //       );
  }
}
