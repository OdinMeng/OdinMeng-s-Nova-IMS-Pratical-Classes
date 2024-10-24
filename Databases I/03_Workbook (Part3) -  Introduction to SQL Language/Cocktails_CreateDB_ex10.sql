CREATE DATABASE Cocktails;
GO

USE Cocktails;
GO

CREATE TABLE COCKTAILS(
	CocktailName VARCHAR(30) PRIMARY KEY,
	Price VARCHAR(6)
);

CREATE TABLE INGREDIENTS(
	IngredientName VARCHAR(30) PRIMARY KEY,
	UnitCost VARCHAR(6),
	AlcoholPercentage VARCHAR(5)
);

CREATE TABLE RECIPES(
	Cocktail VARCHAR(30), 
	Ingredient VARCHAR(30),
	CONSTRAINT recs
		PRIMARY KEY (Cocktail, Ingredient)
);

GO