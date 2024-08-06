# Welcome to the recipe browse app

You can browse the categories use the category tab, or you can search the recipe directly if you know the receipe id.

By selecting a meal from a category, the app will take you to the recipe detail page with instructions and ingredients.

# Classes overview

## `MainView`

The entry point. It has two tabs, one is for browsing by categories and another for searching recipes.

### `CategoriView`

Displays different categories by fetching all categories using the themealdb API.

#### `MealListView`

Displays all meals under the category selected from `CategoryView`.

##### `ReceipeView`

Displays the recipe in a scrollable view lists out the detail information of the Receipe.

### `SearchView`

Displays a search text box for recipe Id and a search button. And it will direct the user to the `ReceipeView` flow.

## `DataService`

Responsible for handling fetching the themealdb API using `URLSession`, decoding the response from the API using `JSONDecoder` and returning the result asynchronously using Swift concurrency.

## Models

### `Category`

Represents the data model and view model for showing the categories. `CategoryResponse` is a wrapper around the model returned from the API, which is a list of `Category`.

### `Meal`

Represents the data model and view model for showing the meals. `MealResponse` is a wrapper around the API model, which is a list of `Meal`.

### `Receipe`

Represents the data model and view model for displaying the receipe. `ReceipeResponse` is a wrapper around the API mode, which is a list of `Receipe`.

## Futher considerations

- Better handling of the receipe data response. Because the way `Receipe` is structured in the API, it's a little tedious to handle edge cases like `nil`.
-
