import 'package:flutter/material.dart';
import 'package:insta_home/Messages.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  AppBar CustomAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black,
      elevation: 0,
      title: Image.asset(
        'assets/images/1.png',
        height: 50,
      ),
      actions: [
        IconButton(
            onPressed: () {}, icon: const Icon(Icons.favorite_outline_rounded)),
        IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MessagePage()),
            );
          },
          icon: const Icon(Icons.message_rounded),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        primaryIconTheme: const IconThemeData(color: Colors.white),
      ),
      child: Scaffold(
          backgroundColor: Colors.black,
          appBar: CustomAppBar(context),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  child: Row(
                    children: [
                      ProfileWidget(
                          imagePath: 'assets/images/images (6).jpeg',
                          username: 'PANDA'),
                      ProfileWidget(
                          imagePath: 'assets/images/images (7).jpeg',
                          username: 'CAT'),
                      ProfileWidget(
                          imagePath: 'assets/images/3.jpeg', username: 'KING'),
                      ProfileWidget(
                          imagePath: 'assets/images/5.jpg', username: 'PEACE'),
                      ProfileWidget(
                          imagePath: 'assets/images/21.jpeg',
                          username: 'MARSHMELLO'),
                      ProfileWidget(
                          imagePath: 'assets/images/22.jpeg',
                          username: 'FUNNY'),
                      ProfileWidget(
                          imagePath: 'assets/images/23.jpeg', username: 'COOL'),
                      ProfileWidget(
                          imagePath: 'assets/images/24.jpeg',
                          username: 'ANGER'),
                    ],
                  ),
                ),
                const Divider(
                  color: Colors.black,
                  thickness: 2,
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 5,
                  itemBuilder: (_, index) => const PostWidget(),
                ),
              ],
            ),
          )),
    );
  }

  Column ProfileWidget({required String imagePath, required String username}) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(3),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(150),
            gradient: const LinearGradient(colors: [
              Color(0xff7b553),
              Color(0xffef732b),
              Color(0xff5f47b9),
              Color(0xff9437b9),
            ]),
          ),
          child: Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: Colors.black,
            ),
            child: ClipOval(
              child: Image.asset(
                imagePath,
                height: 80,
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          username,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

class PostWidget extends StatelessWidget {
  const PostWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      color: Colors.black,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          children: [
            InstaGradient(
              imagePath: 'assets/images/21.jpeg',
            ),
            const Padding(padding: EdgeInsets.symmetric(horizontal: 8.0)),
            const Text('MARSHMELLO',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                )),
            const Spacer(),
            PopupMenuButton<String>(
              icon: const Icon(Icons.more_vert, color: Colors.white),
              color: Colors.black,
              onSelected: (value) {
                if (value == 'delete') {
                  DeleteDialog(context);
                }
              },
              itemBuilder: (BuildContext context) {
                return [
                  const PopupMenuItem(
                    value: 'delete',
                    child: Text(
                      'Delete',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ];
              },
            ),
          ],
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            'assets/images/27.jpeg',
            height: 400,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
        ),
        Row(
          children: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.favorite_outline_rounded,
                  color: Colors.white,
                )),
            const Text(
              '3.2M',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.comment_rounded, color: Colors.white)),
            const Text(
              '486K',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.send_outlined, color: Colors.white)),
            const Text(
              '1.3M',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            const Spacer(),
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.save_sharp, color: Colors.white)),
            const Text(
              '566K',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
        const Text(
          'CAPTION: LIVE IN CONCERT 🔥  #CONCERT #MARSHMELLO #FUN #ENTERTAINMENT',
          style: TextStyle(
            color: Colors.white,
            fontSize: 17,
          ),
        ),
      ]),
    );
  }

  void DeleteDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.black,
          title: const Text(
            "Delete Post",
            style: TextStyle(color: Colors.white),
          ),
          content: const Text(
            "Are you sure you want to delete this post?",
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                "Cancel",
                style: TextStyle(color: Colors.white),
              ),
            ),
            TextButton(
              onPressed: () {
                
                Navigator.of(context).pop(); 
              },
              child: const Text("Delete", style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
  }
}

class InstaGradient extends StatelessWidget {
  const InstaGradient({Key? key, required this.imagePath, this.size = 30})
      : super(key: key);

  final String imagePath;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(150),
        gradient: const LinearGradient(colors: [
          Color(0xff7b553),
          Color(0xffef732b),
          Color(0xff5f47b9),
          Color(0xff9437b9),
        ]),
      ),
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(110),
          color: Colors.black,
        ),
        child: ClipOval(
          child: Image.asset(
            imagePath,
            height: size,
          ),
        ),
      ),
    );
  }
}
