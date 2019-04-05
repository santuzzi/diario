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
    <link rel="stylesheet" href="style.css">
    <script>const signature = '{}'</script>
    <script src="main.js"></script>
</head>
<body>
<ul>
EOF
for w in {00..52}; do
    if [ -r diario-$w.yaml ]; then
        ./format $w
        echo "<li><a href='diario-$w.html'>$w</a></li>" >> html/index.html
    fi
done
mv *.html html

cat >> html/index.html <<EOF
</ul>
</body>
</html>
EOF
