USE [Cocktails]
GO
INSERT [dbo].[Cocktails] ([CocktailName], [Price]) VALUES (N'Margarita', 10.0000)
INSERT [dbo].[Cocktails] ([CocktailName], [Price]) VALUES (N'Mimosa', 8.0000)
GO
INSERT [dbo].[Ingredients] ([IngredientName], [UnitCost], [AlcoholPercentage]) VALUES (N'Ice', 1.0000, 0)
INSERT [dbo].[Ingredients] ([IngredientName], [UnitCost], [AlcoholPercentage]) VALUES (N'Lime', 2.0000, 0)
INSERT [dbo].[Ingredients] ([IngredientName], [UnitCost], [AlcoholPercentage]) VALUES (N'Orange juice', 2.0000, 0)
INSERT [dbo].[Ingredients] ([IngredientName], [UnitCost], [AlcoholPercentage]) VALUES (N'Rum', 15.0000, 40)
INSERT [dbo].[Ingredients] ([IngredientName], [UnitCost], [AlcoholPercentage]) VALUES (N'Salt', 1.0000, 0)
INSERT [dbo].[Ingredients] ([IngredientName], [UnitCost], [AlcoholPercentage]) VALUES (N'Sparkling wine', 15.0000, 11)
INSERT [dbo].[Ingredients] ([IngredientName], [UnitCost], [AlcoholPercentage]) VALUES (N'Sugar', 1.0000, 0)
INSERT [dbo].[Ingredients] ([IngredientName], [UnitCost], [AlcoholPercentage]) VALUES (N'Tequila', 18.0000, 40)
INSERT [dbo].[Ingredients] ([IngredientName], [UnitCost], [AlcoholPercentage]) VALUES (N'Triple sec', 8.0000, 25)
INSERT [dbo].[Ingredients] ([IngredientName], [UnitCost], [AlcoholPercentage]) VALUES (N'Vodka', 13.0000, 40)
GO
INSERT [dbo].[Recipes] ([Cocktail], [Ingredient], [Units]) VALUES (N'Margarita', N'Ice', 1)
INSERT [dbo].[Recipes] ([Cocktail], [Ingredient], [Units]) VALUES (N'Margarita', N'Lime', 2)
INSERT [dbo].[Recipes] ([Cocktail], [Ingredient], [Units]) VALUES (N'Margarita', N'Salt', 1)
INSERT [dbo].[Recipes] ([Cocktail], [Ingredient], [Units]) VALUES (N'Margarita', N'Sugar', 1)
INSERT [dbo].[Recipes] ([Cocktail], [Ingredient], [Units]) VALUES (N'Margarita', N'Tequila', 1)
INSERT [dbo].[Recipes] ([Cocktail], [Ingredient], [Units]) VALUES (N'Margarita', N'Triple sec', 1)
INSERT [dbo].[Recipes] ([Cocktail], [Ingredient], [Units]) VALUES (N'Mimosa', N'Orange juice', 1)
INSERT [dbo].[Recipes] ([Cocktail], [Ingredient], [Units]) VALUES (N'Mimosa', N'Sparkling wine', 1)
INSERT [dbo].[Recipes] ([Cocktail], [Ingredient], [Units]) VALUES (N'Mimosa', N'Triple sec', 1)
GO
