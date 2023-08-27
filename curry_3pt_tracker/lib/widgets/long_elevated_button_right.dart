import "package:assorted_layout_widgets/assorted_layout_widgets.dart";
import "package:flutter/material.dart";

class LongElevatedButtonRight extends StatefulWidget {
  final String label;
  final IconData icon;
  final dynamic onTap;
  const LongElevatedButtonRight({
    super.key,
    required this.label,
    required this.icon,
    this.onTap,
  });

  @override
  State<LongElevatedButtonRight> createState() => _LongElevatedButtonRightState();
}

class _LongElevatedButtonRightState extends State<LongElevatedButtonRight> {

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        icon: Icon(
          widget.icon,
          size: 28,
        ),
        onPressed: widget.onTap,
        label: Text(
          widget.label,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        style: ElevatedButton.styleFrom(
          side: const BorderSide(
            color: Colors.white,
            width: 1.5,
          ),
          backgroundColor: Theme.of(context).colorScheme.secondary,
          shadowColor: Colors.black,
          elevation: 6,
          shape: const NonUniformRoundedRectangleBorder(
            hideRightSide: true,
            borderRadius: BorderRadius.horizontal(
              left: Radius.circular(20),
            ),
          ),
        ),
      ),
    );
  }
}
