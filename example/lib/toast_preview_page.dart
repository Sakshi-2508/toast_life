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
      backgroundColor: const Color(0xffeef2f7),
      body: Stack(
        children: [
          Positioned(
            top: -80,
            right: -60,
            child: Container(
              width: 220,
              height: 220,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: widget.color.withValues(alpha: 0.12),
              ),
            ),
          ),

          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 46,
                    height: 46,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.05),
                          blurRadius: 18,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),
                    child: IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.arrow_back_ios_new_rounded),
                    ),
                  ),

                  const SizedBox(height: 35),

                  Center(
                    child: Container(
                      width: 210,
                      height: 210,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: widget.color.withValues(alpha: 0.22),
                            blurRadius: 60,
                            spreadRadius: 12,
                          ),
                        ],
                      ),
                      child: Lottie.asset(widget.animationPath, repeat: true),
                    ),
                  ),

                  const SizedBox(height: 35),

                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: widget.color.withOpacity(0.10),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Text(
                      widget.type.name.toUpperCase(),
                      style: TextStyle(
                        color: widget.color,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  Text(
                    widget.title,
                    style: const TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w900,
                      color: Colors.black,
                      height: 1.1,
                    ),
                  ),

                  const SizedBox(height: 16),

                  Text(
                    widget.description,
                    style: const TextStyle(
                      fontSize: 17,
                      color: Colors.black54,
                      height: 1.6,
                    ),
                  ),

                  const SizedBox(height: 36),

                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(22),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.75),
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(
                        color: widget.color.withValues(alpha: 0.25),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: widget.color.withValues(alpha: 0.10),
                          blurRadius: 30,
                          offset: const Offset(0, 12),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 48,
                          height: 48,
                          decoration: BoxDecoration(
                            color: widget.color.withValues(alpha: 0.10),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Icon(widget.icon, color: widget.color),
                        ),

                        const SizedBox(width: 16),

                        Expanded(
                          child: Text(
                            widget.message,
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.black87,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const Spacer(),

                  Center(
                    child: Text(
                      "Toast appears automatically when this page opens.",
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
