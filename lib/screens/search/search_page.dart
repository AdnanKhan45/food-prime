
import 'package:flutter/material.dart';
import 'package:food_prime_app/data/food_prime_data.dart';
import 'package:food_prime_app/screens/main/nav_pages/home/home_category/food/food_detail_page.dart';
import 'package:food_prime_app/widgets/search_widget.dart';
class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {


  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {

    _searchController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final filteredData = SEARCH_FOOD_PRIME_DATA.where((element) => element['title']!.contains(_searchController.text) || element['title']!.toLowerCase().contains(_searchController.text.toLowerCase())).toList();
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 70),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  GestureDetector(onTap: () => Navigator.pop(context),child: const Icon(Icons.arrow_back_ios)),
                  const SizedBox(width: 10,),
                  Expanded(
                    child: SearchWidget(
                      controller: _searchController,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 25,),

              _searchController.text.isNotEmpty?Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: filteredData.map((searchData) {
                  return _searchItemWidget(searchData);
                }).toList(),
              ) : Container()
            ],
          ),
        ),
      ),
    );
  }

  Widget _searchItemWidget(Map<String, String> data) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) => FoodDetailPage(data: data)));
          },
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("${data['title']}", style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),),
                    const SizedBox(height: 5,),
                    const Text("Greek style pizza, new england style,pizza dough, feta cheese"),
                    const SizedBox(height: 5,),
                    const Text("\$13", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),)
                  ],
                ),
              ),
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Image.asset("assets/${data['image']}"),
              )
            ],
          ),
        ),
        const SizedBox(height: 10,),
        Container(
            width: double.infinity,
            height: 1,
            color: Colors.grey[350]
        ),
        const SizedBox(height: 10,)
      ],
    );
  }
}
