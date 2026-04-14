import { createRouter, createWebHistory } from 'vue-router'
import ProductList from '../views/ProductList.vue'

const routes = [
  {
    path: '/',
    name: 'products',
    component: ProductList,
  },
  {
    path: '/cart',
    name: 'cart',
    component: () => import('../views/Cart.vue'),
  },
]

const router = createRouter({
  history: createWebHistory(),
  routes,
})

export default router
