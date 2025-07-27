<template>
  <div ref="container" :style="{ flexGrow: 1, overflowY: 'auto', minHeight: height + 'px', maxHeight: height + 'px' }">
    <slot />
  </div>
</template>

<script setup>
import { nextTick, onMounted, ref } from 'vue'

const container = ref(null)
const height = ref(0)

onMounted(async () => {
  await nextTick()
  if (container.value) {
    height.value = container.value.parentElement.offsetHeight
  }
})
</script>
