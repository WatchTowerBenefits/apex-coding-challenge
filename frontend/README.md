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

The frontend dev server will start on `http://localhost:5173` and proxy API requests to the Rails backend automatically.

> **Shortcut:** If you have [foreman](https://github.com/ddollar/foreman) installed (`gem install foreman`), you can run both servers at once from the root directory with:
> ```bash
> foreman start -f Procfile.dev
> ```

## The App

The app currently has two pages:

- **Products** (`/`) — displays a list of products in a table
- **Cart** (`/cart`) — displays the current cart and a button to place an order

---

## Your Tasks

### 1. Product List View Toggle

The product list currently renders in a table. We'd like to give users the option to switch between a **table view** and a **card view**.

**Requirements:**

- Add a toggle button to the top-right of the Products page that switches between the two views
- **Table view** should behave exactly as it does today
- **Card view** should display each product as a card, including the product name, type, stock count, and an "Add to Cart" button
- Each view should be implemented as its own component (`ProductsTable.vue` and `ProductsCards.vue`), and `ProductList.vue` should compose them
- Use PrimeVue components where appropriate
- The selected view should be **persisted** so that navigating away and back does not reset it

### 2. Add to Cart Feedback

When a user clicks "Add to Cart", the app currently makes the API call silently. We'd like to give users feedback.

**Requirements:**

- On a **successful** add, display a PrimeVue `Toast` notification that reads: `"[Product Name] successfully added to cart"`
- The toast should be non-blocking and dismiss on its own

---

## Notes

- All new code should be written in **Vue 3 Composition API** (`<script setup>`)
- Use **PrimeVue** components wherever it makes sense — avoid custom styling where a PrimeVue component already covers the use case
- We're looking for clean, readable component structure and good judgment about where state should live
