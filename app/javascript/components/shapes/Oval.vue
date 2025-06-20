<script setup lang="ts">
import type {ShapeProps} from "@/types/set-types";
import {computed} from "vue";
const { color, shading } = defineProps<ShapeProps>();

const cssClasses = computed(() => {
  return {
    'oval--filled': shading === 'solid',
    'oval--striped': shading === 'striped',
    'oval--open': shading === 'open',
    [`oval--${color}`]: true,
  };
});
</script>

<template>
<div class="oval" :class="cssClasses"></div>
</template>

<style scoped>
.oval {
  border-radius: 50%;
  border: 2px solid var(--card-color);
  aspect-ratio: 3 / 1;
  height: 3rem;

  &.oval--filled {
    background-color: var(--card-color);
  }

  &.oval--striped {
    background: repeating-linear-gradient(
      45deg,
      var(--card-color),
      var(--card-color) 10px,
      transparent 10px,
      transparent 20px
    );
  }
  &.oval--open {
    background-color: transparent;
  }

  &.oval--red {
    --card-color: #e86565;
  }

  &.oval--green {
    --card-color: #28aa28;
  }

  &.oval--purple {
    --card-color: #671fc3;
  }
}
</style>