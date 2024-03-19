import 'package:flutter/material.dart';

class CustomDropDownButton extends StatelessWidget {
  List<String> values;
  double width;

  CustomDropDownButton({
    required this.values, 
    required this.width
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: EdgeInsets.symmetric(horizontal: width * 0.05),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(53, 53, 53, 1.0),
        borderRadius: BorderRadius.circular(10),
      ),
      child: DropdownButton(
        // This means that no function will be called when the value changes
        onChanged: (_) {},
        // Convert the list of strings into a list of DropdownMenuItem elements
        items: values.map((destination) {
          return DropdownMenuItem(
            value: destination,
            child: Text(destination), 
          );
        }).toList(),
        // Set the default value as the first elemento of the list
        value: values.first,
        // Remove the line that appears under the DropDown element
        underline: Container(),
        // Change the color of the element
        dropdownColor: const Color.fromRGBO(53, 53, 53, 1.0),
        // Adjust the font color
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}