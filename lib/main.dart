import 'package:flutter/material.dart';

void main() {
  runApp(MedicalStoreApp());
}

class MedicalStoreApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'متجر المنتجات الطبية',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        scaffoldBackgroundColor: Colors.grey[100],
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final List<Map<String, dynamic>> products = [
    {
      'name': 'فيتامين سي فوّار 1000 ملغ',
      'category': 'مكملات غذائية',
      'price': '15,000 ل.س',
    },
    {
      'name': 'جهاز قياس ضغط الدم الرقمي',
      'category': 'أجهزة طبية',
      'price': '125,000 ل.س',
    },
    {
      'name': 'كمامات طبية (علبة 50 قطعة)',
      'category': 'مستلزمات وقاية',
      'price': '8,500 ل.س',
    },
    {
      'name': 'مسكن ألم وخافض حرارة',
      'category': 'أدوية عامة',
      'price': '6,000 ل.س',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('الصيدلية الرقمية', style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'ابحث عن دواء، مستلزمات، أو أجهزة...',
                prefixIcon: Icon(Icons.search, color: Colors.teal),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.teal[50],
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.teal.shade200),
              ),
              child: Row(
                children: [
                  Icon(Icons.camera_alt, size: 40, color: Colors.teal),
                  SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('هل لديك وصفة طبية؟', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                        SizedBox(height: 4),
                        Text('صور الوصفة وارفعها وسنقوم بتوصيل الأدوية إليك.', style: TextStyle(color: Colors.grey[700], fontSize: 12)),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
                    onPressed: () {},
                    child: Text('رفع', style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Text(
              'المنتجات الشائعة',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.teal[800]),
            ),
            SizedBox(height: 10),
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.75,
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 5,
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                          ),
                          child: Center(
                            child: Icon(Icons.medical_services, size: 50, color: Colors.teal),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              product['category'],
                              style: TextStyle(color: Colors.teal, fontSize: 10, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 2),
                            Text(
                              product['name'],
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(height: 4),
                            Text(
                              product['price'],
                              style: TextStyle(color: Colors.grey[800], fontWeight: FontWeight.w600, fontSize: 13),
                            ),
                            SizedBox(height: 8),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.teal,
                                  padding: EdgeInsets.symmetric(vertical: 4),
                                  minimumSize: Size(0, 30),
                                ),
                                onPressed: () {},
                                child: Text('إضافة للسلة', style: TextStyle(fontSize: 12, color: Colors.white)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
