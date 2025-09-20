import 'package:flutter/material.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  final List<Map<String, String>> imageItems = [
    {"url": "images/assets/image6.png"},
    {"url": "images/assets/image7.png"},
  ];

  final List<Map<String, String>> imageProductItems = [
    {
      "url": "images/assets/image8.png",
      "title": "Armchair",
      "subTitle": "\$50/month",
    },

    {
      "url": "images/assets/image9.png",
      "title": "Coffee Table",
      "subTitle": "\$30/month",
    },
    {
      "url": "images/assets/image10.png",
      "title": "Rug",
      "subTitle": "\$20/month",
    },
    {
      "url": "images/assets/image8.png",
      "title": "Armchair",
      "subTitle": "\$50/month",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Product Details',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Icon(Icons.arrow_back),
        ),
        actions: [
          Image(
            height: 24,
            width: 24,
            image: AssetImage('images/assets/Vector - 0.png'),
          ),
          SizedBox(width: 10),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SizedBox(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Row(
                    children:
                        imageItems.map((item) {
                          return GestureDetector(
                            onTap: () {
                              debugPrint("Selected Item:${item['url']}");
                            },
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(right: 12),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: Image(
                                      height: 200,
                                      width: 200,
                                      fit: BoxFit.cover,
                                      image: AssetImage('${item['url']}'),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                  ),
                ),
              ),
            ),

            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Modern Sofa',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'This stylish sofa is perfect for any modern living room. It features a sleek design, comfortable cushions, and durable fabric. Available in various colors.',
                    style: TextStyle(color: Color(0xff121717)),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Details',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    height: 0.1,
                    width: double.infinity,
                    child: Divider(),
                  ),
                  SizedBox(height: 15),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Material',
                              style: TextStyle(color: Color(0xff617D8A)),
                            ),
                            Text('Fabric'),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Dimension',
                              style: TextStyle(color: Color(0xff617D8A)),
                            ),
                            Text('84"W x 36"D x 32"H'),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Divider(),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Color',
                              style: TextStyle(color: Color(0xff617D8A)),
                            ),
                            Text('Grey'),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Condition',
                              style: TextStyle(color: Color(0xff617D8A)),
                            ),
                            Text('New'),
                          ],
                        ),
                      ),
                    ],
                  ),

                  ///for new work tab controller starts here
                  Container(
                    height: 450,
                    child: DefaultTabController(
                      length: 3,
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              top: 25,
                              left: 5,
                              right: 5,
                              bottom: 10,
                            ),
                            child: Container(
                              height: 45,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 217, 215, 215),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: TabBar(
                                indicatorPadding: EdgeInsets.all(6),
                                indicatorSize: TabBarIndicatorSize.tab,
                                dividerColor: Colors.transparent,
                                indicator: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                labelColor: Colors.black,
                                unselectedLabelColor: Colors.black,
                                tabs: [
                                  Tab(text: 'Daily'),
                                  Tab(text: 'Weekly'),
                                  Tab(text: 'Monthly'),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: TabBarView(
                              children: [
                                Column(
                                  children: [
                                    Expanded(
                                      child: ScrollConfiguration(
                                        behavior: const ScrollBehavior()
                                            .copyWith(overscroll: false),
                                        child: Center(
                                          child: Text('This is Upcoming Page'),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Center(child: Text('This is Upcoming Page')),
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: 12,
                                        top: 20,
                                      ),
                                      child: Align(
                                        alignment: Alignment.bottomLeft,
                                        child: Text(
                                          'Related Products',
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: SizedBox(
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                            left: 10,
                                            right: 10,
                                          ),
                                          child: Row(
                                            children:
                                                imageProductItems.map((item) {
                                                  return GestureDetector(
                                                    onTap: () {
                                                      debugPrint(
                                                        "Selected Item:${item['title']}",
                                                      );
                                                    },
                                                    child: Column(
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                right: 12,
                                                              ),
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius.circular(
                                                                  12,
                                                                ),
                                                            child: Image(
                                                              height: 200,
                                                              width: 200,
                                                              fit: BoxFit.cover,
                                                              image: AssetImage(
                                                                '${item['url']}',
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(height: 5),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets.only(
                                                                right: 12,
                                                              ),
                                                          child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                style: TextStyle(
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                                '${item['title']}',
                                                              ),
                                                              SizedBox(
                                                                width: 200,
                                                                child: Text(
                                                                  style: TextStyle(
                                                                    fontSize:
                                                                        12,
                                                                    color: Color(
                                                                      0xff617D8A,
                                                                    ),
                                                                  ),
                                                                  '${item['subTitle']}',
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                }).toList(),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  ///ends here
                  ///
                  Row(
                    children: [
                      Container(
                        height: 48,
                        width: 135,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 217, 215, 215),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(child: Text('\$150/month', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),)),
                      ),
                      Spacer(),
                      Container(
                        height: 48,
                        width: 120,
                        decoration: BoxDecoration(
                          color: const Color(0xff1294D4),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(child: Text('Book Now', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),)),
                      )

                    ],
                  ),
                  SizedBox(height: 30,)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
