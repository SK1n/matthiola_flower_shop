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
    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (previous, current) =>
          previous.filteredData != current.filteredData,
      builder: (context, state) {
        final data = context.watch<HomeBloc>().state.filteredData;
        return SearchAnchor(
          searchController: _controller,
          builder: _builder,
          suggestionsBuilder: (context, controller) {
            return List<ListTile>.generate(data.length, (int index) {
              final text = data[index].name;
              return ListTile(
                title: Text(text),
                onTap: () {
                  controller.closeView(text);
                },
              );
            });
          },
          viewOnSubmitted: (query) {
            _controller.closeView(query);
          },
          viewBuilder: (suggestions) {
            return ListView(
              shrinkWrap: true,
              children: state.filteredData
                  .map(
                    (element) => ListTile(
                      title: Text(element.name),
                      onTap: () {
                        _controller.closeView(element.name);
                      },
                    ),
                  )
                  .toList(),
            );
          },
        );
      },
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

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
