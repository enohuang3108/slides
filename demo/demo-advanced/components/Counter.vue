<script setup lang="ts">
import { ref } from 'vue'

const props = defineProps<{
  count: number
}>()

const counter = ref(props.count)
</script>

<template>
  <div flex="~" w="min" border="~ gray-400 rounded-md">
    <button
      border="r gray-400"
      p="2"
      font="mono"
      outline="!none"
      hover:bg="gray-400 opacity-10"
      @click="counter -= 1"
    >
      -
    </button>
    <span font="mono" p="2" w="50px" text="center">{{ counter }}</span>
    <button
      border="l gray-400"
      p="2"
      font="mono"
      outline="!none"
      hover:bg="gray-400 opacity-10"
      @click="counter += 1"
    >
      +
    </button>
  </div>
</template>