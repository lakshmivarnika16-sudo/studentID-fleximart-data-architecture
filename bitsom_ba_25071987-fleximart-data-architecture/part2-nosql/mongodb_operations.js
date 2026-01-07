/****************************************************
 Task 2.2: MongoDB Implementation – FlexiMart
 Database: fleximart_nosql
 Collection: products
 //includes insert,find,update,and aggregation examples
****************************************************/

/*
----------------------------------------------------
Operation 1: Load Data
----------------------------------------------------
The products data was imported using MongoDB Compass
from the file `products_catalog.json` into the
`products` collection.
*/
 
// Data import completed via MongoDB Compass UI


/*
----------------------------------------------------
Operation 2: Basic Query
----------------------------------------------------
Business Requirement:
Find all products in "Electronics" category
with price less than 50000.
Return only: name, price, stock
*/

db.products.find(
  {
    category: "Electronics",
    price: { $lt: 50000 }
  },
  {
    _id: 0,
    name: 1,
    price: 1,
    stock: 1
  }
);


/*
----------------------------------------------------
Operation 3: Review Analysis
----------------------------------------------------
Business Requirement:
Find all products that have an average rating
greater than or equal to 4.0
*/

db.products.aggregate([
  {
    $addFields: {
      avg_rating: { $avg: "$reviews.rating" }
    }
  },
  {
    $match: {
      avg_rating: { $gte: 4.0 }
    }
  },
  {
    $project: {
      _id: 0,
      name: 1,
      category: 1,
      avg_rating: 1
    }
  }
]);


/*
----------------------------------------------------
Operation 4: Update Operation
----------------------------------------------------
Business Requirement:
Add a new review to product with product_id "ELEC001"
*/

db.products.updateOne(
  { product_id: "ELEC001" },
  {
    $push: {
      reviews: {
        user: "U999",
        rating: 4,
        comment: "Good value",
        date: new Date()
      }
    }
  }
);


/*
----------------------------------------------------
Operation 5: Complex Aggregation
----------------------------------------------------
Business Requirement:
Calculate average price by category
Return: category, avg_price, product_count
Sort by avg_price in descending order
*/

db.products.aggregate([
  {
    $group: {
      _id: "$category",
      avg_price: { $avg: "$price" },
      product_count: { $sum: 1 }
    }
  },
  {
    $project: {
      _id: 0,
      category: "$_id",
      avg_price: { $round: ["$avg_price", 2] },
      product_count: 1
    }
  },
  {
    $sort: { avg_price: -1 }
  }
]);

