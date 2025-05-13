import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modernschool/view/utils/constants/constant.dart';

class BorderedButton extends StatefulWidget {
  BorderedButton({
    super.key,
    required this.function,
    required this.text,
    this.color = purple,
    this.radius = 20,
    this.height = 100,
    this.width = 100,
    this.borderSize = 2,
    required this.icon,
    required this.textStyle,
  });

  final String text;
  final Color color;
  final double height;
  final double width;
  final double radius;
  final double borderSize;
  final TextStyle? textStyle;
  final Function function;
  final IconData icon;

  @override
  _BorderedButtonState createState() => _BorderedButtonState();
}

class _BorderedButtonState extends State<BorderedButton> {
  bool isHovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovering = true),
      onExit: (_) => setState(() => isHovering = false),
      child: InkWell(
        onTap: () => widget.function(),
        child: Container(
          decoration: BoxDecoration(
            color: isHovering ? purple : Colors.transparent,
            border: Border.all(width: widget.borderSize, color: widget.color),
            borderRadius: BorderRadius.circular(widget.radius),
          ),
          height: widget.height.h,
          width: widget.width.w,
          child: Padding(
            padding: EdgeInsets.all(20.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  widget.icon,
                  color: isHovering ? Colors.white : widget.color,
                  size: 36.h,
                ),
                Text(
                  widget.text,
                  style: widget.textStyle?.copyWith(
                    color: isHovering ? Colors.white : widget.color,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
