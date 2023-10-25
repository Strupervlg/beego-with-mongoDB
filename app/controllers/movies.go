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
	movie := models.Movie{
		Title:    c.GetString("title"),
		Director: c.GetString("director"),
		Date:     c.GetString("date"),
		Rating:   rating,
		Genre:    c.GetStrings("genre[]"),
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
	movie := models.Movie{
		Title:    c.GetString("title"),
		Director: c.GetString("director"),
		Date:     c.GetString("date"),
		Rating:   rating,
		Genre:    c.GetStrings("genre[]"),
	}
	models.Update(c.Ctx.Input.Param(":id"), movie)
	c.Redirect("/", 302)
}
