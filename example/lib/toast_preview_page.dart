import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:toast_lift/toast_lift.dart';

class ToastPreviewPage extends StatefulWidget {
  final String title;
  final String description;
  final IconData icon;
  final Color color;
  final ToastLiftType type;
  final String message;
  final String animationPath;

  const ToastPreviewPage({
    super.key,
    required this.title,
    required this.description,
    required this.icon,
    required this.color,
    required this.type,
    required this.message,
    required this.animationPath,
  });

  @override
  State<ToastPreviewPage> createState() => _ToastPreviewPageState();
}

class _ToastPreviewPageState extends State<ToastPreviewPage> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 600), () {
      // ToastLift.show(
      //   context,
      //   title: widget.title,
      //   message: widget.message,
      //   type: widget.type,
      // );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff5f7fb),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back),
              ),

              const SizedBox(height: 35),

              Center(
                child: Container(
                  width: 190,
                  height: 190,
                  // decoration: BoxDecoration(
                  //   shape: BoxShape.circle,
                  //   boxShadow: [
                  //     BoxShadow(
                  //       color: widget.color.withValues(alpha: 64),
                  //       blurRadius: 45,
                  //       spreadRadius: 8,
                  //     ),
                  //   ],
                  // ),
                  child: Lottie.asset(widget.animationPath, repeat: true),
                ),
              ),

              const SizedBox(height: 40),

              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 8,
                ),
                // decoration: BoxDecoration(
                //   color: widget.color.withValues(alpha: 26),
                //   borderRadius: BorderRadius.circular(30),
                // ),
                child: Text(
                  widget.type.name.toUpperCase(),
                  style: TextStyle(
                    color: widget.color,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                  ),
                ),
              ),

              const SizedBox(height: 18),

              Text(
                widget.title,
                style: const TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),

              const SizedBox(height: 14),

              Text(
                widget.description,
                style: const TextStyle(
                  fontSize: 17,
                  color: Colors.black54,
                  height: 1.5,
                ),
              ),

              const SizedBox(height: 35),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(22),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(28),
                  border: Border.all(color: widget.color.withValues(alpha: 64)),
                  // boxShadow: [
                  //   BoxShadow(
                  //     color: widget.color.withValues(alpha: 20),
                  //     blurRadius: 24,
                  //     offset: const Offset(0, 12),
                  //   ),
                  // ],
                ),
                child: Row(
                  children: [
                    Icon(widget.icon, color: widget.color),

                    const SizedBox(width: 14),

                    Expanded(
                      child: Text(
                        widget.message,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black87,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const Spacer(),

              Text(
                "Toast appears automatically when this page opens.",
                style: TextStyle(color: Colors.grey.shade600, fontSize: 14),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
