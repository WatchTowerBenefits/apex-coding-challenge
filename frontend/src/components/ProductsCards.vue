<script setup>
import Card from 'primevue/card'
import Button from 'primevue/button'
import Tag from 'primevue/tag'

defineProps({
  products: Array,
  loading: Boolean,
})

const emit = defineEmits(['add-to-cart'])

function formatPrice(price) {
  return new Intl.NumberFormat('en-US', { style: 'currency', currency: 'USD' }).format(price)
}
</script>

<template>
  <div class="cards-grid">
    <Card v-for="product in products" :key="product.id" class="product-card">
      <template #header>
        <img :src="product.image_url" :alt="product.product_name" class="card-image" />
      </template>
      <template #title>{{ product.product_name }}</template>
      <template #subtitle>
        <Tag :value="product.product_type" />
      </template>
      <template #content>
        <div class="card-details">
          <span class="price">{{ formatPrice(product.price) }}</span>
          <span class="stock" :class="{ 'out-of-stock': product.count === 0 }">
            {{ product.count > 0 ? `${product.count} in stock` : 'Out of stock' }}
          </span>
        </div>
      </template>
      <template #footer>
        <Button
          icon="pi pi-cart-plus"
          label="Add to Cart"
          :disabled="product.count === 0"
          fluid
          @click="emit('add-to-cart', product)"
        />
      </template>
    </Card>
  </div>
</template>

<style scoped>
.cards-grid {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(260px, 1fr));
  gap: 1.5rem;
}

.card-image {
  width: 100%;
  height: 160px;
  object-fit: cover;
}

.card-details {
  display: flex;
  flex-direction: column;
  gap: 0.5rem;
}

.price {
  font-size: 1.25rem;
  font-weight: 600;
}

.out-of-stock {
  color: var(--p-red-500);
}
</style>
