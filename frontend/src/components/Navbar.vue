<script setup>
import Menubar from 'primevue/menubar'
import { useRouter } from 'vue-router'

const router = useRouter()

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
  </Menubar>
</template>

<style scoped>
.brand {
  font-weight: 700;
  font-size: 1.25rem;
  margin-right: 2rem;
}
</style>
