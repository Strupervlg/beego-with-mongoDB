package controllers

import (
	"app/models"
	"fmt"
	beego "github.com/beego/beego/v2/server/web"
)

type MoviesController struct {
	beego.Controller
}

func (c *MoviesController) Get() {
	records := models.Find()
	c.Data["Items"] = records
	c.TplName = "movies/index.tpl"
}

func (c *MoviesController) Delete() {
	models.Delete(c.Ctx.Input.Param(":id"))
	c.Redirect("/", 302)
}

func (c *MoviesController) GetCreate() {
	c.TplName = "movies/create.tpl"
}

func (c *MoviesController) Create() {
	rating, err := c.GetFloat("rating")
	if err != nil {
		fmt.Println(err)
	}
	releasedYear, err := c.GetInt("releasedYear")
	if err != nil {
		fmt.Println(err)
	}
	movie := models.Movie{
		Title:        c.GetString("title"),
		Director:     c.GetString("director"),
		ReleasedYear: releasedYear,
		Rating:       rating,
		Genre:        c.GetStrings("genre[]"),
	}
	models.Create(movie)
	c.Redirect("/", 302)
}

func (c *MoviesController) GetUpdate() {
	movie := models.FindOne(c.Ctx.Input.Param(":id"))
	c.Data["Movie"] = movie
	c.TplName = "movies/update.tpl"
}

func (c *MoviesController) Update() {
	rating, err := c.GetFloat("rating")
	if err != nil {
		fmt.Println(err)
	}
	releasedYear, err := c.GetInt("releasedYear")
	if err != nil {
		fmt.Println(err)
	}
	movie := models.Movie{
		Title:        c.GetString("title"),
		Director:     c.GetString("director"),
		ReleasedYear: releasedYear,
		Rating:       rating,
		Genre:        c.GetStrings("genre[]"),
	}
	models.Update(c.Ctx.Input.Param(":id"), movie)
	c.Redirect("/", 302)
}

//Сделать обычный show

// Кол-во фильмов каждого жанра
func (c *MoviesController) MoviesGroupedByGenres() {
	records := models.GroupedByGenres()
	c.Data["Items"] = records
	c.TplName = "movies/genres.tpl"
}

// Кол-во фильмов каждого режиссера (можно вывести фильмы и кол-во их)
func (c *MoviesController) MoviesGroupedByDirector() {
	records := models.GroupedByDirector()
	c.Data["Items"] = records
	c.TplName = "movies/genres.tpl"
}

// Фильмы больше заданного рейтинга (сделать ползунок мин, макс)
// Кол-во фильмов после заданного года (сделать ползунок мин макс) (Можно вывести фильмы и их кол-во)
func (c *MoviesController) GetBetweenRating() {
	minRating, _ := c.GetFloat("min_rating")
	maxRating, _ := c.GetFloat("max_rating")
	minYear, _ := c.GetInt("min_year")
	maxYear, _ := c.GetInt("max_year")
	fmt.Println(c.GetInt("min_year"))
	records := models.GetBetweenRating(minRating, maxRating, minYear, maxYear)
	c.Data["Items"] = records
	c.Data["MinRating"] = minRating
	c.Data["MaxRating"] = maxRating
	c.Data["MinYear"] = minYear
	c.Data["MaxYear"] = maxYear
	c.TplName = "movies/index.tpl"
}
