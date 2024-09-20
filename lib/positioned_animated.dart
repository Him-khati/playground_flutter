
import 'package:flutter/material.dart';

class SwapAnimationFilterWidget extends StatefulWidget {
  const SwapAnimationFilterWidget({super.key});

  @override
  State<SwapAnimationFilterWidget> createState() => _SwapAnimationFilterWidgetState();
}

class _SwapAnimationFilterWidgetState extends State<SwapAnimationFilterWidget> {

  bool swap = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10,),
        Text("Yesss",style: TextStyle(color: Colors.white)),
        SizedBox(
          height: 400,
          width: double.infinity,
          child: Stack(
            children: [
              Text("Ohh Yeah"),
              AnimatedPositioned(
                  left: (swap ? 20 : 60),
                  width: 20,
                  height: 80,
                  child: ColoredBox(color: Colors.blue),
                  duration: Duration(milliseconds: 800)
              ),

              AnimatedPositioned(
                  left: (swap ? 60 : 20),
                  width: 20,
                  height: 100,
                  child: ColoredBox(color: Colors.red),
                  duration: Duration(milliseconds: 800)
              )
            ],
          ),
        ),

        ElevatedButton(onPressed: (){

          setState(() {
            swap = !swap;
          });
        }, child: Text("Swap"))
      ],
    );
  }
}
