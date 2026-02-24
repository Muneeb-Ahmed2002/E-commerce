import 'package:flutter/material.dart';

class Retry extends StatelessWidget {
  final Icon icon;
  final String message;
  final VoidCallback onRetry;

  const Retry({
    super.key,
    required this.icon,
    required this.message,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon,
          Text(
            message,
            style: const TextStyle(fontSize: 16, color: Colors.black54),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),
          ElevatedButton(
            onPressed: onRetry,
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(120, 40),
            ),
            child: const Text('Retry'),
          ),
        ],
      ),
    );
  }
}
