<script setup lang="ts">
import  type {SetCard} from "@/types/set-types";
import Oval from "@/components/shapes/Oval.vue";
import Diamond from "@/components/shapes/Diamond.vue";
import Squiggle from "@/components/shapes/Squiggle.vue";
import {computed, markRaw} from "vue";

const { number, shade, shape, color } = defineProps<SetCard>();
const shapeComponents = {
  oval: Oval,
  diamond: Diamond,
  squiggle: Squiggle,
};

const shapeComponent = computed(() => {
  return markRaw(shapeComponents[shape]);
});

const cssClasses = computed(() => [
  `shade shade--${shade}`,
  `color color--${color}`,
]);
</script>

<template>
<div class="card">
  <template v-for="n in number" :key="n">
    <component :is="shapeComponent" class="shape" :class="cssClasses" :shade="shade" />
  </template>
</div>
</template>

<style scoped>
.card {
  --card-bg-color: white;
  --card-border-color: #888;
  container-type: size;
  background-color: var(--card-bg-color);
  border: 2px solid var(--card-border-color);
  border-radius: 12px;

  height: min(calc(100cqh / 4 - 1rem), calc(100cqw / 3 - 1rem));
  aspect-ratio: 3 / 4;
  place-self: center;

  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  gap: 0.4rem;
  box-shadow: 0 4px 6px -1px rgb(0 0 0 / 0.1), 0 2px 4px -2px rgb(0 0 0 / 0.1);

  transition: transform 0.2s ease;

  &.card--active {
    transform: scale(0.9);
    --card-border-color: red;
  }
}
</style>