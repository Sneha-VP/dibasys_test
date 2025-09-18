import 'package:flutter/material.dart';

import '../app_theme.dart';

class CheckInDialog extends StatelessWidget {
  const CheckInDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor:
          Colors.transparent, // Make the dialog background transparent
      elevation: 0, // Remove shadow
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.black, // Set the background color to black
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.white12),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "Check-in",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white, // Text color for dark background
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "Select Check-in Type",
              style: TextStyle(color: Colors.white70),
            ),

            const SizedBox(height: 20),
            Container(
              width: 150, // Fixed width for the worker card
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              decoration: BoxDecoration(
                color:
                    const Color(0xFF1C1C1C), // Darker gray for the worker card
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.white12),
              ),
              child: Column(
                // Removed const here because Image.asset is not a const widget
                children: [
                  // Replaced Icon with Image.asset
                  Image.asset(
                    'assets/worker_img.png',
                    height: 50, // Adjust height as needed
                    width: 50, // Adjust width as needed
                    // You might need to add a color filter if your image is not amber
                    // color: Colors.amber,
                    // colorBlendMode: BlendMode.srcIn,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Worker",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),
            // Projects Dropdown
            DropdownButtonFormField(
              items: const [
                DropdownMenuItem(value: "Projects", child: Text("Projects")),
                DropdownMenuItem(value: "Tasks", child: Text("Tasks")),
              ],
              onChanged: (_) {},
              decoration: const InputDecoration(
                labelText: "Projects",
                labelStyle: TextStyle(color: Colors.white),
                filled: true,
                fillColor:
                    Color(0xFF1C1C1C), // Dark gray for input field background
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  borderSide: BorderSide.none,
                ),
              ),
              dropdownColor: const Color(0xFF1C1C1C),
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 10),

            // Gates Dropdown
            DropdownButtonFormField(
              items: const [
                DropdownMenuItem(value: "Gates", child: Text("Gates")),
                DropdownMenuItem(value: "Doors", child: Text("Doors")),
              ],
              onChanged: (_) {},
              decoration: const InputDecoration(
                labelText: "Gates",
                labelStyle: TextStyle(color: Colors.white),
                filled: true,
                fillColor: Color(0xFF1C1C1C),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  borderSide: BorderSide.none,
                ),
              ),
              dropdownColor: const Color(0xFF1C1C1C),
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 10),

            const SizedBox(height: 20),
            // Work Type Section
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Select Work Type",
                style: TextStyle(color: AppTheme.textColor),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: RadioListTile(
                    dense: true,
                    contentPadding: EdgeInsets.zero, // Remove extra padding
                    title: const Text(
                      "Budget",
                      style: TextStyle(
                          color: Colors.white, fontSize: 14), // smaller font
                    ),
                    value: "Budget",
                    groupValue: "WorkType",
                    onChanged: (_) {},
                    activeColor: Colors.orange,
                  ),
                ),
                Expanded(
                  child: RadioListTile(
                    dense: true,
                    contentPadding: EdgeInsets.zero,
                    title: const Text(
                      "Issue",
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                    value: "Issue",
                    groupValue: "WorkType",
                    onChanged: (_) {},
                    activeColor: Colors.orange,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),
            // Check-in Button
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.primaryColor,
                padding: const EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text(
                "Check-in",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
