<script setup>
import Menubar from 'primevue/menubar'
import Badge from 'primevue/badge'
import { useRouter } from 'vue-router'
import { onMounted } from 'vue'
import { useCartStore } from '../stores/cart'

const router = useRouter()
const cartStore = useCartStore()

onMounted(() => {
  cartStore.fetchCart()
})

const items = [
  {
    label: 'Products',
    icon: 'pi pi-box',
    command: () => router.push('/'),
  },
  {
    label: 'Cart',
    icon: 'pi pi-shopping-cart',
    command: () => router.push('/cart'),
  },
]
</script>

<template>
  <Menubar :model="items">
    <template #start>
      <span class="brand">Threeflow Store</span>
    </template>
    <template #item="{ item, props }">
      <a v-bind="props.action" class="nav-item">
        <span :class="item.icon" />
        <span>{{ item.label }}</span>
        <Badge
          v-if="item.label === 'Cart' && cartStore.itemCount > 0"
          :value="cartStore.itemCount"
          class="cart-badge"
        />
      </a>
    </template>
  </Menubar>
</template>

<style scoped>
.brand {
  font-weight: 700;
  font-size: 1.25rem;
  margin-right: 2rem;
}

.nav-item {
  display: flex;
  align-items: center;
  gap: 0.5rem;
}

.cart-badge {
  margin-left: 0.25rem;
}
</style>
