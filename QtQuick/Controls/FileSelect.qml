Embed {
  height: 21
  width: 200

  html: "<input type='file' />"
  id: me

  property var file

  // signal data();

  Component.onCompleted: {
    me.firstChild.addEventListener('change', handleFileSelect, false);
  }

  // http://www.html5rocks.com/en/tutorials/file/dndfiles/
  function handleFileSelect(evt) {
    var files = evt.target.files; // FileList object
    file = files[0];
    
    // ридеры в другом месте должны быть.. 
    // var reader = new FileReader();
  }

}