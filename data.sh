#!/bin/bash
yum update -y
yum install -y httpd.x86_64
systemctl start httpd.service
systemctl enable httpd.service
echo "<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>JS service</title>
    <link rel="stylesheet" type="text/css" href="index.css"/>
</head>
<body>
    Hello Guys!
</body>
</html>" > /var/www/html/index.html



echo "body {
    background-color: black;
    color: white
}" > /var/www/html/index.css

