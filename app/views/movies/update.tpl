<html lang="ru">
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
    <title>update movie</title>
</head>
<body>
<h1>Обновление фильма {{.Movie.Title}}</h1>
<form method="post">
    <div>
        <div>
            <label for="title">Наименование</label>
            <input id="title" required type="text" name="title" value="{{.Movie.Title}}">
        </div>
        <div>
            <label for="director">Режисер</label>
            <input id="director" required type="text" name="director" value="{{.Movie.Director}}">
        </div>
        <div>
            <label for="date">Дата</label>
            <input id="date" required type="date" name="date" value="{{.Movie.Date}}">
        </div>
        <div>
            <label for="rating">Рейтинг</label>
            <input id="rating" required type="number" min="0" max="10" step="0.1" name="rating" value="{{.Movie.Rating}}">
        </div>
        <label>Жанры</label>
        <div id="genres">
            {{range $key, $val := .Movie.Genre}}
            <div>
                <input type="text" required name="genre[]" value="{{$val}}">
                {{if ne $key 0}}
                <button type="button" onclick="delGenre(this)">Удалить</button>
                {{end}}
            </div>
            {{end}}
        </div>
        <button type="button" onclick="addGenre()">Добавить</button>
    </div>
    <br>
    <br>
    <button type="submit">Обновить</button> <a href="/">Назад</a>
</form>
</body>
<script>
    function addGenre() {
        let node = document.createElement("div")
        node.innerHTML = `<input type="text" required name="genre[]">
            <button type="button" onclick="delGenre(this)">Удалить</button>`
        document.getElementById("genres").appendChild(node)
    }
    function delGenre(el) {
        el.parentElement.remove()
    }
</script>
</html>