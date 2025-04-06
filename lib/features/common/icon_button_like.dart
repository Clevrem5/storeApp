import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
//
// class AnimatedLikeButton extends StatefulWidget {
//   const AnimatedLikeButton({super.key});
//
//   @override
//   State<AnimatedLikeButton> createState() => _AnimatedLikeButtonState();
// }
//
// class _AnimatedLikeButtonState extends State<AnimatedLikeButton>
//     with SingleTickerProviderStateMixin {
//   bool isLiked = false;
//   late AnimationController _controller;
//   late Animation<double> _scaleAnimation;
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       vsync: this,
//       duration: Duration(milliseconds: 300),
//     );
//
//     _scaleAnimation = Tween<double>(begin: 1.0, end: 1.4)
//         .chain(CurveTween(curve: Curves.easeOutBack))
//         .animate(_controller);
//   }
//
//   void _toggleLike() {
//     setState(() {
//       isLiked = !isLiked;
//     });
//
//     _controller.forward().then((_) => _controller.reverse());
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: _toggleLike,
//       child: AnimatedBuilder(
//         animation: _controller,
//         builder: (context, child) {
//           return Transform.scale(
//             scale: _scaleAnimation.value,
//             child: SvgPicture.asset(
//               isLiked
//                   ? "assets/icons/heart_filled.svg"
//                   : "assets/icons/heart.svg",
//               width: 18,
//               height: 18,
//               fit: BoxFit.cover,
//               color: isLiked ? Colors.red : Colors.black,
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

class LikeButton extends StatefulWidget {
  final bool isInitiallyLiked;
  final void Function(bool isLiked)? onTap;

  const LikeButton({
    super.key,
    this.isInitiallyLiked = false,
    this.onTap,
  });

  @override
  State<LikeButton> createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton> {
  late bool isLiked;

  @override
  void initState() {
    super.initState();
    isLiked = widget.isInitiallyLiked;
  }

  void toggleLike() {
    setState(() {
      isLiked = !isLiked;
    });

    if (widget.onTap != null) {
      widget.onTap!(isLiked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: toggleLike,
      child: AnimatedSwitcher(
        duration: Duration(milliseconds: 300),
        transitionBuilder: (child, animation) => ScaleTransition(scale: animation, child: child),
        child: isLiked
            ? SvgPicture.asset(
          "assets/icons/heart_filled.svg",
          key: ValueKey('liked'),
          width: 18,
          height: 18,
        )
            : SvgPicture.asset(
          "assets/icons/heart.svg",
          key: ValueKey('unliked'),
          width: 18,
          height: 18,
        ),
      ),
    );
  }
}

