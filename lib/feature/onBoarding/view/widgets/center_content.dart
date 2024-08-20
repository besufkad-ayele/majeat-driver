import 'package:flutter/material.dart';
import 'package:majeat_driver/core/constants/app_constant.dart';
import 'package:majeat_driver/core/constants/theme_constants.dart';



// ignore: must_be_immutable
class center_content extends StatelessWidget {
   center_content(
      {super.key,
      required this.description,
      required this.image_url,
      required this.title, required this.iconData,
      this.child});
  final String image_url;
  final String title;
  final String description;
  final IconData iconData;
  Widget? child;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
              flex: 2,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 5,vertical: 5),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      topLeft: Radius.circular(4),
                      topRight: Radius.circular(4),
                      bottomRight: Radius.circular(40)),
                  color: const Color.fromARGB(144, 86, 86, 86),
                  image: DecorationImage(
                    image: NetworkImage(image_url),
                    fit: BoxFit.cover,
                  ),
                ),
              )),
             
          Expanded(
              flex: 2,
              child: Container(
                margin: const EdgeInsets.symmetric(
                    vertical: 50, horizontal: 30),
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(iconData,size: 100,color:ThemeConstants.accentColor),
                    Text(title,style: AppConstant.center_content_header,),
                    Text(description ,style: AppConstant.center_content_description,textAlign: TextAlign.center,),
                    child ?? Container(
                      color: Colors.red,
                      child: const Text('',style: AppConstant.bodyStyle,),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
