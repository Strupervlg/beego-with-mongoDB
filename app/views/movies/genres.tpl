<html lang="ru">
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
    <title>movies</title>
</head>
<body>
<h1>Список фильмов</h1>
{{range .Items}}
<h2 class="movies" style="cursor: pointer" data-id="{{._id}}">{{._id}} ({{.count}})</h2>
<ul id="{{._id}}" style="display: none">
{{range .movies}}
<li>{{.}}</li>
{{end}}
</ul>
{{end}}
<script>
    const lists = document.querySelectorAll(".movies");
    for (let item of lists) {
        item.addEventListener("click", function() {
            if(document.getElementById(this.dataset.id).style.display == "block") {
                document.getElementById(this.dataset.id).style.display = "none";
            } else {
                document.getElementById(this.dataset.id).style.display = "block";
            }
        });
    }
</script>
</body>
</html>