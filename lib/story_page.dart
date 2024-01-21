import 'dart:async';

import 'package:flutter/material.dart';
import 'package:stories/stories/my_story1.dart';
import 'package:stories/stories/my_story2.dart';
import 'package:stories/stories/my_story3.dart';
import 'package:stories/utils/progress_bar.dart';
import 'package:stories/utils/story_bars.dart';

class StoryPage extends StatefulWidget {
  const StoryPage({Key? key}) : super(key: key);

  @override
  State<StoryPage> createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  int currentStoryIndex = 0;
  final List<Widget> myStories = [
    MyStory1(),
    MyStory2(),
    MyStory3(),
    MyStory1(),
    MyStory2(),
    MyStory3(),
  ];

  List<double> percentWatched = [];

  @override
  void initState(){
    super.initState();

    // à l'etat initial, aucune storie n'a ete visionnee
    for(int i = 0; i < myStories.length; i++){
      percentWatched.add(0);
    }
    _startWatching();
  }

  void _startWatching(){
    Timer.periodic(Duration(milliseconds: 50), (timer){
      setState(() {
        //on ajoute 0.01 seulement si la valeur est inferieure a 1
        if(percentWatched[currentStoryIndex] + 0.01 < 1) {
          percentWatched[currentStoryIndex] += 0.01;
        }
        //si l'ajout de 0.01 depasse 1, on fixe la valeur a 1 et on arrete le timer
        else {
          percentWatched[currentStoryIndex] = 1;
          timer.cancel();

          //on passe a la story suivante s'il y a d'autres stories a visionner
          if(currentStoryIndex < myStories.length - 1){
            currentStoryIndex++;
            //on redemarre le process
            _startWatching();
          }
          //s'il n'y a plus de stories, on retourne a la page d'accueil
          else{
            Navigator.pop(context);
          }
        }

      });
    });
  }

  void _onTapDown(TapDownDetails details){
    final double screenWidth = MediaQuery.of(context).size.width;
    final double dx = details.globalPosition.dx;

    //si le user tape sur la gauche de l'ecran
    if(dx < screenWidth/2){
      setState(() {
        //au cas ou ce n'est pas la 1ere story
        if(currentStoryIndex > 0){
          //mettre le pourcentage de la story actuelle et la precedente a 0
          percentWatched[currentStoryIndex - 1] = 0;
          percentWatched[currentStoryIndex] = 0;

          //revenir a la story precedente
          currentStoryIndex--;
        }
      });
    }
    //si le user tape sur la droite de l'ecran
    else {
      setState(() {
        //s'il reste des stories a visionner
        if(currentStoryIndex < myStories.length - 1){
          //terminer la story actuelle
          percentWatched[currentStoryIndex] = 1;
          //passer a la story suivante
          currentStoryIndex++;
        }
        //si le user est sur la derniere story, on termine la story
        else{
          percentWatched[currentStoryIndex] = 1;
        }
      });

    }


  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) => _onTapDown(details),
      child: Scaffold(
        body: Stack(
          children: [
            myStories[currentStoryIndex],
            MyStoryBars(percentWatched: percentWatched)
          ],
        ),
      ),
    );
  }
}
