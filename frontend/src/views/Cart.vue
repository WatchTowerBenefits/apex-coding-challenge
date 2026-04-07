<script setup>
import { ref, onMounted } from 'vue'
import DataTable from 'primevue/datatable'
import Column from 'primevue/column'
import Button from 'primevue/button'

const cart = ref({ items: [] })
const loading = ref(true)

onMounted(async () => {
  try {
    const res = await fetch('/api/cart')
    cart.value = await res.json()
  } catch (e) {
    console.error('Failed to fetch cart:', e)
  } finally {
    loading.value = false
  }
})

async function placeOrder() {
  try {
    await fetch('/api/orders', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
    })
  } catch (e) {
    console.error('Failed to place order:', e)
  }
}
</script>

<template>
  <h1>Cart</h1>

  <DataTable :value="cart.items" :loading="loading" stripedRows tableStyle="min-width: 50rem">
    <Column field="product_name" header="Product" />
    <Column field="quantity" header="Quantity" />
  </DataTable>

  <div class="actions">
    <Button
      label="Place Order"
      icon="pi pi-check"
      :disabled="!cart.items.length"
      @click="placeOrder"
    />
  </div>
</template>

<style scoped>
h1 {
  margin-bottom: 1.5rem;
}

.actions {
  margin-top: 1.5rem;
  display: flex;
  justify-content: flex-end;
}
</style>
