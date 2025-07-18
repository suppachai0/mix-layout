import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'components/drawer.dart';

class GalleryPage extends StatelessWidget {
  final List<String> imagePaths;

  const GalleryPage({super.key, required this.imagePaths});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('รูปทั้งหมด'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.home),
            tooltip: 'กลับหน้าแรก',
            onPressed: () {
              Navigator.of(context).popUntil((route) => route.isFirst);
            },
          ),
        ],
      ),
      drawer: const MyDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 1.0,
          ),
          itemCount: imagePaths.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Get.dialog(
                  Dialog(
                    backgroundColor: Colors.transparent,
                    insetPadding: const EdgeInsets.all(12),
                    child: Stack(
                      alignment: Alignment.topRight,
                      children: [
                        Hero(
                          tag: imagePaths[index],
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Image.asset(
                              imagePaths[index],
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.close, color: Colors.white),
                          onPressed: () => Get.back(),
                        ),
                      ],
                    ),
                  ),
                );
              },
              child: Hero(
                tag: imagePaths[index],
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(imagePaths[index], fit: BoxFit.cover),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
