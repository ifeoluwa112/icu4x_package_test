import 'package:flutter/material.dart';
import 'package:icu4x_test/helpers/helpers.dart';

class UnicodeTile extends StatelessWidget {
  const UnicodeTile({
    super.key,
    required this.character,
    required this.codePoint,
    required this.script,
    this.onTap,
  });

  final String character;

  final String codePoint;

  final VoidCallback? onTap;

  final String script;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.grey.shade300,
            ),
          ),
        ),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                character,
                style:
                    UnicodeHelper.getFontStylesForScript(script).first.copyWith(
                          fontSize: 24,
                        ),
              ),
            ),
            Text(
              codePoint,
              style: const TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
