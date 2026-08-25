// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import '/custom_code/widgets/index.dart';
import '/custom_code/actions/index.dart';
import '/flutter_flow/custom_functions.dart';

import 'dart:math' as math;
import 'package:google_fonts/google_fonts.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '/custom_code/actions/ensure_cover_cache.dart';

class ComicCover extends StatefulWidget {
  const ComicCover({
    super.key,
    this.width,
    this.height,
    this.imageUrl,
    this.titleName,
    this.issueNumber,
    this.titleId,
    this.spineHeight,
    this.cornersRight,
    this.cornersLeft,
    this.shadowX,
    this.shadowY,
    this.shadowBlur,
    this.shadowColor,
    this.alignBottom,
    this.enableLightbox,
    this.isAdult,
    this.canSeeAdult,
  });

  final double? width;
  final double? height;
  final String? imageUrl;
  final String? titleName;
  final String? issueNumber;
  final String? titleId;
  final double? spineHeight;
  final double? cornersRight;
  final double? cornersLeft;
  final double? shadowX;
  final double? shadowY;
  final double? shadowBlur;
  final Color? shadowColor;
  final bool? alignBottom;
  final bool? enableLightbox;
  final bool? isAdult;
  final bool? canSeeAdult;

  @override
  State<ComicCover> createState() => _ComicCoverState();
}

class _ComicCoverState extends State<ComicCover> {
  bool _imageLoaded = false;
  bool _imageError = false;

  static const _palette = [
    Color(0xFF00794c),
    Color(0xFF00719b),
    Color(0xFF0067a3),
    Color(0xFF445eaa),
    Color(0xFF7f4a93),
    Color(0xFF9b3f5a),
    Color(0xFF9e413e),
    Color(0xFF9b4b10),
  ];
  static const _glossUrl =
      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/tivan-9i5zb4/assets/aezyk89yk95c/cover_glow_2.png';

  double get _cr => widget.cornersRight ?? 4.0;
  double get _cl => widget.cornersLeft ?? 1.0;

  BorderRadius get _thumbRadius => BorderRadius.only(
        topLeft: Radius.circular(_cl),
        topRight: Radius.circular(_cr),
      );

  BorderRadius get _spineRadius => BorderRadius.only(
        bottomLeft: Radius.circular(_cl),
        bottomRight: Radius.circular(_cr),
      );

  bool get _isRestricted =>
      (widget.isAdult == true) && (widget.canSeeAdult != true);

  Color _colorFromTitleId(String titleId) {
    int hash = 0;
    for (int i = 0; i < titleId.length; i++) {
      hash = (hash * 31 + titleId.codeUnitAt(i)) & 0x7FFFFFFF;
    }
    return _palette[hash % _palette.length];
  }

  @override
  void initState() {
    super.initState();
    _preloadCheck();
  }

