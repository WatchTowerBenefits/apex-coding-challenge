<template>
  <div class="under-construction">
    <img
      src="https://media2.giphy.com/media/v1.Y2lkPTc5MGI3NjExbHp2NWFvb3Y4dGJkMmZ2NWZhZW5scTBnbmE5emozemp5dW1pcGszNSZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/mCRJDo24UvJMA/giphy.gif"
      alt="Under construction"
      class="gif"
    />
    <p>This page is under construction.</p>
  </div>
</template>

<style scoped>
.under-construction {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  gap: 1.5rem;
  padding: 4rem 2rem;
  text-align: center;
}

.gif {
  max-width: 400px;
  border-radius: 8px;
}

p {
  font-size: 1.25rem;
  color: var(--p-text-muted-color);
}
</style>