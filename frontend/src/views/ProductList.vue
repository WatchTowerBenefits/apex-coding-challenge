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
    const res = await fetch('http://localhost:3000/api/products')
    products.value = await res.json()
  } catch (e) {
    console.error('Failed to fetch products:', e)
  } finally {
    loading.value = false
  }
})

function formatPrice(price) {
  return new Intl.NumberFormat('en-US', { style: 'currency', currency: 'USD' }).format(price)
}
</script>

<template>
  <h1>Products</h1>

  <DataTable :value="products" :loading="loading" stripedRows tableStyle="min-width: 50rem">
    <Column header="Image">
      <template #body="{ data }">
        <img :src="data.image_url" :alt="data.product_name" class="product-image" />
      </template>
    </Column>
    <Column field="product_name" header="Name" sortable />
    <Column field="product_type" header="Type" sortable>
      <template #body="{ data }">
        <Tag :value="data.product_type" />
      </template>
    </Column>
    <Column field="price" header="Price" sortable>
      <template #body="{ data }">
        {{ formatPrice(data.price) }}
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
        />
      </template>
    </Column>
  </DataTable>
</template>

<style scoped>
h1 {
  margin-bottom: 1.5rem;
}

.product-image {
  width: 80px;
  height: 54px;
  object-fit: cover;
  border-radius: 4px;
}
</style>
