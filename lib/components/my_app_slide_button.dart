import 'package:flutter/material.dart';
import 'package:myapp/components/my_app_text.dart';

class MyAppSlideButton extends StatefulWidget {
  const MyAppSlideButton({
    super.key,
    required this.onSlideComplete,
    this.color = Colors.white,
    this.text,
    this.reverse = false,
    this.width = 200.0,
    this.height = 50.0,
  });

  final VoidCallback onSlideComplete;
  final Color color;
  final String? text;
  final bool reverse;
  final double width;
  final double height;

  @override
  State<MyAppSlideButton> createState() => _MyAppSlideButtonState();
}

class _MyAppSlideButtonState extends State<MyAppSlideButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    if (widget.reverse) {
      _animation = Tween<Offset>(
        begin: const Offset(0.5, 0.0),
        end: const Offset(0.15, 0.0),
      ).animate(_controller);
    } else {
      _animation = Tween<Offset>(
        begin: const Offset(-0.5, 0.0),
        end: const Offset(-0.15, 0.0),
      ).animate(_controller);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    BorderRadius borderRadius = widget.reverse
        ? const BorderRadius.only(
            topLeft: Radius.circular(25), bottomLeft: Radius.circular(25))
        : const BorderRadius.only(
            topRight: Radius.circular(25), bottomRight: Radius.circular(25));

    return GestureDetector(
      onHorizontalDragUpdate: (details) {
        setState(() {
          _controller.value = (widget.reverse
                  ? widget.width - details.localPosition.dx
                  : details.localPosition.dx) /
              context.size!.width;
        });
      },
      onHorizontalDragEnd: (details) {
        if (_controller.value > 0.7) {
          _controller.forward().then((_) {
            widget.onSlideComplete();
            _controller.reset();
          });
        } else {
          _controller.reverse();
        }
      },
      child: SlideTransition(
        position: _animation,
        child: Container(
          width: widget.width,
          height: widget.height,
          decoration: BoxDecoration(
            color: widget.color,
            borderRadius: borderRadius,
            border: Border.all(color: Colors.blue),
            boxShadow: const [
              BoxShadow(
                color: Colors.blue,
                blurRadius: 5,
              ),
            ],
          ),
          child: Row(
            children: [
              !widget.reverse ? const SizedBox(width: 90.0) : const SizedBox(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Center(
                  child: MyAppText(
                    text: widget.text ?? '',
                    style: MyAppTextStyles.smallBlue,
                    maxLines: 2,
                  ),
                ),
              ),
              widget.reverse ? const SizedBox(width: 90.0) : const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
