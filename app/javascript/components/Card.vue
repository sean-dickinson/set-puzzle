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
<div class="card" :class="{'card--with-gap': shape !== 'squiggle'}">
  <template v-for="n in number" :key="n">
    <component :is="shapeComponent" :class="cssClasses" :shade="shade" />
  </template>
</div>
</template>

<style scoped>
.card {
  --card-bg-color: white;
  --card-border-color: #888;

  background-color: var(--card-bg-color);
  border: 2px solid var(--card-border-color);
  border-radius: 12px;
  padding: 1rem;
  width: 100%;
  max-width: 10rem;
  aspect-ratio: 2 / 3;

  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;

  transition: transform 0.2s ease;

  &.card--active {
    transform: scale(0.9);
    --card-border-color: red;
  }

  &.card--with-gap {
    gap: 0.75rem;
  }
}
</style>