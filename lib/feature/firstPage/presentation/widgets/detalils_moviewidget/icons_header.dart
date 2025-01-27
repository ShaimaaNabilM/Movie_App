import 'package:flutter/material.dart';

class IconsHeader extends StatelessWidget {
  const IconsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        
        CustomContainer(icon:Icon(Icons.arrow_back,color: Colors.white,) ,),
        CustomContainer(icon:Icon(Icons.menu,color: Colors.white,) ,),
        
      ],
    );
  }
}
class CustomContainer extends StatelessWidget {
  final Icon icon;
  const CustomContainer({
    super.key,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: const EdgeInsets.symmetric(horizontal: 10) ,
      height: 44,
          width: 44,
          
          decoration: BoxDecoration(
            color: Colors.transparent ,
            borderRadius: BorderRadius.circular(100),
             border: Border.all(width: 3, color: Colors.white),
          ),
          child: icon,
    );
  }
}
