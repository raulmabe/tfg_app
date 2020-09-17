import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jumpets_app/blocs/theme_bloc/theme_bloc.dart';
import 'package:jumpets_app/ui/app_theme.dart';

import 'package:shimmer/shimmer.dart';

class ContentPlaceholder extends StatelessWidget {
  /// Single block for group of shapes. `block` should be used only inside a `ContentPlaceholder`.
  static Widget block({
    double width,
    double height,
    BuildContext context,
    double topSpacing = 0,
    double leftSpacing = 0,
    double rightSpacing = 0,
    double bottomSpacing = _Styles.defaultSpacingSingle,
    double borderRadius = _Styles.defaultBorderRadius,
  }) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return Container(
          width: width,
          height: height ?? _Styles.defaultHeight,
          margin: EdgeInsets.fromLTRB(
            leftSpacing,
            topSpacing,
            rightSpacing,
            bottomSpacing,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius),
            color: state is LightTheme
                ? _Styles.defaultBlockColor
                : _Styles.defaultBlockColorDark,
          ),
        );
      },
    );
  }

  /// If child is `null` you will get one block. If child contains some widget, the widget will be covered with placeholder.
  final Widget child;

  /// Default width will be 100%.
  final double width;
  final double height;
  final double borderRadius;
  final BuildContext context;
  final EdgeInsets spacing;

  /// Is shimmer animation needed. Default is `true`.
  final bool isAnimationEnabled;

  ContentPlaceholder({
    this.width,
    this.height,
    this.context,
    this.spacing = _Styles.defaultSpacing,
    this.isAnimationEnabled = true,
    this.borderRadius = _Styles.defaultBorderRadius,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    if (this.child != null) {
      return BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return Padding(
            padding: this.spacing,
            child: Shimmer.fromColors(
              baseColor: state is LightTheme
                  ? _Styles.defaultPlaceholderColor
                  : _Styles.defaultPlaceholderColorDark,
              highlightColor: state is LightTheme
                  ? _Styles.defaultPlaceholderHighlight
                  : _Styles.defaultPlaceholderHighlightDark,
              child: child,
              enabled: isAnimationEnabled,
            ),
          );
        },
      );
    } else {
      return ContentPlaceholder(
        isAnimationEnabled: this.isAnimationEnabled,
        child: ContentPlaceholder.block(
          width: this.width,
          height: this.height,
          context: this.context,
          topSpacing: this.spacing.top ?? 0,
          leftSpacing: this.spacing.left ?? 0,
          rightSpacing: this.spacing.right ?? 0,
          bottomSpacing: this.spacing.bottom ?? _Styles.defaultSpacingSingle,
          borderRadius: this.borderRadius,
        ),
      );
    }
  }
}

class _Styles {
  static const double defaultSpacingSingle = 10;
  static const EdgeInsets defaultSpacing =
      const EdgeInsets.fromLTRB(0, 0, 0, _Styles.defaultSpacingSingle);
  static const double defaultBorderRadius = 8;
  static const double defaultHeight = 100;
  static const Color defaultBlockColor = AppTheme.kPrimaryColor;
  static const Color defaultPlaceholderColor = const Color(0xFFf1f3f4);
  static const Color defaultPlaceholderHighlight = const Color(0xFFe4e7e8);

  static const Color defaultBlockColorDark = AppTheme.kPrimaryColorDark;
  static const Color defaultPlaceholderColorDark = const Color(0xFF2c3e50);
  static const Color defaultPlaceholderHighlightDark = const Color(0xff34495e);
}
