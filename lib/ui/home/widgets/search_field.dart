import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    this.onTap,
    this.onChanged,
    this.showCursor = true,
    this.readOnly = false,
    this.isTester = false,
    this.controller,
    super.key,
  });
  final void Function()? onTap;
  final bool showCursor;
  final bool readOnly;
  final void Function(String)? onChanged;
  final TextEditingController? controller;
  final bool isTester;

  @override
  Widget build(BuildContext context) {
    return TextField(
      showCursor: showCursor,
      onTap: onTap,
      onChanged: onChanged,
      controller: controller,
      readOnly: readOnly,
      maxLines: isTester ? 5 : 1, // Multi-line for tester mode
      keyboardType: TextInputType.multiline,
      autofillHints: const [AutofillHints.name],
      cursorColor: Colors.blue.shade400,
      style: GoogleFonts.notoSans(
        color: Colors.black,
        fontSize: 16,
      ),
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(8),
        ),
        contentPadding: EdgeInsets.symmetric(
          horizontal: 16,
          vertical: isTester ? 10 : 0,
        ),
        hintText: 'Search by name or code',
        hintStyle: TextStyle(
          fontFamily: GoogleFonts.notoSans().fontFamily,
          color: isTester
              ? Colors.grey
              : Colors.black, // Different hint color for tester mode
          fontSize: 16,
        ),
        prefixIcon: !isTester
            ? Icon(
                size: 20,
                color: Colors.blue.shade300,
                Icons.search,
              ) // Search icon only in search mode
            : null,
      ),
    );
  }
}
