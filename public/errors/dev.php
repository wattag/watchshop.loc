<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Ошибка</title>
</head>
<body>
    <h1>Произошла ошибка</h1>
    <p><b>Код ошибки: </b> <?= $errorNum ?></p>
    <P><B>Текст ошибки:</B> <?= $errorStr ?></P>
    <P><B>Файл, в котором произошла ошибка: </B> <?= $errorFile ?></P>
    <P><B>Строка, в которой произошла ошибка: </B> <?= $errorLine ?></P>
</body>
</html>