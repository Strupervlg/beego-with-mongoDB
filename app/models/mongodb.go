package models

import (
	"context"
	"fmt"
	"go.mongodb.org/mongo-driver/bson"
	"go.mongodb.org/mongo-driver/bson/primitive"
	"go.mongodb.org/mongo-driver/mongo"
	"go.mongodb.org/mongo-driver/mongo/options"
)

var DB *mongo.Collection

type Movie struct {
	Title    string   `bson:"title"`
	Director string   `bson:"director"`
	Date     string   `bson:"date"`
	Rating   float64  `bson:"rating"`
	Genre    []string `bson:"genre"`
}

func InitDB() error {
	clientOptions := options.Client().ApplyURI("mongodb://localhost:27017")
	client, err := mongo.Connect(context.Background(), clientOptions)
	if err != nil {
		return err
	}

	DB = client.Database("cinema").Collection("movies")
	return nil
}

func Create(movie Movie) *mongo.InsertOneResult {
	insertResult, err := DB.InsertOne(context.Background(), movie)
	if err != nil {
		fmt.Println(err)
	}
	return insertResult
}

func Update(id string, movie Movie) *mongo.UpdateResult {
	objectId, err := primitive.ObjectIDFromHex(id)
	if err != nil {
		fmt.Println(err)
	}
	filter := bson.M{"_id": objectId}
	update := bson.M{
		"$set": bson.M{
			"title":    movie.Title,
			"director": movie.Director,
			"date":     movie.Date,
			"rating":   movie.Rating,
			"genre":    movie.Genre,
		},
	}
	updateResult, err := DB.UpdateOne(context.Background(), filter, update)
	if err != nil {
		fmt.Println(err)
	}
	return updateResult
}

func Delete(id string) *mongo.DeleteResult {
	objectId, err := primitive.ObjectIDFromHex(id)
	if err != nil {
		fmt.Println(err)
	}
	filter := bson.M{"_id": objectId}
	deleteResult, err := DB.DeleteOne(context.Background(), filter)
	if err != nil {
		fmt.Println(err)
	}
	return deleteResult
}

func FindOne(id string) Movie {
	objectId, err := primitive.ObjectIDFromHex(id)
	if err != nil {
		fmt.Println(err)
	}
	filter := bson.M{"_id": objectId}
	result := DB.FindOne(context.Background(), filter)

	var movie Movie
	err = result.Decode(&movie)
	if err != nil {
		fmt.Println(err)
	}
	return movie
}

func Find() []bson.M {
	// Опции для поиска, можете настроить по своим требованиям
	options := options.Find()

	// Создаем пустой срез для хранения результатов
	var records []bson.M

	// Выполняем запрос
	cur, err := DB.Find(context.Background(), bson.M{}, options)
	if err != nil {
		fmt.Println(err)
		// Обработка ошибки
	}
	defer cur.Close(context.Background())

	// Итерируем по результатам и добавляем их в срез records
	for cur.Next(context.Background()) {
		var record bson.M
		err := cur.Decode(&record)
		record["_id"] = record["_id"].(primitive.ObjectID).Hex()
		if err != nil {
			fmt.Println(err)
			// Обработка ошибки
		}
		records = append(records, record)
	}
	return records
}
