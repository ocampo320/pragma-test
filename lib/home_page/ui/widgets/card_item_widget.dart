import 'package:flutter/material.dart';
import 'package:prueba_pragma/core/domain/services/pet_info_services.dart';
import 'package:prueba_pragma/core/domain/utils/app_typography.dart';
import 'package:prueba_pragma/detail_page/ui/detail_page.dart';

import '/core/domain/models/beeds.dart';

class CardItemWidget extends StatelessWidget {
  const CardItemWidget(
      {super.key,
       required this.breeds});

  final Breeds breeds;
  

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, bottom: 25),
      child: Card(
        elevation: 2.0,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15,right: 15,top: 15,bottom: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(breeds.name??' ',style: AppTypography.stGradual(
                height: 1.5,
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              )),
                   InkWell(
onTap: ()=> Navigator.push(
    context,
    MaterialPageRoute(builder: (context) =>  DetailPage(description:breeds.description??'' ,title: breeds.name??'',codeImage: breeds.referenceImageId??'',)),
  ),
                     child: Text("Mas..",style: AppTypography.stGradual(
                                   height: 1.5,
                                   color: Colors.black,
                                   fontSize: 14,
                                   fontWeight: FontWeight.bold,
                                 ),),
                   ),
                ],
              ),
            ),
            FutureBuilder<String>(
                future: PestInfoServices.getImage(breeds.referenceImageId??''),
                builder: (context, snapshot) {
                  return snapshot.data != null
                      ? Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                
                            image: NetworkImage(snapshot.data ?? ''),
                            fit: BoxFit.cover,
                          )),
                          child: Image.network(snapshot.data ?? 'https://www.vetstreet.com/wp-content/uploads/2022/09/Old_dog_noah_1_of_1-1-scaled.jpg'),
                        )
                      : const CircularProgressIndicator();
                }),
            Padding(
              padding: const EdgeInsets.only(bottom: 15,left: 15,right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(breeds.countryCode??'',style: AppTypography.stGradual(
                height: 1.5,
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              )),
                  Text(breeds.intelligence.toString(),style: AppTypography.stGradual(
                height: 1.5,
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
