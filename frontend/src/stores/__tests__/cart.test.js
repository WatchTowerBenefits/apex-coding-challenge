import { describe, it, expect, beforeEach } from 'vitest'
import { setActivePinia, createPinia } from 'pinia'
import { useCartStore } from '../cart'

describe('useCartStore', () => {
  beforeEach(() => {
    setActivePinia(createPinia())
  })

  it('itemCount is 0 when the cart has no items', () => {
    const store = useCartStore()
    expect(store.itemCount).toBe(0)
  })

  it('setCart updates the cart state and itemCount reflects the new item count', () => {
    const store = useCartStore()

    store.setCart({
      id: 1,
      items: [
        { id: 1, product_id: 1, product_name: 'Mechanical Keyboard', quantity: 1, price: 129.99 },
        { id: 2, product_id: 2, product_name: 'Wireless Mouse', quantity: 1, price: 49.99 },
      ],
    })

    expect(store.cart.items).toHaveLength(2)
    expect(store.itemCount).toBe(2)
  })

  it('setCart replaces previous cart state', () => {
    const store = useCartStore()

    store.setCart({
      id: 1,
      items: [{ id: 1, product_id: 1, product_name: 'Mechanical Keyboard', quantity: 1, price: 129.99 }],
    })
    expect(store.itemCount).toBe(1)

    store.setCart({ id: 1, items: [] })
    expect(store.itemCount).toBe(0)
  })
})
