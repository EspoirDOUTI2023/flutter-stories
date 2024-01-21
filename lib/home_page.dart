import 'package:flutter/material.dart';
import 'package:stories/story_page.dart';
import 'package:stories/utils/story_circles.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  void _openStory(){
    Navigator.push(context,
      MaterialPageRoute(builder: (context)=> StoryPage())
    );
  }
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text('STORIES'),
      ),
      body: Column(children: [
        SizedBox(
          height: 100,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 6,
              itemBuilder: (context, index){
                return StoryCircle(
                  function: _openStory,
                );
          }),
        )
      ],),
    );
  }
}



