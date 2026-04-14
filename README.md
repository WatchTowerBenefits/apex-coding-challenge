# Threeflow Backend Engineer Interview Project
Welcome to the Threeflow Backend Engineer Interview Project! 
This project is designed to assess your skills in backend development, problem-solving, and system design. 
Below are the instructions and requirements for the project.

## Project Overview
We have a simple e-commerce application that allows users to browse products, add them to a cart, and place orders.
We are looking for 
- an MVC architecture for Product/Cart/Order management (the view layer, this case, is an API response)
- event publication and submission for key actions (e.g., product added to cart, order placed)
- simple policy management for user permissions (e.g., only admins can add products, carts are only accessible to their owners)

## Requirements
1. **MVC Architecture**: Implement the Model-View-Controller architecture for managing products, carts, and orders.
   - All public responses should be DTOs (Data Transfer Objects) that are serialized to JSON
   - Policies for POST/PUT/DELETE endpoints should be implemented using a policy management system (e.g., Pundit).
2. **Event Publication and Subscription**: Implement an event-driven architecture where key actions (e.g., product added to cart, order placed) publish events that can be subscribed to by other parts of the system.
3. **Notifications**: Implement a simple notification system that sends an email to the user when an order is placed (via an event subscription).


## Appendix
- [Rails Event Store](https://railseventstore.org/docs/core-concepts/pubsub) - A guide to using Rails' built-in event store for publishing and subscribing to events.
- [Pundit](https://github.com/varvet/pundit) - A Ruby gem for managing user permissions and policies in a clean and simple way.
