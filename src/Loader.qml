// http://doc.qt.io/qt-5/qml-qtquick-loader.html

// TODO think on sizing behaviour. For now, size of item is set to loader sizes once, on load. Maybe it is good to create binding from loader sizes.

Item {
  id: loader
  
  property string source
  property bool   active: true

  implicitWidth: loader.item ? loader.item.width : 0
  implicitHeight: {
    var v = loader.item ? loader.item.height : 0
    //console.log("loadr implicit h=",v,source, "and own height=",loader.height);
    return v;
  }

  signal loaded();

  onSourceChanged: {
    if (source) {
      if (active) {
        sourceComponent = Qt.createComponent( source, __executionContext )
      }
    }
    else
      sourceComponent = null;
  }

  onActiveChanged: {
    if (source) 
      sourceChanged(); 
    else 
      sourceComponentChanged();
  }
  
  property var sourceComponent

  property var item

  onSourceComponentChanged: {
    
    if (item) {
//        console.log("deleting item...");
        loader.item.$delete();
        //item.parent = undefined;
        delete loader.item;
        loader.item = undefined;
    }

    if (!sourceComponent || !active) {
      return;
    }
    
    var it = sourceComponent.createObject(loader);
    if (!it) {
      console.error("failed to create object for component source=",source );
      return;
    }

    // Alter objects context to the outer context
    it.$context = __executionContext;
    
    //if (meta.object.id)
    //    meta.context[meta.object.id] = item;

    // keep path in item for probale use it later in Qt.resolvedUrl 
    // ? it.$context["$basePath"] = engine.$basePath; //gut

    // Apply properties (Bindings won't get evaluated, yet)
    // applyProperties(meta.object, it, it, meta.context);
    // видимо сюда пойдут properties

            it.parent = loader;
            loader.childrenChanged();
            
            // TODO debug this. Without check to Init, Completed sometimes called twice.. But is this check correct?
            if (engine.operationState !== QMLOperationState.Init && engine.operationState !== QMLOperationState.Idle) {
                // We don't call those on first creation, as they will be called
                // by the regular creation-procedures at the right time.
                engine.$initializePropertyBindings();
                callOnCompleted(it);
            }
    //debugger;
//    console.log("setting item to loader",loader.source );
    loader.item = it;
   
    // see http://doc.qt.io/qt-5/qml-qtquick-loader.html Loader sizing behavior

    //  If an explicit size is not specified for the Loader, the Loader is automatically resized to the size of the loaded item once the component is loaded.
    //  If the size of the Loader is specified explicitly by setting the width, height or by anchoring, the loaded item will be resized to the size of the Loader.    
    
    console.log("loader loader.$isUsingImplicitWidth=",loader.$isUsingImplicitWidth, "loader.$isUsingImplicitHeight=",loader.$isUsingImplicitHeight,"width=",width,source );
    if (!loader.$isUsingImplicitWidth)
    {
      //console.log("setting loader.item.width = loader.width",loader.width);    
      loader.item.width = loader.width;
    }
    if (!loader.$isUsingImplicitHeight)
    {
      //console.log("setting loader.item.height = loader.height",loader.height);
      loader.item.height = loader.height;
    }    

    loaded();      
  }
  
    function callOnCompleted(child) {
        child.Component.completed();
        var arr = child.children.slice(0); // we need to clone array. because it may change during Component.OnCompleted evaluation, if some control will decide to change it's parent
        for (var i = 0; i < arr.length; i++)
            callOnCompleted(arr[i]);
    }
  

}