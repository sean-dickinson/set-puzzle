<script setup lang="ts">
import type {ShapeProps} from "@/types/set-types";
import {computed} from "vue";
const { color, shading } = defineProps<ShapeProps>();

const cssClasses = computed(() => {
  return {
    'squiggle--filled': shading === 'solid',
    'squiggle--striped': shading === 'striped',
    'squiggle--open': shading === 'open',
    [`squiggle--${color}`]: true,
  };
});
</script>

<template>
<div class="squiggle" :class="cssClasses"></div>
</template>

<style scoped>
.squiggle {
  border-radius: 50%;
  border: 2px solid var(--card-color);
  aspect-ratio: 3 / 1;
  height: 3rem;

  &.squiggle--filled {
    background-color: var(--card-color);
  }

  &.squiggle--striped {
    background: repeating-linear-gradient(
      45deg,
      var(--card-color),
      var(--card-color) 10px,
      transparent 10px,
      transparent 20px
    );
  }
  &.squiggle--open {
    background-color: transparent;
  }

  &.squiggle--red {
    --card-color: #e86565;
  }

  &.squiggle--green {
    --card-color: #28aa28;
  }

  &.squiggle--purple {
    --card-color: #671fc3;
  }
}
</style>