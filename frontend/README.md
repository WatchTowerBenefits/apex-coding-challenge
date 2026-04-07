# ThreeFlow Front-End Engineer Interview Project

Welcome to the ThreeFlow Front-End Engineer Interview Project!

This project is designed to assess your skills in front-end development, component architecture, and problem-solving. You'll be working with a small e-commerce application that allows users to browse products, add them to a cart, and place orders.

## Tech Stack

- **Vue 3** (Composition API, `<script setup>`)
- **Vue Router**
- **Pinia** (state management)
- **PrimeVue 4** (component library)
- **Vite**

## Getting Started

### Prerequisites

- Ruby 3.3.3 (we recommend [rbenv](https://github.com/rbenv/rbenv) to manage Ruby versions)
- Node.js + npm

### 1. Start the Rails backend

From the **root** of the repository:

```bash
bundle install
bin/rails db:migrate
bin/rails db:seed
bin/rails s
```

This starts the Rails API on `http://localhost:3000`. The seed step populates the database with sample products.

### 2. Start the Vue frontend

In a separate terminal, from the `frontend/` directory:

```bash
npm install
npm run dev
```

## The App

The app currently has two pages:

- **Products** (`/`) — displays a list of products in a table
- **Cart** (`/cart`) — currently empty

---

## Your Tasks

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

> Use **Axios** for all API calls in this task (it is already installed).

### 3. Add to Cart Feedback

When a user clicks "Add to Cart", the app currently makes the API call silently. We'd like to give users feedback.

**Requirements:**

- On a **successful** add, display a PrimeVue `Toast` notification that reads: `"[Product Name] successfully added to cart"`
- The toast should be non-blocking and dismiss on its own

---

## Notes

- All new code should be written in **Vue 3 Composition API** (`<script setup>`)
- Use **PrimeVue** components wherever it makes sense — avoid custom styling where a PrimeVue component already covers the use case
- We're looking for clean, readable component structure and good judgment about where state should live
