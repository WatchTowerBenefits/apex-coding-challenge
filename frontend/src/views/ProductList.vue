<script setup>
import { ref, computed, onMounted } from 'vue'
import { useRoute, useRouter } from 'vue-router'
import axios from 'axios'
import { useToast } from 'primevue/usetoast'
import SelectButton from 'primevue/selectbutton'
import ProductsTable from '../components/ProductsTable.vue'
import ProductsCards from '../components/ProductsCards.vue'
import { useCartStore } from '../stores/cart'

const route = useRoute()
const router = useRouter()
const toast = useToast()
const cartStore = useCartStore()

const products = ref([])
const loading = ref(true)

const viewOptions = [
  { icon: 'pi pi-table', value: 'table' },
  { icon: 'pi pi-th-large', value: 'cards' },
]

const viewMode = computed({
  get: () => (route.query.view === 'cards' ? 'cards' : 'table'),
  set: (val) => router.replace({ query: { ...route.query, view: val } }),
})

onMounted(async () => {
  try {
    const { data } = await axios.get('/api/products')
    products.value = data
  } catch (e) {
    console.error('Failed to fetch products:', e)
  } finally {
    loading.value = false
  }
})

async function addToCart(product) {
  try {
    const { data } = await axios.post('/api/cart/items', {
      product_id: product.id,
      quantity: 1,
    })
    cartStore.setCart(data)
    toast.add({
      severity: 'success',
      summary: 'Added to Cart',
      detail: `${product.product_name} successfully added to cart`,
      life: 3000,
    })
  } catch (e) {
    console.error('Failed to add to cart:', e)
  }
}
</script>

<template>
  <div class="page-header">
    <h1>Products</h1>
    <SelectButton v-model="viewMode" :options="viewOptions" optionValue="value">
      <template #option="{ option }">
        <i :class="option.icon" />
      </template>
    </SelectButton>
  </div>

  <ProductsTable
    v-if="viewMode === 'table'"
    :products="products"
    :loading="loading"
    @add-to-cart="addToCart"
  />
  <ProductsCards
    v-else
    :products="products"
    :loading="loading"
    @add-to-cart="addToCart"
  />
</template>

<style scoped>
.page-header {
  display: flex;
  align-items: center;
  justify-content: space-between;
  margin-bottom: 1.5rem;
}
</style>
