import 'package:flutter/material.dart';
import 'package:toast_lift/toast_lift.dart';
import 'toast_preview_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  void showToast(
    BuildContext context,
    ToastLiftType type,
    String title,
    String message,
  ) {
    ToastLift.show(
      context,
      title: title,
      message: message,
      type: type,
      position: ToastLiftPosition.bottom,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: Builder(
        builder: (context) {
          return Scaffold(
            backgroundColor: const Color(0xfff5f7fb),
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 40),

                    const Text(
                      "ToastLift",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 38,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 10),

                    const Text(
                      "Beautiful animated toast messages for Flutter apps.",
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 16,
                        height: 1.4,
                      ),
                    ),

                    const SizedBox(height: 50),

                    _demoButton(
                      context,
                      title: "Success Toast",
                      icon: Icons.check_circle,
                      color: Colors.green,
                      type: ToastLiftType.success,
                      message: "Profile saved successfully!",
                    ),

                    _demoButton(
                      context,
                      title: "Error Toast",
                      icon: Icons.error,
                      color: Colors.red,
                      type: ToastLiftType.error,
                      message: "Something went wrong!",
                    ),

                    _demoButton(
                      context,
                      title: "Warning Toast",
                      icon: Icons.warning,
                      color: Colors.orange,
                      type: ToastLiftType.warning,
                      message: "Please check your input.",
                    ),

                    _demoButton(
                      context,
                      title: "Info Toast",
                      icon: Icons.info,
                      color: Colors.blue,
                      type: ToastLiftType.info,
                      message: "New update is available.",
                    ),

                    _demoButton(
                      context,
                      title: "Loading Toast",
                      icon: Icons.hourglass_bottom,
                      color: Colors.purple,
                      type: ToastLiftType.loading,
                      message: "Uploading your file...",
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _demoButton(
    BuildContext context, {
    required String title,
    required IconData icon,
    required Color color,
    required ToastLiftType type,
    required String message,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: InkWell(
        borderRadius: BorderRadius.circular(26),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => ToastPreviewPage(
                title: title,
                description: type == ToastLiftType.success
                    ? "Your profile has been updated successfully."
                    : type == ToastLiftType.error
                    ? "Payment failed due to a network issue. Please try again."
                    : type == ToastLiftType.warning
                    ? "Deleting this file cannot be undone."
                    : type == ToastLiftType.info
                    ? "A new update is available for your application."
                    : type == ToastLiftType.loading
                    ? "Uploading your files to the cloud storage..."
                    : "",
                icon: icon,
                color: color,
                type: type,
                message: message,

                animationPath: type == ToastLiftType.success
                    ? "assets/animations/Success.json"
                    : type == ToastLiftType.error
                    ? "assets/animations/error.json"
                    : type == ToastLiftType.warning
                    ? "assets/animations/Alert.json"
                    : type == ToastLiftType.info
                    ? "assets/animations/info.json"
                    : type == ToastLiftType.loading
                    ? "assets/animations/loading_anim.json"
                    : ""
              ),
            ),
          );
        },
        child: Container(
          height: 64,
          padding: const EdgeInsets.symmetric(horizontal: 18),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(26),
            border: Border.all(color: color.withOpacity(0.8), width: 1.5),
            boxShadow: [
              BoxShadow(
                color: color.withOpacity(0.08),
                blurRadius: 25,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Row(
            children: [
              Container(
                width: 46,
                height: 46,
                decoration: BoxDecoration(
                  color: color.withOpacity(0.08),
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: color, size: 24),
              ),

              const SizedBox(width: 14),

              Text(
                title,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),

              const Spacer(),

              const Icon(
                Icons.arrow_forward_ios,
                color: Colors.black38,
                size: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
