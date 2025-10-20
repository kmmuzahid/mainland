import 'package:flutter/material.dart';
import 'package:mainland/core/utils/constants/app_colors.dart';
import 'package:mainland/core/utils/extensions/extension.dart';
import 'package:mainland/core/utils/log/app_log.dart';

class SmartStaggeredLoader extends StatefulWidget {
  const SmartStaggeredLoader({
    required this.itemCount,
    required this.itemBuilder,
    this.onRefresh,
    this.onLoadMore,
    this.isLoading = false,
    this.isLoadingMore = false, // new flag for pagination loading
    this.isLoadDone = false,
    this.padding,
    this.maxCrossAxisExtent = 200,
    this.mainAxisSpacing = 8,
    this.crossAxisSpacing = 8,
    this.physics,
    super.key,
    this.topWidget,
    this.enableMassionary = false,
    this.aspectRatio = 1,
    this.appbar,
    this.onColapsAppbar
  });

  final int itemCount;
  final IndexedWidgetBuilder itemBuilder;
  final Function()? onRefresh;
  final Function()? onLoadMore;
  final bool isLoading; // initial load / refresh loading
  final bool isLoadingMore; // pagination load more loading
  final bool isLoadDone; // all data loaded flag
  final EdgeInsetsGeometry? padding;
  final double maxCrossAxisExtent;
  final double mainAxisSpacing;
  final double crossAxisSpacing;
  final ScrollPhysics? physics;
  final Widget? topWidget;
  final bool enableMassionary;
  final double aspectRatio;
  final Widget? appbar;
  final Widget? onColapsAppbar;

  @override
  State<SmartStaggeredLoader> createState() => _SmartStaggeredLoaderState();
}

class _SmartStaggeredLoaderState extends State<SmartStaggeredLoader>
    with SingleTickerProviderStateMixin {
  late final ScrollController _scrollController;
  late AnimationController _animationController;
  bool _isAppBarVisible = true;
  double _lastScrollOffset = 0;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    // Start with the app bar visible
    _animationController.forward();
  }

  void _onScroll() {
    // Handle load more
    if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent - 200 &&
        widget.onLoadMore != null &&
        !widget.isLoading &&
        !widget.isLoadingMore &&
        !widget.isLoadDone &&
        widget.itemCount > 0) {
      widget.onLoadMore!();
    }

    // Handle app bar visibility if appbar is provided
    if (widget.appbar != null) {
      final currentScroll = _scrollController.position.pixels;
      final isScrollingDown = currentScroll > _lastScrollOffset && currentScroll > 0;
      final isAtTop = currentScroll <= 0;

      if (isScrollingDown && _isAppBarVisible) {
        // Hide app bar when scrolling down
        _isAppBarVisible = false;
        setState(() {});
        _animationController.reverse();
      } else if ((!isScrollingDown && !_isAppBarVisible && !isAtTop) || isAtTop) {
        // Show app bar when scrolling up or when at top
        _isAppBarVisible = true;
        setState(() {});
        _animationController.forward();
      }

      _lastScrollOffset = currentScroll;
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  Widget _buildGrid({ScrollController? controller, ScrollPhysics? physics}) {
    return GridView.custom(
      controller: controller,
      key: ValueKey('staggered${widget.itemCount}'),
      physics: physics ?? const AlwaysScrollableScrollPhysics(),
      padding: widget.padding,
      shrinkWrap: physics is NeverScrollableScrollPhysics,
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        childAspectRatio: widget.aspectRatio,
        maxCrossAxisExtent: widget.maxCrossAxisExtent,
        mainAxisSpacing: widget.mainAxisSpacing,
        crossAxisSpacing: widget.crossAxisSpacing,
      ),
      childrenDelegate: SliverChildBuilderDelegate(childCount: widget.itemCount + 1, (
        context,
        index,
      ) {
        if (index < widget.itemCount) {
          return widget.itemBuilder(context, index);
        } else if (widget.isLoadingMore) {
          // Show load more indicator at the bottom of list
          return const Padding(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Center(child: CircularProgressIndicator()),
          );
        } else if (widget.isLoadDone) {
          return const Padding(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Center(child: Text('All data loaded')),
          );
        } else {
          return const SizedBox.shrink();
        }
      }),
    );
  }

  Widget _buildContent() {
    // Show placeholder if no data with loading or empty text
    if (widget.itemCount == 0) {
      final placeholder = ListView(
        physics: widget.physics ?? const AlwaysScrollableScrollPhysics(),
        padding: widget.padding ?? const EdgeInsets.all(16),
        children: [
          if (widget.isLoading) // only initial loading shows full screen indicator
            const Center(child: CircularProgressIndicator())
          else if (widget.isLoadDone)
            const Center(child: Text('No data found'))
          else
            const SizedBox(height: 300), // to enable pull-to-refresh overscroll
        ],
      );

      return widget.onRefresh != null
          ? RefreshIndicator(
              onRefresh: () async {
                await widget.onRefresh?.call();
              },
              child: placeholder,
            )
          : placeholder;
    }

    // Show staggered grid with optional pull-to-refresh
    final grid = widget.topWidget == null
        ? _buildGrid(physics: const AlwaysScrollableScrollPhysics(), controller: _scrollController)
        : SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                widget.topWidget!,
                _buildGrid(physics: const NeverScrollableScrollPhysics()),
              ],
            ),
          );

    return widget.onRefresh != null
        ? RefreshIndicator(
            onRefresh: () async {
              await widget.onRefresh?.call();
            },
            child: grid,
          )
        : grid;
  }

  @override
  Widget build(BuildContext context) {
    if (widget.appbar != null) {
      // Get the app bar height, default to kToolbarHeight if not a PreferredSizeWidget
      final appBarHeight = widget.appbar is PreferredSizeWidget
          ? (widget.appbar as PreferredSizeWidget).preferredSize.height
          : kToolbarHeight;

      return Column(
        children: [
          TweenAnimationBuilder<double>(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            tween: Tween<double>(
              begin: _isAppBarVisible ? 0 : appBarHeight,
              end: _isAppBarVisible ? appBarHeight : 0,
            ),
            builder: (context, height, child) {
              return SizedBox(
                height: height,
                child: OverflowBox(
                  maxHeight: appBarHeight,
                  alignment: Alignment.topCenter,
                  child: widget.appbar,
                ),
              );
            },
          ),
          if (widget.onColapsAppbar != null)
            Container(color: AppColors.background, child: widget.onColapsAppbar!.start),
          Expanded(
            child: Container(
              color: AppColors.background,
              child: AnimatedPadding(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                padding: EdgeInsets.only(top: _isAppBarVisible ? 0 : 0),
                child: _buildContent(),
              ),
            ),
          ),
        ],
      );
    }
    return _buildContent();
  }
}
