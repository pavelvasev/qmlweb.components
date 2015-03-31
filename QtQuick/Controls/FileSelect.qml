Embed {
  height: 21
  width: 200

  html: "<input type='file' " + (multiple ? "multiple" : "") + "/>"
  id: me

  property var file
  property var files
  property var multiple: false

  // signal data();

  Component.onCompleted: {
    me.firstChild.addEventListener('change', handleFileSelect, false);
  }

  // http://www.html5rocks.com/en/tutorials/file/dndfiles/
  function handleFileSelect(evt) {
    var htmlFiles = evt.target.files; // FileList object
    file = htmlFiles[0];
    files = htmlFiles;
    
    // ридеры в другом месте должны быть.. 
    // var reader = new FileReader();
  }

}