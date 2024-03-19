import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_moon/widgets/custom_drop_down_button.dart';

class HomePage extends StatelessWidget {

  late double _deviceWidth, _deviceHeight;

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {

    _deviceWidth = MediaQuery.of(context).size.width;
    _deviceHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: Container(
          width: _deviceWidth,
          height: _deviceHeight,
          // Set the horizontal padding as 8% of the device width
          padding: EdgeInsets.symmetric(horizontal: _deviceWidth * .08),
          child: Stack(
            children: [
              // The bottom element of the stack is the form
              Column(
                // Main axis is vertical
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // Cross axis is horizontal
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _pageTitle(),
                  _bookRideFormWidget(),
                ],
              ),
              // The top element of the stack is an align widget (allows to easily handle the alignment of an element)
              Align(
                alignment: Alignment.centerRight,
                child: _astroMoonImage(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _pageTitle() {
    return Container(
      margin: EdgeInsets.only(top: _deviceHeight * 0.04),
      child: const Text(
        "#GoMoon", 
        style: TextStyle(
          color: Colors.white,
          fontSize: 75,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }

  Widget _bookRideFormWidget() {
    return Container(
      height: _deviceHeight * 0.25,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _destinationDropDown(),
          _travelersInformationWidget(),
          _submitButton(),
        ],
      ),
    );
  }

  Widget _destinationDropDown() {
    return CustomDropDownButton(
      values: const [
        'Lumina Crater Haven',
        'Tranquility Basin Retreat',
        'Artemis Reach Outpost',
      ],
      width: _deviceWidth,
    );
  }

  Widget _travelersInformationWidget() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // DropDown for the number of people
        CustomDropDownButton(
          values: const [
            '1',
            '2',
            '3',
            '4',
          ], 
          width: _deviceWidth * 0.42,
        ),
        // DropDown for the type of ride
        CustomDropDownButton(
          values: const [
            'Economic',
            'Business',
            'First Class',
            'Private',
          ], 
          width: _deviceWidth * 0.38,
        ),
      ],
    );
  }

  Widget _submitButton() {
    return Container(
      width: _deviceWidth,
      margin: EdgeInsets.only(bottom: _deviceHeight * 0.025),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: MaterialButton(
        onPressed: () { },
        child: const Text(
          "Book Ride", 
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
    );
  }

  Widget _astroMoonImage() {
    return Container(
      width: _deviceWidth * 0.65,
      height: _deviceHeight * 0.50,
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.contain,
          image: AssetImage("assets/images/astro_moon.png")
        )
      ),
    );
  }
}