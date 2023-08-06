<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
<div id="gitkitWidgetDiv"></div>
    
</body>
<script src="https://www.gstatic.com/authtoolkit/js/gitkit.js"></script>
<script>

  window.google.identitytoolkit.signInButton(
    '#gitkitWidgetDiv', // Container selector
    config // Configuration object
  );

</script>
</html>