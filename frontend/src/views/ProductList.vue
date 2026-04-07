<script setup>
import { ref, onMounted } from 'vue'
import DataTable from 'primevue/datatable'
import Column from 'primevue/column'
import Button from 'primevue/button'
import Tag from 'primevue/tag'

const products = ref([])
const loading = ref(true)

onMounted(async () => {
  try {
    const res = await fetch('/api/products')
    products.value = await res.json()
  } catch (e) {
    console.error('Failed to fetch products:', e)
  } finally {
    loading.value = false
  }
})

async function addToCart(product) {
  try {
    await fetch('/api/cart/items', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ product_id: product.id, quantity: 1 }),
    })
  } catch (e) {
    console.error('Failed to add to cart:', e)
  }
}
</script>

<template>
  <h1>Products</h1>

  <DataTable :value="products" :loading="loading" stripedRows tableStyle="min-width: 50rem">
    <Column field="product_name" header="Name" sortable />
    <Column field="product_type" header="Type" sortable>
      <template #body="{ data }">
        <Tag :value="data.product_type" />
      </template>
    </Column>
    <Column field="count" header="In Stock" sortable />
    <Column header="">
      <template #body="{ data }">
        <Button
          icon="pi pi-cart-plus"
          label="Add to Cart"
          size="small"
          :disabled="data.count === 0"
          @click="addToCart(data)"
        />
      </template>
    </Column>
  </DataTable>
</template>

<style scoped>
h1 {
  margin-bottom: 1.5rem;
}
</style>
