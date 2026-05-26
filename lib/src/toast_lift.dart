import 'package:flutter/material.dart';
import 'toast_lift_position.dart';
import 'toast_lift_type.dart';
import 'toast_lift_style.dart';

class ToastLift {
  static void show(
    BuildContext context, {
    String? title,
    required String message,
    ToastLiftType type = ToastLiftType.success,
    ToastLiftPosition position = ToastLiftPosition.bottom,
    ToastLiftStyle style = ToastLiftStyle.minimal,
    Duration duration = const Duration(seconds: 3),
  }) {
    final overlay = Overlay.of(context);
    late OverlayEntry overlayEntry;

    overlayEntry = OverlayEntry(
      builder: (context) {
        return _ToastWidget(
          title: title,
          message: message,
          type: type,
          position: position,
          duration: duration,
          style: style,
        );
      },
    );

    overlay.insert(overlayEntry);

    Future.delayed(duration, () {
      overlayEntry.remove();
    });
  }
}

class _ToastWidget extends StatefulWidget {
  final String message;
  final ToastLiftType type;
  final ToastLiftPosition position;
  final String? title;
  final Duration duration;
  final ToastLiftStyle style;

  const _ToastWidget({
    this.title,
    required this.message,
    required this.type,
    required this.position,
    required this.duration,
    required this.style,
  });

  @override
  State<_ToastWidget> createState() => _ToastWidgetState();
}

class _ToastWidgetState extends State<_ToastWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  late Animation<double> _fadeAnimation;

  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(_controller);

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _controller.forward();
  }

  Color get backgroundColor {
    switch (widget.type) {
      case ToastLiftType.success:
        return Colors.green;

      case ToastLiftType.error:
        return Colors.red;

      case ToastLiftType.warning:
        return Colors.orange;

      case ToastLiftType.info:
        return Colors.blue;

      case ToastLiftType.loading:
        return Colors.purple;
    }
  }

  IconData get icon {
    switch (widget.type) {
      case ToastLiftType.success:
        return Icons.check_circle;

      case ToastLiftType.error:
        return Icons.error;

      case ToastLiftType.warning:
        return Icons.warning;

      case ToastLiftType.info:
        return Icons.info;

      case ToastLiftType.loading:
        return Icons.hourglass_bottom;
    }
  }

  @override
  Widget build(BuildContext context) {
    final toast = Material(
      color: Colors.transparent,
      child: FadeTransition(
        opacity: _fadeAnimation,
        child: SlideTransition(
          position: _slideAnimation,
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 18,
              vertical: 16,
            ),
            decoration: widget.style == ToastLiftStyle.glass
                ? BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(
                      color: Colors.white.withValues(alpha: 0.25),
                      width: 1.2,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: backgroundColor.withValues(alpha: 0.18),
                        blurRadius: 28,
                        offset: const Offset(0, 12),
                      ),
                    ],
                  )
                : BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(
                      color: backgroundColor.withValues(alpha: 0.75),
                      width: 1.5,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: backgroundColor.withValues(alpha: 0.12),
                        blurRadius: 24,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
            child: Row(
              children: [
                Container(
                  width: 42,
                  height: 42,
                  decoration: BoxDecoration(
                    color: backgroundColor.withValues(alpha: 0.10),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    icon,
                    color: backgroundColor,
                    size: 22,
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        widget.title ?? widget.type.name.toUpperCase(),
                        style: const TextStyle(
                          color: Colors.black54,
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.2,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        widget.message,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          height: 1.3,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );

    if (widget.position == ToastLiftPosition.center) {
      return Stack(
        children: [
          Center(child: toast),
        ],
      );
    }

    return Stack(
      children: [
        Positioned(
          left: 20,
          right: 20,
          top: widget.position == ToastLiftPosition.top ? 80 : null,
          bottom: widget.position == ToastLiftPosition.bottom ? 80 : null,
          child: toast,
        ),
      ],
    );
  }
}
