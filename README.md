
Item 
  title
  description
  Price
  Status(Available, Pending, Sold, Expired, Banned)
  Published_Date
  Category (Car, Cloth)
  
Seller 
  Name
  Latitude
  Longitude

Requirements

The API will generate:
    a list of all items
    a list of all sold items for a particular seller
    details of one item
    a list of available items for a particular category

Anonymous users, without logging in, can query the API these four ways, and retrieve JSON responses.
Note: The assignment does not require any styled views over the JSON responses. We just want to see the JSON.
A banned item should never have the following fields returned by the API:
Seller Name
Item Publishing Date
