import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> imagePaths = [
      'assets/images/1.jpg',
      'assets/images/2.jpg',
      'assets/images/3.jpg',
      'assets/images/4.jpg',
      'assets/images/5.jpg',
      'assets/images/6.jpg',
      'assets/images/7.jpg',
      'assets/images/8.jpg',
      'assets/images/9.jpg',
    ];

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('mix layout'),
          backgroundColor: Colors.teal,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // GridView ใส่รูปและกดดูเต็มจอได้
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FullScreenImagePage(
                              imagePath: imagePaths[index],
                            ),
                          ),
                        );
                      },
                      child: Hero(
                        tag: imagePaths[index],
                        child: Material(
                          color: Colors.transparent,
                          elevation: 6,
                          borderRadius: BorderRadius.circular(18),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(18),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.15),
                                  blurRadius: 8,
                                  offset: const Offset(2, 4),
                                ),
                              ],
                              border: Border.all(
                                color: Colors.teal.shade200,
                                width: 2.5,
                              ),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: Stack(
                                fit: StackFit.expand,
                                children: [
                                  Image.asset(
                                    imagePaths[index],
                                    fit: BoxFit.cover,
                                  ),
                                  Positioned(
                                    right: 6,
                                    bottom: 6,
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                      decoration: BoxDecoration(
                                        color: Colors.black.withOpacity(0.45),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: const Icon(Icons.zoom_in, color: Colors.white, size: 18),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),

              const Divider(height: 32, thickness: 1.2),

              // ListView (ปรับให้สวยขึ้น + กดได้)
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 350),
                    curve: Curves.easeInOut,
                    margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
                    child: Card(
                      elevation: 6,
                      shadowColor: Colors.teal.withOpacity(0.25),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: ListTile(
                        title: Text(
                          'รายการที่ ${index + 1}',
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        subtitle: const Text('รายละเอียดเพิ่มเติมของรายการ', style: TextStyle(fontSize: 14)),
                        trailing: Container(
                          decoration: BoxDecoration(
                            color: Colors.teal.shade50,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: const EdgeInsets.all(6),
                          child: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.teal),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailPage(title: 'รายการที่ ${index + 1}'),
                            ),
                          );
                        },
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// หน้าจอแสดงภาพเต็ม
class FullScreenImagePage extends StatelessWidget {
  final String imagePath;

  const FullScreenImagePage({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ภาพเต็มจอ'),
        backgroundColor: Colors.teal,
      ),
      body: Center(child: Image.asset(imagePath, fit: BoxFit.contain)),
    );
  }
}

// หน้าจอรายละเอียดของรายการ ListView (ตัวอย่าง)
class DetailPage extends StatelessWidget {
  final String title;

  const DetailPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title), backgroundColor: Colors.teal),
      body: Center(
        child: Text(
          'รายละเอียดของ $title',
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
