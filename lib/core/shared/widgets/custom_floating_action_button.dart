import 'package:flutter/material.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({
    super.key,
    required this.alignment,
    this.backgroundColor = const Color(0xffE95322),
    required this.onPressed,
    this.width,
    required this.BtnTitile,
    this.iCons,
  });

  final IconData? iCons;
  final AlignmentGeometry alignment;
  final Color? backgroundColor;
  final double? width;
  final void Function()? onPressed;
  final String? BtnTitile;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: Container(
        width: width,
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.symmetric(
                vertical: 8, horizontal: 20),
            elevation: 3,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (iCons != null) Icon(iCons, color: Colors.black),
              if (iCons != null && BtnTitile!.isNotEmpty) const SizedBox(width: 8),
              Text(
                      BtnTitile!,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                 
            ],
          ),
        ),
      ),
    );
  }
}
