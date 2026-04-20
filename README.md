# ThreeFlow Full-Stack Engineer Interview Project

Welcome to the ThreeFlow Full-Stack Engineer Interview Project!

This project is designed to assess your skills in full-stack development, API design, component architecture, and problem-solving. You'll be working on a small e-commerce application that allows users to browse products, manage a cart, and place orders.

## To AI or not to AI?

**Please complete this project manually as much as possible.** If you get stuck and need to look something up on Google or ask an AI a quick clarifying question, that's okay — just do it visibly (e.g., share your screen) so we can follow along and assess your thought process. However, please do not use AI to solve entire features or portions of the project on your behalf.

## Tech Stack

### Backend
- Ruby 3.3.3
- Rails API
- SQLite3
- Pundit for authorization
- Rails Event Store for event publication/subscription
- Action Mailer for notifications

### Frontend
- Vue 3 (Composition API, `<script setup>`)
- Vue Router
- Pinia (state management)
- PrimeVue 4 (component library)
- Vite

## Getting Started

### Prerequisites

- [Docker](https://www.docker.com/products/docker-desktop/)

### Run the app

```bash
./run.sh
```

This builds and starts both the Rails API (port 3000) and the Vue frontend dev server (port 5173) using Docker Compose.

To stop the services:

```bash
docker compose down
```

## The App

This is a simple e-commerce application with the following core domain concepts:

- Products
- Cart
- Cart items
- Orders
- Users and permissions

The app currently has two pages:

- **Products** (`/`) — displays a list of products in a table
- **Cart** (`/cart`) — currently empty

---

## Backend Tasks

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
- `GET /api/cart` — fetch the current cart
- `POST /api/cart/items` — add an item to the cart


### 2. Add Authorization Policies

Implement policy management for protected actions.

#### Requirements

- Use a policy system such as Pundit.
- Carts should only be accessible by their owners.
- Apply policies consistently to all POST, PUT/PATCH, and DELETE endpoints.

### 3. Add Event Publication and Subscription

Implement an event-driven flow for important business actions.

#### Requirements

- Publish events when key actions happen, such as:
   - product added to cart
- Make events available for subscription by other parts of the application.
- Use a clean event naming convention and keep event payloads useful but minimal.
- Event handlers should stay separate from controller logic where possible.

---

## Frontend Tasks

### 1. Product List View Toggle

The product list currently renders in a table. We'd like to give users the option to switch between a **table view** and a **card view**.

**Requirements:**

- Add a toggle button to the top-right of the Products page that switches between the two views
- **Table view** should behave exactly as it does today
- **Card view** should display each product as a card, including the product image, name, type, price, stock count, and an "Add to Cart" button
- Use PrimeVue components where appropriate
- The selected view should be **persisted** so that refreshing the page does not reset it

### 2. Number of Items in Cart Badge

The Cart button in the navbar should display a badge counter showing the number of items currently in the cart.

**Requirements:**

- Create a Pinia store to hold the cart state
- On initial page load, fetch the current cart from `GET /api/cart` and store the result in the Pinia store
- When a user adds an item via the "Add to Cart" button, an API call to `POST /api/cart/items` should fire, the response updated in the store and the number in the badge counter should change to reflect the new number of cart items

**API reference:**

| Method | Endpoint | Body | Response |
|--------|----------|------|----------|
| `GET` | `/api/cart` | — | `{ id, items: [{ id, product_id, product_name, quantity, price, image_url }] }` |
| `POST` | `/api/cart/items` | `{ product_id, quantity }` | Same shape as `GET /api/cart` |

### 3. Add to Cart Feedback

When a user clicks "Add to Cart", the app currently makes the API call silently. We'd like to give users feedback.

**Requirements:**

- On a **successful** add, display a PrimeVue `Toast` notification that reads: `"[Product Name] successfully added to cart"`
- The toast should be non-blocking and dismiss on its own

---

## Appendix

- [Rails Event Store](https://railseventstore.org/docs/core-concepts/pubsub) — guide to publishing and subscribing to events in Rails.
- [Pundit](https://github.com/varvet/pundit) — Ruby gem for authorization and policy management.
- [Action Mailer](https://guides.rubyonrails.org/action_mailer_basics.html) — Rails guide for sending email notifications.