  @override
  void didUpdateWidget(ComicCover oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.imageUrl != widget.imageUrl) {
      setState(() {
        _imageLoaded = false;
        _imageError = false;
      });
      _preloadCheck();
    }
  }

  void _preloadCheck() {
    if (_isRestricted) return;
    final url = widget.imageUrl;
    if (url == null || url.trim().isEmpty) return;
    // Usa o cache de disco dedicado (mesmo manager do render e do prefetch).
    final provider =
        CachedNetworkImageProvider(url, cacheManager: coverCacheManager);
    final stream = provider.resolve(const ImageConfiguration());
    stream.addListener(
      ImageStreamListener(
        (ImageInfo info, bool sync) {
          if (mounted) setState(() => _imageLoaded = true);
        },
        onError: (Object e, StackTrace? s) {
          if (mounted) setState(() => _imageError = true);
        },
      ),
    );
  }

  void _openLightbox(BuildContext context) {
    Navigator.of(context).push(
      PageRouteBuilder(
        opaque: false,
        barrierDismissible: true,
        barrierColor: Colors.black87,
        pageBuilder: (context, animation, _) {
          return FadeTransition(
            opacity: animation,
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: Stack(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: Container(color: Colors.transparent),
                  ),
                  Center(
                    child: Hero(
                      tag: widget.imageUrl!,
                      child: InteractiveViewer(
                        minScale: 1.0,
                        maxScale: 4.0,
                        child: CachedNetworkImage(
                          imageUrl: widget.imageUrl!,
                          cacheManager: coverCacheManager,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: MediaQuery.of(context).padding.top + 12,
                    right: 16,
                    child: GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      child: Container(
                        width: 36,
                        height: 36,
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.55),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.close,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final spineColor = FlutterFlowTheme.of(context).spineColor;
    final spineGradientStart = FlutterFlowTheme.of(context).spineGradientStart;
    final defaultShadowColor = FlutterFlowTheme.of(context).shapeShadow;

    final w = widget.width ?? 120.0;
    final spine = widget.spineHeight ?? 6.0;

    // Se restrito, mostra placeholder de conteúdo adulto
    if (_isRestricted) {
      return _buildRestrictedWidget(
          w, spine, spineColor, spineGradientStart, defaultShadowColor);
    }

    final hasImage = widget.imageUrl != null &&
        widget.imageUrl!.trim().isNotEmpty &&
        !_imageError;
    final hasTitleId =
        widget.titleId != null && widget.titleId!.trim().isNotEmpty;

    Widget thumb;
    if (hasImage && _imageLoaded) {
      thumb = _buildImageThumb(w);
    } else if (hasImage && !_imageLoaded) {
      thumb = _buildLoadingThumb(w, hasTitleId);
    } else if (hasTitleId) {
      thumb = _buildPlaceholderThumb(w);
    } else {
      thumb = _buildEmptyThumb(w);
    }

    final showSpine = !hasImage || _imageLoaded;

    Widget content = Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: widget.shadowColor ?? defaultShadowColor,
            blurRadius: widget.shadowBlur ?? 4,
            offset: Offset(widget.shadowX ?? 2, widget.shadowY ?? 2),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (showSpine) ...[
            thumb,
            Transform.translate(
              offset: const Offset(0, -1),
              child: _buildSpine(w, spine, spineColor, spineGradientStart),
            ),
          ] else
            thumb,
        ],
      ),
    );

    final canLightbox =
        widget.enableLightbox == true && hasImage && _imageLoaded;
    if (canLightbox) {
      content = GestureDetector(
        onTap: () => _openLightbox(context),
        child: content,
      );
    }

    final shouldAlignBottom = widget.alignBottom == true;
    if (shouldAlignBottom && widget.height != null) {
      return SizedBox(
        width: w,
        height: widget.height,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: content,
            ),
          ],
        ),
      );
    }

    return Stack(
      clipBehavior: Clip.none,
      children: [content],
    );
  }

  // ── Restricted thumb (+18 borrado) ───────────────────────────────────
  Widget _buildRestrictedWidget(double w, double spine, Color spineColor,
      Color spineGradientStart, Color defaultShadowColor) {
    final h = w * 1.5;
    Widget thumb = ClipRRect(
      borderRadius: _thumbRadius,
      child: Container(
        width: w,
        height: h,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF1a1a2e), Color(0xFF16213e), Color(0xFF0f3460)],
          ),
        ),
        child: Stack(
          children: [
            // Fundo texturizado
            Positioned.fill(
              child: CustomPaint(painter: _NoisePainter()),
            ),
            // Ícone cadeado + badge
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.lock_rounded,
                    color: Colors.white.withOpacity(0.85),
                    size: w * 0.28,
                  ),
                  const SizedBox(height: 6),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(
                      color: const Color(0xFFc0392b),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      '+18',
                      style: GoogleFonts.merriweather(
                        fontSize: math.max(8.0, w * 0.10),
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned.fill(child: _buildThumbBorders()),
          ],
        ),
      ),
    );

    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: widget.shadowColor ?? defaultShadowColor,
            blurRadius: widget.shadowBlur ?? 4,
            offset: Offset(widget.shadowX ?? 2, widget.shadowY ?? 2),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          thumb,
          Transform.translate(
            offset: const Offset(0, -1),
            child: _buildSpine(w, spine, spineColor, spineGradientStart),
          ),
        ],
      ),
    );
  }

  Widget _buildLoadingThumb(double w, bool hasTitleId) {
    final h = w * 1.5;
    return ClipRRect(
      borderRadius: _thumbRadius,
      child: Container(
        width: w,
        height: h,
        color: hasTitleId
            ? _colorFromTitleId(widget.titleId!)
            : const Color(0xFF3D464D),
      ),
    );
  }

  Widget _buildEmptyThumb(double w) {
    final h = w * 1.5;
    return ClipRRect(
      borderRadius: _thumbRadius,
      child: Container(
        width: w,
        height: h,
        color: const Color(0xFFEFF3F5),
      ),
    );
  }

  Widget _buildImageThumb(double w) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: _thumbRadius,
          child: CachedNetworkImage(
            imageUrl: widget.imageUrl!,
            cacheManager: coverCacheManager,
            width: w,
            fit: BoxFit.fitWidth,
            // Sem fade: a capa já foi cacheada no _preloadCheck, então
            // aparece instantânea (preserva o comportamento do Image.network).
            fadeInDuration: Duration.zero,
            fadeOutDuration: Duration.zero,
            errorWidget: (context, url, error) {
              if (widget.titleId != null && widget.titleId!.trim().isNotEmpty) {
                return _buildPlaceholderBody(w);
              }
              return Container(
                  width: w, height: w * 1.5, color: const Color(0xFFCCCCCC));
            },
          ),
        ),
        Positioned.fill(child: _buildGlossOverlay(w)),
        Positioned.fill(child: _buildThumbBorders()),
      ],
    );
  }

  Widget _buildGlossOverlay(double w) {
    return IgnorePointer(
      child: ClipRRect(
        borderRadius: _thumbRadius,
        child: CachedNetworkImage(
          imageUrl: _glossUrl,
          cacheManager: coverCacheManager,
          width: w,
          fit: BoxFit.fitWidth,
          alignment: Alignment.topCenter,
        ),
      ),
    );
  }

  Widget _buildPlaceholderThumb(double w) {
    final h = w * 1.5;
    return SizedBox(
      width: w,
      height: h,
      child: Stack(
        children: [
          Positioned.fill(
            child: ClipRRect(
              borderRadius: _thumbRadius,
              child: Container(color: _colorFromTitleId(widget.titleId!)),
            ),
          ),
          Positioned.fill(child: _buildPlaceholderContent(w, h)),
          Positioned.fill(child: _buildGlossOverlay(w)),
          Positioned.fill(child: _buildThumbBorders()),
        ],
      ),
    );
  }

  Widget _buildPlaceholderBody(double w) {
    final h = w * 1.5;
    return ClipRRect(
      borderRadius: _thumbRadius,
      child: Container(
        width: w,
        height: h,
        color: _colorFromTitleId(widget.titleId!),
        child: _buildPlaceholderContent(w, h),
      ),
    );
  }

  Widget _buildPlaceholderContent(double w, double h) {
    final issueNumberSize = math.max(10.0, w * 0.14);
    final titleNameSize = math.max(9.0, w * 0.11);

    return Stack(
      clipBehavior: Clip.none,
      children: [
        if (widget.issueNumber != null)
          Positioned(
            top: 8,
            left: 8,
            child: Text(
              '#${widget.issueNumber}',
              style: GoogleFonts.merriweather(
                fontSize: issueNumberSize,
                fontWeight: FontWeight.w700,
                color: Colors.white.withOpacity(0.85),
                height: 1.1,
              ),
            ),
          ),
        if (widget.titleName != null && widget.titleName!.isNotEmpty)
          Positioned(
            left: 0,
            top: 0,
            bottom: 0,
            width: w * 0.99,
            child: ClipRect(
              child: RotatedBox(
                quarterTurns: 3,
                child: Text(
                  widget.titleName!,
                  style: GoogleFonts.merriweather(
                    fontSize: titleNameSize * 2.8,
                    fontWeight: FontWeight.w900,
                    color: Colors.white.withOpacity(0.08),
                    letterSpacing: -0.5,
                    height: 1.0,
                  ),
                  softWrap: true,
                  overflow: TextOverflow.clip,
                  maxLines: 3,
                ),
              ),
            ),
          ),
        if (widget.titleName != null && widget.titleName!.isNotEmpty)
          Positioned(
            bottom: 8,
            left: 8,
            right: 8,
            child: Text(
              widget.titleName!,
              style: GoogleFonts.merriweather(
                fontSize: math.max(7.0, w * 0.07),
                fontWeight: FontWeight.w700,
                color: Colors.white.withOpacity(0.7),
                height: 1.2,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
      ],
    );
  }

  Widget _buildThumbBorders() {
    return IgnorePointer(
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: 1,
            child: Container(color: const Color(0xFF909090).withOpacity(0.7)),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: 1,
            child: Container(color: Colors.white.withOpacity(0.3)),
          ),
          Positioned(
            top: 0,
            bottom: 0,
            left: 0,
            width: 1,
            child: Container(color: Colors.white.withOpacity(0.3)),
          ),
        ],
      ),
    );
  }

  Widget _buildSpine(
      double w, double spine, Color spineColor, Color spineGradientStart) {
    if (spine <= 0) return const SizedBox.shrink();
    return SizedBox(
      width: w,
      height: spine,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [spineGradientStart, Colors.white],
              ),
              border: Border.all(color: spineColor, width: 1),
              borderRadius: _spineRadius,
            ),
          ),
          Positioned(
            top: 0,
            left: 1,
            right: 1,
            height: 1,
            child: Container(color: spineGradientStart),
          ),
        ],
      ),
    );
  }
}

// ── Noise painter para textura do placeholder +18 ────────────────────
class _NoisePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.white.withOpacity(0.03);
    final rng = math.Random(42);
    for (int i = 0; i < 120; i++) {
      final x = rng.nextDouble() * size.width;
      final y = rng.nextDouble() * size.height;
      canvas.drawCircle(Offset(x, y), rng.nextDouble() * 1.5, paint);
    }
  }

  @override
  bool shouldRepaint(_NoisePainter old) => false;
}
