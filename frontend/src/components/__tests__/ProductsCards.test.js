import { describe, it, expect } from 'vitest'
import { mount } from '@vue/test-utils'
import PrimeVue from 'primevue/config'
import ProductsCards from '../ProductsCards.vue'

const mockProducts = [
  { id: 1, product_name: 'Mechanical Keyboard', product_type: 'Electronics', price: 129.99, count: 50, image_url: 'https://picsum.photos/seed/keyboard/300/200' },
  { id: 2, product_name: 'Wireless Mouse', product_type: 'Electronics', price: 49.99, count: 0, image_url: 'https://picsum.photos/seed/mouse/300/200' },
]

function mountComponent(products = mockProducts) {
  return mount(ProductsCards, {
    props: { products, loading: false },
    global: { plugins: [PrimeVue] },
  })
}

describe('ProductsCards', () => {
  it('renders a card for each product', () => {
    const wrapper = mountComponent()
    const cards = wrapper.findAll('.product-card')
    expect(cards).toHaveLength(mockProducts.length)
  })

  it('displays the product name and formatted price', () => {
    const wrapper = mountComponent()
    const text = wrapper.text()
    expect(text).toContain('Mechanical Keyboard')
    expect(text).toContain('$129.99')
  })

  it('disables the Add to Cart button for out-of-stock products', () => {
    const wrapper = mountComponent()
    const buttons = wrapper.findAll('button')
    // First product (count: 50) — enabled; second (count: 0) — disabled
    expect(buttons[0].attributes('disabled')).toBeUndefined()
    expect(buttons[1].attributes('disabled')).toBeDefined()
  })

  it('emits add-to-cart with the correct product when button is clicked', async () => {
    const wrapper = mountComponent()
    const buttons = wrapper.findAll('button')
    await buttons[0].trigger('click')
    expect(wrapper.emitted('add-to-cart')).toBeTruthy()
    expect(wrapper.emitted('add-to-cart')[0][0]).toMatchObject({ id: 1, product_name: 'Mechanical Keyboard' })
  })
})
