Here’s a rewritten backend README in the same level of specificity as the front-end one, while keeping the backend goals aligned with the project brief.

***

# Threeflow Backend Engineer Interview Project

Welcome to the Threeflow Backend Engineer Interview Project!

This project is designed to assess your skills in backend development, API design, system architecture, and problem-solving. You’ll be working on the backend for a small e-commerce application that allows users to browse products, manage a cart, and place orders.

## Tech Stack

- Ruby 3.3.3
- Rails API
- SQLite3
- Pundit for authorization
- Rails Event Store for event publication/subscription
- Action Mailer for notifications

## Getting Started

### Prerequisites

- Ruby 3.3.3
- Bundler
- SQLite3

### 1. Install dependencies

From the root of the repository:

```bash
bundle install
```

### 2. Set up the database

Run the migrations and seed

```bash
bin/rails db:migrate
bin/rails db:seed
```

### 3. Start the Rails API

```bash
bin/rails s
```

The API will be available at:

```bash
http://localhost:3000
```

## Docker instructions
Alternatively, you can run the backend using Docker:

```bash
docker build -t threeflow-interview-stack .
docker run -p 3000:3000 -e SECRET_KEY_BASE=$(bin/rails secret) threeflow-interview-stack
````

## The App

This backend powers a simple e-commerce application with the following core domain concepts:

- Products
- Cart
- Cart items
- Orders
- Users and permissions

The frontend expects the API to support browsing products, adding items to a cart, and placing orders.

## Your Tasks

### 1. Implement MVC Architecture

Build out the backend using a clean MVC structure for managing products, carts, and orders.

#### Requirements

- Use controllers, models, and serializers/DTOs to keep responsibilities separated.
- All public API responses should be DTOs serialized to JSON.
- Product, cart, and order flows should be handled through clear controller actions and domain models.
- Keep the API response shape stable and predictable for the frontend.

#### Suggested endpoints

You may implement the API in a way that fits your architecture, but it should support the application flows below:

- `GET /api/products` — list products
- `GET /api/products/:id` — fetch a single product
- `GET /api/cart` — fetch the current cart
- `POST /api/cart/items` — add an item to the cart
- `POST /api/orders` — place an order

### 2. Add Authorization Policies

Implement policy management for protected actions.

#### Requirements

- Use a policy system such as Pundit.
- Only admins can create, update, or delete products.
- Carts should only be accessible by their owners.
- Orders should only be creatable by authorized users.
- Apply policies consistently to all POST, PUT/PATCH, and DELETE endpoints.

### 3. Add Event Publication and Subscription

Implement an event-driven flow for important business actions.

#### Requirements

- Publish events when key actions happen, such as:
   - product added to cart
   - order placed
- Make events available for subscription by other parts of the application.
- Use a clean event naming convention and keep event payloads useful but minimal.
- Event handlers should stay separate from controller logic where possible.

### 4. Add Order Notifications

Implement a simple notification flow when an order is placed.

#### Requirements

- When an order is successfully created, send an email notification to the user.
- Trigger the email through an event subscription rather than directly inside the controller.
- Keep the notification logic simple and easy to extend.

## API Expectations

The frontend will expect JSON responses that are structured and consistent. For example:

### Cart response

```json
{
  "id": 1,
  "items": [
    {
      "id": 10,
      "product_id": 5,
      "product_name": "Sample Product",
      "quantity": 2,
      "price": 19.99,
      "image_url": "https://example.com/image.png"
    }
  ]
}
```

### Add to cart request

```json
{
  "product_id": 5,
  "quantity": 1
}
```

### Add to cart response

The response should use the same shape as `GET /api/cart`.

## Bonus — Unit Tests

If you have time, add test coverage for the backend.

### Requirements

Write tests for:

- API responses for products, cart, and orders
- authorization behavior for protected endpoints
- event publication when items are added to cart or orders are placed
- email notification delivery when an order is created

Use whichever test framework is already configured in the project.

## Notes

- Keep the code clean, readable, and well-organized.
- Prefer service objects or dedicated event handlers where they improve clarity.
- Use DTOs or serializers for all externally visible responses.
- Make sure authorization and event handling are not tightly coupled to controller actions.
- We’re looking for good judgment about where domain logic should live and how the backend pieces fit together.

## Appendix

- [Rails Event Store](https://railseventstore.org/docs/core-concepts/pubsub) — guide to publishing and subscribing to events in Rails.
- [Pundit](https://github.com/varvet/pundit) — Ruby gem for authorization and policy management.
- [Action Mailer](https://guides.rubyonrails.org/action_mailer_basics.html) — Rails guide for sending email notifications.

If you want, I can also turn this into a polished final README with consistent Markdown formatting and wording that matches the front-end README style even more closely.

Sources
