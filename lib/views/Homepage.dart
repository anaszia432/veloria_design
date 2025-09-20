import 'package:flutter/material.dart';
import 'package:veloria_design/views/OrderTracking.dart';
import 'package:veloria_design/views/ProductDetails.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key, t});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _currentIndex = 0;

  // Keep pages in a list so state is preserved using IndexedStack
  final List<Widget> _pages = [HomePage(), OrdersPage(), ProfilePage()];

  void _onTap(int index) {
    if (index == _currentIndex) return;
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titleForIndex(_currentIndex)),
        centerTitle: true,
        actions: [
          _titleForIndex(_currentIndex) == "Home"
              ? Icon(Icons.shopping_cart_outlined, size: 25)
              : Container(),
          SizedBox(width: 5),
        ],
      ),
      body: IndexedStack(index: _currentIndex, children: _pages),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTap,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.black,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined),
            activeIcon: Icon(Icons.shopping_bag),
            label: 'Orders',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

String _titleForIndex(int i) {
  switch (i) {
    case 0:
      return 'Home';
    case 1:
      return 'Orders';
    case 2:
      return 'Profile';
    default:
      return '';
  }
}

class HomePage extends StatelessWidget {
  final List<String> categories = [
    "All",
    "Electronics",
    "Home Goods",
    "Sports",
    "Beauty",
    "Fashion",
    "Books",
  ];

  final List<Map<String, String>> imageItems = [
    {
      "url": "images/assets/image1.png",
      "title": "Smart Kitchen Set",
      "subTitle": "Upgrade your cooking experience",
    },

    {
      "url": "images/assets/image2.png",
      "title": "Tech Bundle",
      "subTitle": "Latest gadgets for tech enthusiasts",
    },
    {
      "url": "images/assets/image6.png",
      "title": "Modern Sofa",
      "subTitle": "The Stylish Sofa is perfect for modern living room",
    },
    {
      "url": "images/assets/image2.png",
      "title": "Tech Bundle",
      "subTitle": "Latest gadgets for tech enthusiasts",
    },
  ];

  final List<Map<String, String>> imageRentalItems = [
    {
      "url": "images/assets/image3.png",
      "title": "DJI Drone",
      "subTitle": "Capture stunning aerial footage",
    },

    {
      "url": "images/assets/image4.png",
      "title": "Canon Camera",
      "subTitle": "Professional photography equipment",
    },
    {
      "url": "images/assets/image5.png",
      "title": "Bose Headphones",
      "subTitle": "Immersive audio experience",
    },
  ];

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        // mainAxisSize: MainAxisSize.min,
        children: [
          // Icon(Icons.home, size: 72),
          // SizedBox(height: 12),
          // Text('Home', style: TextStyle(fontSize: 24)),
          Container(
            width: 370,
            height: 50,
            child: SearchBar(
              hintText: 'Search for items',
              leading: Icon(Icons.search),
              backgroundColor: MaterialStateProperty.all(
                const Color(0xFFF0F2F5),
              ),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    12,
                  ), // adjust corner radius
                ),
              ),
            ),
          ),
          SizedBox(height: 20),

          ///For horizontal category list
          SizedBox(
            height: 40,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              itemCount: categories.length,
              separatorBuilder: (_, __) => const SizedBox(width: 12),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    // Handle tap
                    debugPrint("Selected: ${categories[index]}");
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: Color(0xffF0F2F5),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Text(
                        categories[index],
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          SizedBox(height: 25),

          ///For Image view
          Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                'Featured Items',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
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
                            debugPrint("Selected Item:${item['title']}");
                            item['title'] == 'Modern Sofa'
                                ? Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ProductDetails(),
                                  ),
                                )
                                : Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Homepage(),
                                  ),
                                );
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
                              SizedBox(height: 5),
                              Padding(
                                padding: const EdgeInsets.only(right: 12),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      '${item['title']}',
                                    ),
                                    SizedBox(
                                      width: 200,
                                      child: Text(
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Color(0xff617D8A),
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

          ////For Popular rentals items
          SizedBox(height: 25),
          Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                'Popular Rentals',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.72,
              ),
              itemCount: imageRentalItems.length,
              itemBuilder: (context, index) {
                final item = imageRentalItems[index];
                return Column(
                  children: [
                    Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(
                            '${item['url']}',

                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(height: 8),
                        Padding(
                          padding: const EdgeInsets.only(right: 12),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                                '${item['title']}',
                              ),
                              Text(
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Color(0xff617D8A),
                                ),
                                '${item['subTitle']}',
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class OrdersPage extends StatelessWidget {
  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Icon(Icons.list_alt, size: 72),
          // SizedBox(height: 12),
          // Text('Orders', style: TextStyle(fontSize: 24)),
          Container(
            
            height: 450,
            child: DefaultTabController(
              length: 2,
              child: Column(
                
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: 25,
                      
                      right: 5,
                      bottom: 10,
                    ),
                    child: Container(
                      height: 45,
                      // decoration: BoxDecoration(
                      //   color: const Color.fromARGB(255, 217, 215, 215),
                      //   borderRadius: BorderRadius.circular(8),
                      // ),
                      child: TabBar(
                        // indicatorPadding: EdgeInsets.all(6),
                        tabAlignment: TabAlignment.start, 
                        isScrollable: true,
                        indicatorSize: TabBarIndicatorSize.label,
                        dividerColor: Colors.transparent,
                        indicator: const UnderlineTabIndicator(
                          borderSide: BorderSide(
                            width: 3.0,
                            color: Color(0xffE5E8EB),
                          ), // dash color + thickness
                          insets: EdgeInsets.symmetric(
                            horizontal: 40.0,
                          ), // control dash width
                        ),
                        labelColor: Colors.black,
                        unselectedLabelColor: Color(0xff617D8A),
                        tabs: [Tab(
                        
                          text: 'Active',), 
                          Tab(text: 'Past')
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
                                behavior: const ScrollBehavior().copyWith(
                                  overscroll: false,
                                ),
                                child: Column(
                                  
                                  children: [
                                    ordersItemMethod('Pending','Modern Apartment', 'Order ID: #123456', "images/assets/image11.png",context),
                                    SizedBox(height: 20,),
                                    ordersItemMethod('Ongoing','Modern Apartment', 'Order ID: #789012', "images/assets/image12.png",context),

                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Center(child: Text('This is Upcoming Page')),
                      ],
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
  
  ordersItemMethod(String data1, String data2, String data3, String imgUrl, BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => OrderTracking()));
      },
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Row(
              
              children: [
                Column(
                  crossAxisAlignment : CrossAxisAlignment.start,
                  children: [
                    Text(data1,style: TextStyle(color: Color(0xff617D8A)),),
                    Text(data2,style: TextStyle(fontWeight: FontWeight.bold),),
                    Text(data3,style: TextStyle(color: Color(0xff617D8A)),),
                
                    
                  ],
                ),
                Spacer(),
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image(
                    height: 100,
                    width: 150,
                    fit: BoxFit.cover,
                    image: AssetImage('$imgUrl'),
                  
                    ),
                ),
                
              ],
            ),
          )
      
        ],
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: const [
          Icon(Icons.person, size: 72),
          SizedBox(height: 12),
          Text('Profile', style: TextStyle(fontSize: 24)),
        ],
      ),
    );
  }
}
