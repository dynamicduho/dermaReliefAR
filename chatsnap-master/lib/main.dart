import 'package:chat_snap/ui/splash.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:chat_snap/provider/cam_controller.dart';
import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CamController>.value(
      value: CamController()..init(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Cam Page',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ArCoreController arCoreController;
  ArCoreNode node1 = ArCoreReferenceNode(
    name: 'Checkmark',
    object3DFileName: 'Checkmark.sfb',
    scale: vector.Vector3(0.1, 0.1, 0.1),
    position: vector.Vector3(0, -1, -1),
    rotation: vector.Vector4(0, 180, 0, 0),
  );

  ArCoreNode node2 = ArCoreNode(
      name: 'Sphere',
      shape: ArCoreSphere(
          materials: [ArCoreMaterial(color: Colors.red)], radius: 0.2),
      position: vector.Vector3(0, -1, -1));

  void dipsose() {
    super.dispose();
    arCoreController.dispose();
  }

  _onArCoreViewCreated(ArCoreController controller) {
    arCoreController = controller;
    _addNode(arCoreController, node1);
    _addNode(arCoreController, node2);
    //arCoreController.onPlaneDetected = _handleOnPlaneDetected;
  }

/*_handleOnPlaneDetected(ArCorePlane plane){
  if(node!=null){
    arCoreController.removeNode(nodeName: node.name);
  }
  _addToon(arCoreController, plane);
}*/

  _addNode(ArCoreController controller, ArCoreNode node) {
    controller.addArCoreNode(node);
  }

  removeNodes() {
    arCoreController.removeNode(nodeName: 'node1');
    arCoreController.removeNode(nodeName: 'node2');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => removeNodes,
        child: ArCoreView(
          onArCoreViewCreated: _onArCoreViewCreated,
          enableUpdateListener: true,
        ),
      ),
    );
  }
}
