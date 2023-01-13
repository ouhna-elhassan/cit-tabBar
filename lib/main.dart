import 'package:flutter/material.dart';
//mora makandiro l'importation dyal lpackage material kandiro la fonction main
//kandiro fiha dima wahd la methode : runApp() ldakhl dyalha
//kandiro smiya dyal la class lijaya mnb3d
void main(List<String> args) {
  runApp(const MyApp());
}

//mnb3d kandiro wahd statlessWidget smitha MyApp() dima ldakhl dyalha kandiro wahd lwidget
//smitha MaterialApp(), fiha wahd la propriété : home
//fhad l'exemple dyalna bghina ndiro wahd "tabController: dayr bhal wathssApp"
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      //kaykhssna f lwl ndiro had lwidget DefaultTabController() 9dam dik "home" 
      //on3tiwha chhal mn tab ghadi tkon 3ndna fhad le cas 3ndna 3 tabs
      home: DefaultTabController(
        length: 3, 
        //dakchi lighayji mnb3d fih lktba bzaf dakchi 3lach hsn ndiro widget jdida 
        //onsmiwha HomePage() onktbo fiha lcode dyalna
        child: HomePage(), 
      ),
    );
  }
}


//had lwidget hsn ndiroha stateful hit ghadi tkon dynamique
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {

    //Scaffold hiya lwidget likatfr9 l'écrant 3la joj d les parties appBar + body
    //partie appBar: hiya likatkon lfo9
    //ohiya lighandiro fiha dok les tabs: Home, status, calls
    return Scaffold(
      //9dam appBar kanhto dima lwidget AppBar okandiro les propriétés dyalha : title, backgroundColor...
      appBar: AppBar(
        title: const Text("ChatApp"),
        backgroundColor: Color.fromARGB(255, 28, 81, 187),

        //ghansta3mlo la propriété  "bottom" onhto 9damha lwidget TabBar 
        // katkhllik t3ti liha les tabs comme une list fiha 
        // des widget Tab() likaykhliwk t3ti l kolla whda : icon + wahd text
        bottom: const TabBar(
          tabs: [
            Tab(icon: Icon(Icons.home), text: "home",),
            Tab(icon: Icon(Icons.photo_album), text: "status",),
            Tab(icon: Icon(Icons.call), text: "calls",),
          ],
        ),

        //actions hiya wahd la propriété dyal AppBar(), katkhllik dir wahd la list dyal 
        // les widgets f jnb lakhr dyal l'écrant
        // mgablin m3a title "ChatApp"
        actions:const [
          Icon(Icons.menu), 
          SizedBox(width: 11,),
          Icon(Icons.search), 
          SizedBox(width: 11,),
        ],
      ),

      // la partie tanya dyal Scaffold hiya body
      //fhad le cas khssna n3tiwha la widget TabBarView(), ghatkhlina n3tiwha une list fiha
      //dok les pages libghina ibano ila wrkna 3la chaque icon
      // chatPage ila wrkna 3la home, ...
      body: const TabBarView(
        children: [
          //fhad l'exemple ghandiro ghi la page lwla
          // fiha lktba bzaf ghandiroha bohdha comme widget
          Page1(), 
          Icon(Icons.photo_album),
          Icon(Icons.call),
        ],
      ),
    );
  }
}

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {

  //une list des liens des images utilisée
  List images = [
    "https://s40424.pcdn.co/in/wp-content/uploads/2022/03/What-is-Cyber-Security.jpg",
    "https://www.fbk.eu/wp-content/uploads/2020/12/Cover-Cyber-Security-1.jpg",
    "https://d540vms5r2s2d.cloudfront.net/mad/uploads/mad_blog_5bc9e9e9d3ddb1539959273.png",
    "https://www.keplearning.com/wp-content/uploads/2021/03/web-dev.jpg",
    "https://www.datasciencecentral.com/wp-content/uploads/2021/10/8667507462.jpeg",
    "https://blog.logrocket.com/wp-content/uploads/2022/02/Best-IDEs-Flutter-2022.png",
    "https://images.ctfassets.net/aq13lwl6616q/7cS8gBoWulxkWNWEm0FspJ/c7eb42dd82e27279307f8b9fc9b136fa/nodejs_cover_photo_smaller_size.png"
  ];

  @override
  Widget build(BuildContext context) {

    //ghandiro wahd l padding bach nkhliw chwiya d l'espace f jnab
    return Padding(
      padding:const EdgeInsets.all(9),

      //ListView.builder dayra bhal wahd la fonction katkhlik tdir wahd le nombre dyal les widget mtchabhin 
      //bla mtb9a tktb kola whda bohdha, okatstfhom verticalement ola horizontalement
      //fhad le cas ghanst3ml la widget ListTile
      child: ListView.builder(

        //hna kan3ti chhal mn widget bghit
        itemCount: 7, 

        //hna kandir return l widget okan3tiha les paramétres dyalha libhgit
        itemBuilder: (context, index) => ListTile(
          title: Text(
            "Mobile dev $index", 
            style:const TextStyle(
              fontWeight: FontWeight.bold
            ),
          ),
          subtitle:const Text("Bonjours, merci de bien d'en..."),
          trailing: Text("1$index:${index%6}5"),
          //CircleAvatar() katkhllik tchd wahd l'image otrj3ha circulaire
          leading:CircleAvatar(
            radius: 30, 
            //NetworkImage(): katkhllik timporter wahd l'image mn l'internet oththa f l'app dyalk
            //il suffit t3tiha lien d l'image
            backgroundImage: NetworkImage(images[index]),
          ),
          contentPadding:const EdgeInsets.all(5),
        )
      ),
    );
  }
}