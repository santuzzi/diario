#!/usr/bin/env bash

rm -rf html
mkdir html
cp *css *js html
cat > html/index.html <<EOF
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Diario</title>
    <link rel="stylesheet" href="main.css">
    <script>const signature = '{}'</script>
</head>
<body style='margin-top: 120px'>
<div class='navbar fixed'>
   <div class='container'>
      <h4 class='pull-left'>I diari di Santuzzi</h4>
   </div>
</div>
<div class='container'>
<table class='table'>
EOF
n=0
for w in {00..52}; do
    if [[ $(($n % 12)) = 0 ]]; then
        echo "<tr>" >> html/index.html
    fi
    if [ -r diario-$w.yaml ]; then
        ./format $w
        echo "<td><a href='diario-$w.html'>$w</a></td>" >> html/index.html
    else
        echo "<td>&nbsp;</td>" >> html/index.html
    fi
    n=$((n + 1))
done
mv *.html html

cat >> html/index.html <<EOF
</table>
</div></body>
</html>
EOF
