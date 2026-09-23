import 'package:flutter/material.dart';
import 'package:medicate_app/ui/widget/text.dart';

class AutoScrollingText extends StatefulWidget {
  final String text;
  final TextStyle textStyle;

  const AutoScrollingText({
    super.key,
    required this.text,
    required this.textStyle,
  });

  @override
  State<AutoScrollingText> createState() => _AutoScrollingTextState();
}

class _AutoScrollingTextState extends State<AutoScrollingText> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _startAutoScroll();
    });
  }

  Future<void> _startAutoScroll() async {
    // Don't auto-scroll if text is more than 200 characters
    if (widget.text.length > 200) return;

    if (!_scrollController.hasClients) return;

    final maxScroll = _scrollController.position.maxScrollExtent;

    // Text doesn't overflow, so no need to scroll
    if (maxScroll <= 0) return;

    while (mounted && _scrollController.hasClients) {
      // Small delay before starting
      await Future.delayed(const Duration(seconds: 1));

      if (!mounted || !_scrollController.hasClients) return;

      // Scroll from beginning to the end
      await _scrollController.animateTo(
        maxScroll,
        duration: const Duration(seconds: 5),
        curve: Curves.linear,
      );

      if (!mounted || !_scrollController.hasClients) return;

      // Pause briefly at the end
      await Future.delayed(const Duration(seconds: 1));

      if (!mounted || !_scrollController.hasClients) return;

      // Instantly return to the beginning
      _scrollController.jumpTo(0);
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final shouldScroll = widget.text.length <= 200;

    if (!shouldScroll) {
      return TextView(text: widget.text, textStyle: widget.textStyle);
    }

    return SingleChildScrollView(
      controller: _scrollController,
      scrollDirection: Axis.horizontal,
      physics: const NeverScrollableScrollPhysics(),
      child: TextView(text: widget.text, textStyle: widget.textStyle),
    );
  }
}
