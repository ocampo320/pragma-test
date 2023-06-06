import 'package:flutter/material.dart';
import 'package:prueba_pragma/core/domain/services/pet_info_services.dart';
import 'package:prueba_pragma/core/domain/utils/app_typography.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key,  required this.description, required this.title, required this.codeImage});
  final String description;
  final String title;
  final String codeImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text(title), centerTitle: true,),
      body: Stack  (
        children: [
      
       FutureBuilder<String>(
                future: PestInfoServices.getImage(codeImage),
                builder: (context, snapshot) {
                  return snapshot.data != null
                      ? Padding(
                        padding: const EdgeInsets.only(left: 15,right: 15,top: 30,bottom: 20),
                        child: Container(
                          width: 500,
                          height: 250,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                  
                              image: NetworkImage(snapshot.data ?? ''),
                              fit: BoxFit.cover,
                            )),
                            child: Image.network(snapshot.data ?? 'https://www.vetstreet.com/wp-content/uploads/2022/09/Old_dog_noah_1_of_1-1-scaled.jpg'),
                          ),
                      )
                      : const Center(child: const CircularProgressIndicator());
                }),
          Padding(
            padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height/2.5,left: 15,right: 15),
            child: SingleChildScrollView(child: Text(description,style: AppTypography.stGradual(
                height: 1.5,
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ))),
          )
        ],
      ),
    );
  }
}
