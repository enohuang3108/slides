<template>
  <div ref="container" :style="{ height: 'inherit' }">
    <slot />
  </div>
</template>

<style scoped>
:deep(html) {
  overflow-y: auto;
}
</style>
