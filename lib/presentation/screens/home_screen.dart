import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:fit_bharat_family/data/models/product.dart';
import 'package:fit_bharat_family/logic/blocs/product/product_bloc.dart';

class HomeScreen extends StatefulWidget {
  static String route = "homeScreen";
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  AssetImage prod1 = const AssetImage("assets/images/prod1.png");
  AssetImage prod2 = const AssetImage("assets/images/prod2.png");
  late ProductBloc productBloc;
  @override
  void initState() {
    productBloc = BlocProvider.of<ProductBloc>(context);
    productBloc.add(FetchAllProducts());
    super.initState();
  }

  List<Product> _prodList = [];
  final ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<ProductBloc, ProductState>(
        listener: (context, state) {
          if (state is FetchAllProductSuccessState) {
            _prodList = List.from(state.prodList);
          }
        },
        builder: (context, state) {
          if (state is FetchAllProductInProgressState) {
            return const Center(child: CircularProgressIndicator());
          }
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                controller: scrollController,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 30),
                    // Drawer(),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.menu,
                        ),
                        padding: EdgeInsets.zero),
                    const SizedBox(height: 50),
                    const SizedBox(
                      width: 300,
                      child: Text(
                        "Hello User, What would you like to order today?",
                        style: TextStyle(
                          fontSize: 19,
                        ),
                      ),
                    ),
                    const SizedBox(height: 25),
                    SizedBox(
                      width: 325,
                      height: 100,
                      child: TextFormField(
                        decoration: InputDecoration(
                          fillColor: Colors.grey,
                          hintText: "Search",
                          hintStyle: const TextStyle(
                            fontSize: 15,
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    const Text(
                      "All Products",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 30),
                    _prodList.isNotEmpty
                        ? GridView.builder(

                          controller: scrollController,
                            shrinkWrap: true,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2, 
                                    childAspectRatio: 2/3,
                                    mainAxisSpacing: 10
                                    ),
                            itemCount: _prodList.length,
                            itemBuilder: (ctx, ind) {
                              return CategoryWidget(
                                title: _prodList[ind].name,
                                image: Image.network(
                                  _prodList[ind].images[0],
                                ),
                                price: _prodList[ind].price,
                              );
                            },
                          )
                        : Row(
                            children: [
                              CategoryWidget(
                                title: "Milk",
                                image: Image(
                                  image: prod1,
                                  height: 10,
                                ),
                                price: "400",
                              ),
                              const SizedBox(width: 10),
                              CategoryWidget(
                                title: "Honey",
                                image: Image(
                                  image: prod2,
                                  height: 10,
                                ),
                                price: "400",
                              ),
                            ],
                          ),
                    // SizedBox(height: 30),
                    /* const Text(
                      "All Combos",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 30),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          CategoryWidget(
                              title: "Honey",
                              image: Image(image: prod2, height: 10)),
                          CategoryWidget(
                              title: "Milk",
                              image: Image(image: prod1, height: 10)),
                          const SizedBox(width: 10),
                          CategoryWidget(
                              title: "Honey",
                              image: Image(image: prod2, height: 10)),
                        ],
                      ),
                    ), */
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class CategoryWidget extends StatelessWidget {
  final String title;
  final Image image;
  final String price;
  const CategoryWidget({
    Key? key,
    required this.title,
    required this.image,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 2300,
      width: 170,
      child: Card(
        elevation: 2,
        borderOnForeground: false,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        shadowColor: Colors.grey,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              SizedBox(
                // padding: EdgeInsets.all(50),
                height: 90,
                width: 90,
                // color: Colors.grey,
                child: image,
              ),
              const SizedBox(height: 10),
              Text(title,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 15),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // const SizedBox(width: 1),
                  Text(
                    "\u{20B9}$price",
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.orange[50],
                      shape: const CircleBorder(),
                    ),
                    child: const Icon(
                      Icons.add,
                      color: Colors.orange,
                    ),
                    onPressed: () {},
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
