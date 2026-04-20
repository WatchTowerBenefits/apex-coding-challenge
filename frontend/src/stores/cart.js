import { defineStore } from 'pinia'
import { ref, computed } from 'vue'
import api from '../api'

export const useCartStore = defineStore('cart', () => {
  const cart = ref({ items: [] })

  const itemCount = computed(() => cart.value.items?.length ?? 0)

  async function fetchCart() {
    const { data } = await api.get('/api/cart')
    cart.value = data
  }

  function setCart(data) {
    cart.value = data
  }

  return { cart, itemCount, fetchCart, setCart }
})
