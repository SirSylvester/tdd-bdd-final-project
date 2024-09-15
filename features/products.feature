Feature: The product store service back-end
    As a Product Store Owner
    I need a RESTful catalog service
    So that I can keep track of all my products

Background:
    Given the following products
        | name       | description     | price   | available | category   |
        | Hat        | A red fedora    | 59.95   | True      | CLOTHS     |
        | Shoes      | Blue shoes      | 120.50  | False     | CLOTHS     |
        | Big Mac    | 1/4 lb burger   | 5.99    | True      | FOOD       |
        | Sheets     | Full bed sheets | 87.00   | True      | HOUSEWARES |

Scenario: The server is running
    When I visit the "Home Page"
    Then I should see "Product Catalog Administration" in the title
    And I should not see "404 Not Found"

Scenario: Create a Product
    When I visit the "Home Page"
    And I set the "Name" to "Hammer"
    And I set the "Description" to "Claw hammer"
    And I select "True" in the "Available" dropdown
    And I select "Tools" in the "Category" dropdown
    And I set the "Price" to "34.95"
    And I press the "Create" button
    Then I should see the message "Success"
    When I copy the "Id" field
    And I press the "Clear" button
    Then the "Id" field should be empty
    And the "Name" field should be empty
    And the "Description" field should be empty
    When I paste the "Id" field
    And I press the "Retrieve" button
    Then I should see the message "Success"
    And I should see "Hammer" in the "Name" field
    And I should see "Claw hammer" in the "Description" field
    And I should see "True" in the "Available" dropdown
    And I should see "Tools" in the "Category" dropdown
    And I should see "34.95" in the "Price" field
Scenario: Read a Product
    When I visit the "Home Page"
    And I set the "Name" to "Hat"
    And I press the "Search" button
    Then I should see the message "Success"
    When I copy the "Id" field
    And I press the "Clear" button
    And I paste the "Id" field
    And I press the "Retrieve" button
    Then I should see the message "Success"
    And I should see "Hat" in the "Name" field
    And I should see "A red fedora" in the "Description" field
    And I should see "True" in the "Available" dropdown
    And I should see "Cloths" in the "Category" dropdown
    And I should see "59.95" in the "Price" field
Scenario: Update a Product
    When I visit the "Home Page"
    And I create a product with name "Shoes" and description "Running shoes"
    And I press the "Update" button
    Then I should see the message "Product updated successfully"
    And I should see "Shoes" in the "Name" field
    And I should see "Running shoes" in the "Description" field
Scenario: Delete a Product
    When I visit the "Home Page"
    And I create a product with name "Jacket"
    And I press the "Delete" button
    Then I should see the message "Product deleted successfully"
Scenario: List all Products
    When I visit the "Home Page"
    And I press the "List All" button
    Then I should see all the products in the product list
Scenario: Search Products by Category
    When I visit the "Home Page"
    And I select "Cloths" from the "Category" dropdown
    And I press the "Search" button
    Then I should see all products from the "Cloths" category
Scenario: Search Products by Availability
    When I visit the "Home Page"
    And I select "True" from the "Available" dropdown
    And I press the "Search" button
    Then I should see all available products
Scenario: Search Products by Name
    When I visit the "Home Page"
    And I set the "Name" to "Shoes"
    And I press the "Search" button
    Then I should see all products with the name "Shoes"
