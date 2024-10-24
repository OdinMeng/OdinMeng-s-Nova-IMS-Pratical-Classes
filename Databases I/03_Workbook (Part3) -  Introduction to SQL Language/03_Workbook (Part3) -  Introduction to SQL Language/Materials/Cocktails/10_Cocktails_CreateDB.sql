Create database Cocktails
go

Use Cocktails
go

-- 2.i. Create a new script and write the DDL statements to create a new database and the tables described above.
Create table Cocktails (CocktailName varchar(30) primary key,
						Price money)

Create table Ingredients (IngredientName varchar(30) primary key,
						  UnitCost money,
						  AlcoholPercentage float)

Create table Recipes (Cocktail varchar(30),
					  Ingredient varchar(30),
					  Units int,
					  primary key(Cocktail, Ingredient),
					  foreign key (Cocktail) references Cocktails(CocktailName),
					  foreign key (Ingredient) references Ingredients(IngredientName))