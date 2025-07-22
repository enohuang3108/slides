<script setup lang="ts">
import { ref, computed } from 'vue'
import { useToggle, useMouse } from '@vueuse/core'

const isDark = ref(false)
const toggleDark = useToggle(isDark)

const { x, y } = useMouse()

const computedPosition = computed(() => {
  return `X: ${x.value}, Y: ${y.value}`
})
</script>

<template>
  <div class="demo-container" :class="{ dark: isDark }">
    <h3>進階互動示範</h3>
    
    <div class="controls">
      <button @click="toggleDark()" class="toggle-btn">
        {{ isDark ? '☀️ 明亮模式' : '🌙 暗黑模式' }}
      </button>
    </div>

    <div class="mouse-tracker">
      <p>滑鼠位置: {{ computedPosition }}</p>
    </div>

    <div class="theme-demo">
      <p>這是一個展示 Vue 組件和響應式資料的示例</p>
      <div class="color-box"></div>
    </div>
  </div>
</template>

<style scoped>
.demo-container {
  padding: 20px;
  border-radius: 8px;
  background: #f5f5f5;
  color: #333;
  transition: all 0.3s ease;
  max-width: 500px;
}

.demo-container.dark {
  background: #2d2d2d;
  color: #fff;
}

.toggle-btn {
  padding: 8px 16px;
  border: none;
  border-radius: 4px;
  background: #007acc;
  color: white;
  cursor: pointer;
  transition: background 0.2s ease;
}

.toggle-btn:hover {
  background: #005a9e;
}

.mouse-tracker {
  margin: 15px 0;
  padding: 10px;
  background: rgba(0, 122, 204, 0.1);
  border-radius: 4px;
  font-family: 'Courier New', monospace;
}

.color-box {
  width: 100px;
  height: 50px;
  background: linear-gradient(45deg, #007acc, #00d4aa);
  border-radius: 4px;
  margin-top: 10px;
}

.demo-container.dark .color-box {
  background: linear-gradient(45deg, #ff6b6b, #4ecdc4);
}
</style>