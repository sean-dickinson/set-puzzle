<script setup lang="ts">
import type { ShapeProps } from "@/types/set-types";
import {computed} from "vue";
const { color, shading } = defineProps<ShapeProps>();

const cssClasses = computed(() => {
  return {
    'diamond--filled': shading === 'solid',
    'diamond--striped': shading === 'striped',
    'diamond--open': shading === 'open',
    [`diamond--${color}`]: true,
  };
});
</script>

<template>
<div class="diamond" :class="cssClasses"></div>
</template>

<style scoped>
.diamond {
  border-radius: 50%;
  border: 2px solid var(--card-color);
  aspect-ratio: 3 / 1;
  height: 3rem;

  &.diamond--filled {
    background-color: var(--card-color);
  }

  &.diamond--striped {
    background: repeating-linear-gradient(
      45deg,
      var(--card-color),
      var(--card-color) 10px,
      transparent 10px,
      transparent 20px
    );
  }
  &.diamond--open {
    background-color: transparent;
  }

  &.diamond--red {
    --card-color: #e86565;
  }

  &.diamond--green {
    --card-color: #28aa28;
  }

  &.diamond--purple {
    --card-color: #671fc3;
  }
}
</style>

