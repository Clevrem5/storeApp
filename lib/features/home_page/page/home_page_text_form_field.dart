import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:store_app/core/utils/app_colors.dart';

// class HomePageTextFormField extends StatelessWidget {
//   const HomePageTextFormField({
//     super.key,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: SizedBox(
//         width: double.infinity,
//         height: 52.h,
//         child: TextFormField(
//           style: TextStyle(
//             color: AppColors.black,
//             fontSize: 18,
//           ),
//           decoration: InputDecoration(
//             hintText: "Search for clothes...",
//             hintStyle: TextStyle(color: AppColors.hintText, fontSize: 16),
//             filled: true,
//             fillColor: AppColors.white,
//             suffixIcon: Padding(
//               padding: EdgeInsets.all(12),
//               child: SvgPicture.asset(
//                 "assets/icons/microphone.svg",
//                 color: AppColors.hintText,
//               ),
//             ),
//             prefixIcon: Padding(
//               padding: EdgeInsets.all(12),
//               child: SvgPicture.asset(
//                 "assets/icons/search.svg",
//                 color: AppColors.hintText,
//               ),
//             ),
//             enabledBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(10),
//               borderSide: BorderSide(
//                 color: AppColors.buttonBorder,
//                 width: 2,
//               ),
//             ),
//             focusedBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(12),
//               borderSide: BorderSide(
//                 color: AppColors.buttonBorder,
//                 width: 2,
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:flutter_svg/flutter_svg.dart';
import 'package:permission_handler/permission_handler.dart';

class HomePageTextFormField extends StatefulWidget {
  const HomePageTextFormField({super.key});

  @override
  _VoiceSearchFieldBodyState createState() => _VoiceSearchFieldBodyState();
}

class _VoiceSearchFieldBodyState extends State<HomePageTextFormField> {
  late stt.SpeechToText _speech;
  bool _isListening = false;
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _speech = stt.SpeechToText();
  }

  // Mikrofon ruxsatlarini so'rash
  Future<void> requestMicrophonePermission() async {
    final status = await Permission.microphone.request();

    if (status.isGranted) {
      print('Microphone permission granted');
    } else if (status.isDenied) {
      print('Microphone permission denied');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Microphone permission is denied')),
      );
    } else if (status.isPermanentlyDenied) {
      print('Microphone permission is permanently denied');
      openAppSettings();
    }
  }

  // Tinglashni boshlash
  void _startListening() async {
    bool available = await _speech.initialize();
    if (available) {
      setState(() => _isListening = true);
      _speech.listen(
        onResult: (val) {
          setState(() {
            _controller.text = val.recognizedWords;
            _controller.selection = TextSelection.fromPosition(
              TextPosition(offset: _controller.text.length),
            );
          });
        },
        listenFor: Duration(seconds: 30),
        pauseFor: Duration(seconds: 5),
        partialResults: true,
      );
    } else {
      print("Speech recognition not available or initialization failed.");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Speech recognition is not available")),
      );
    }
  }

  // Tinglashni to'xtatish
  void _stopListening() {
    setState(() => _isListening = false);
    _speech.stop();
  }

  // Tinglashni almashtirish
  void _toggleListening() {
    if (_isListening) {
      _stopListening();
    } else {
      _startListening();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 280,
      height: 52,
      child: TextFormField(
        controller: _controller,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 18,
        ),
        decoration: InputDecoration(
          hintText: "Search for clothes...",
          hintStyle: const TextStyle(color: Colors.grey, fontSize: 16),
          filled: true,
          fillColor: Colors.white,
          suffixIcon: GestureDetector(
            onTap: () async {
              await requestMicrophonePermission();
              _toggleListening();
            },
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: SvgPicture.asset(
                "assets/icons/microphone.svg",
                color: _isListening ? Colors.red : Colors.grey,
              ),
            ),
          ),
          prefixIcon: Padding(
            padding: const EdgeInsets.all(12),
            child: SvgPicture.asset(
              "assets/icons/search.svg",
              color: Colors.grey,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Colors.black12,
              width: 2,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              color: Colors.black26,
              width: 2,
            ),
          ),
        ),
      ),
    );
  }
}



// class _VoiceSearchFieldBodyState extends State<_VoiceSearchFieldBody> {
//   late stt.SpeechToText _speech;
//   bool _isListening = false;
//   final TextEditingController _controller = TextEditingController();
//
//   @override
//   void initState() {
//     super.initState();
//     _speech = stt.SpeechToText();
//   }
//
//   void _startListening() async {
//     bool available = await _speech.initialize();
//     if (available) {
//       setState(() => _isListening = true);
//       _speech.listen(onResult: (val) {
//         setState(() {
//           _controller.text = val.recognizedWords;
//           _controller.selection = TextSelection.fromPosition(
//             TextPosition(offset: _controller.text.length),
//           );
//         });
//       });
//     }
//   }
//
//   void _stopListening() {
//     setState(() => _isListening = false);
//     _speech.stop();
//   }
//
//   void _toggleListening() {
//     if (_isListening) {
//       _stopListening();
//     } else {
//       _startListening();
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: 280,
//       height: 52,
//       child: TextFormField(
//         controller: _controller,
//         style: const TextStyle(
//           color: Colors.black,
//           fontSize: 18,
//         ),
//         decoration: InputDecoration(
//           hintText: "Search for clothes...",
//           hintStyle: const TextStyle(color: Colors.grey, fontSize: 16),
//           filled: true,
//           fillColor: Colors.white,
//           suffixIcon: GestureDetector(
//             onTap: _toggleListening,
//             child: Padding(
//               padding: const EdgeInsets.all(12),
//               child: SvgPicture.asset(
//                 "assets/icons/microphone.svg",
//                 color: _isListening ? Colors.red : Colors.grey,
//               ),
//             ),
//           ),
//           prefixIcon: Padding(
//             padding: const EdgeInsets.all(12),
//             child: SvgPicture.asset(
//               "assets/icons/search.svg",
//               color: Colors.grey,
//             ),
//           ),
//           enabledBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(10),
//             borderSide: const BorderSide(
//               color: Colors.black12,
//               width: 2,
//             ),
//           ),
//           focusedBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(12),
//             borderSide: const BorderSide(
//               color: Colors.black26,
//               width: 2,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
