part of '../screen/home_screen.dart';

class _SearchBar extends StatefulWidget {
  const _SearchBar({required this.state});

  final HomeState state;

  @override
  State<_SearchBar> createState() => __SearchBarState();
}

class __SearchBarState extends State<_SearchBar> {
  late final SearchController _controller;

  @override
  void initState() {
    _controller = SearchController();
    _controller.addListener(() {
      _search(_controller.text);
    });
    super.initState();
  }

  void _search(String query) {
    context.read<HomeBloc>().add(HomeOnSearchEvent(query));
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      child: SearchAnchor(
        searchController: _controller,
        builder: _builder,
        suggestionsBuilder: _suggestionsBuilder,
        viewOnSubmitted: (query) {
          _controller.closeView(query);
        },
      ),
    );
  }

  Widget _builder(BuildContext context, SearchController controller) {
    return SearchBar(
      controller: controller,
      onTap: () {
        controller.openView();
      },
      shape: const WidgetStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
      ),
      trailing: [
        if (_controller.text.isNotEmpty)
          IconButton(
            onPressed: () {
              _controller.text = '';
            },
            icon: const Icon(Icons.clear),
          )
        else
          const SizedBox.shrink(),
      ],
      hintText: context.t.home.search,
      leading: const Icon(Icons.search),
    );
  }

  FutureOr<Iterable<Widget>> _suggestionsBuilder(
    BuildContext context,
    SearchController controller,
  ) {
    final data = [
      ...widget.state.potData,
      ...widget.state.stemData,
      ...widget.state.accessoriesData,
    ];
    return List<ListTile>.generate(data.length, (int index) {
      final text = data[index].name;
      return ListTile(
        title: Text(text),
        onTap: () {
          controller.closeView(text);
        },
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
