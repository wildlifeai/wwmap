import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_maps/maps.dart';
import 'package:syncfusion_flutter_core/theme.dart';

/// Page displaying the map the relevant alerts
class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late MapShapeLayerController _controller;
  late MapShapeSource _mapSource;

  @override
  void initState() {
    _mapSource = const MapShapeSource.asset(
      'new_zealand_district.json',
      shapeDataField: 'NAME_1',
    );
    _controller = MapShapeLayerController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text('New Zealand alert map'),
        ),
        body: Center(
            child: SfMapsTheme(
          data: SfMapsThemeData(
            shapeHoverColor: Colors.red[800],
            shapeHoverStrokeColor: Colors.black,
            shapeHoverStrokeWidth: 0.5,
          ),
          child: SfMaps(
            layers: [
              MapShapeLayer(
                controller: _controller,
                showDataLabels: true,
                strokeColor: Colors.black87,
                markerBuilder: (BuildContext context, int index) {
                  return const MapMarker(
                    latitude: -39.3538,
                    longitude: 174.4383,
                  );
                },
                strokeWidth: 0.5,
                dataLabelSettings: MapDataLabelSettings(
                    textStyle: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: themeData.textTheme.caption!.fontSize)),
                source: _mapSource,
                markerTooltipBuilder: (BuildContext context, int index) {
                  return Container(
                    width: 180,
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Stack(
                          children: [
                            Center(
                              child: Text(
                                "Taranaki Detected",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: Theme.of(context)
                                        .textTheme
                                        .bodyText2!
                                        .fontSize),
                              ),
                            ),
                            const Icon(
                              Icons.tour,
                              color: Colors.white,
                              size: 16,
                            ),
                          ],
                        ),
                        const Divider(
                          color: Colors.white,
                          height: 10,
                          thickness: 1.2,
                        ),
                        Text(
                          "Predators: 8\nSnails: 19",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .fontSize),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        )),
        floatingActionButton: Stack(children: [
          Align(
              alignment: Alignment.bottomRight,
              child: FloatingActionButton(
                  onPressed: () {
                    _controller.insertMarker(0);
                  },
                  backgroundColor: Colors.green,
                  child: const Icon(Icons.radar))),
          Align(
            alignment: Alignment.bottomLeft,
            child: FloatingActionButton(
                onPressed: () {
                  _controller.clearMarkers();
                },
                backgroundColor: Colors.purpleAccent,
                child: const Icon(Icons.lock_reset)),
          )
        ]));
  }
}
