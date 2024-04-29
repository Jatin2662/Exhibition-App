import 'package:flutter/material.dart';


class Example extends StatefulWidget {
  const Example({Key? key}) : super(key: key);

  @override
  State<Example> createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Center(
        child: FutureBuilder(
          future: getusers(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Container(
                child: Center(child: CircularProgressIndicator()),
              );
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              List ids = snapshot.data as List;
              return Column(
                children: [
                  Expanded(
                    flex:1,
                    child: SizedBox(
                      height: 20,
                    ),
                  ),
                  Expanded(
                    flex:2,
                    child: Center(
                      child: Container(
                        width: 320,
                        height: 50,
                        child: TextField(
                          controller: search,
                          decoration: InputDecoration(
                            hintText: 'Search',
                            prefixIcon: Icon(Icons.search),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex:1,
                    child: SizedBox(
                      height: 20,
                    ),
                  ),

                Expanded(
                  flex:6,
                  child: ListView.separated(
                  itemBuilder: (context, index) {
                  return Container(
                    height:300,
                    child: ListView.separated(
                    itemBuilder: (context, productIndex) {
                    return ListTile(
                      leading: Container(
                        width: 80,
                        height: 100,
                        color: Colors.black,
                      ),
                      title: Text("${userMap[ids[index]][productIndex]["name"]}"),
                      subtitle: Text("${userMap[ids[index]][productIndex]["description"]}"),
                        );
                    },
                      separatorBuilder: (context,ind){
                      return Divider(height:20);
                      },
                    itemCount: userMap[ids[index]].length,),
                  );
                  },
                    separatorBuilder: (context, index) {
                    return Divider(height: 50, thickness: 2);
                  },
                  itemCount: ids.length,
                  ),
                ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
