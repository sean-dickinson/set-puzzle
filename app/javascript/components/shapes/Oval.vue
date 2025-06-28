<script setup lang="ts">
import type {SetCard} from "@/types/set-types.ts";
import {useShapeBackground} from "@/composables/useShapeBackground.ts";

const {shade} = defineProps<{
  shade: SetCard['shade']
}>();

const {isStriped, patternId, fill, StripesPattern} = useShapeBackground(() => shade);
</script>
<template>
  <svg class="oval" viewBox="0 0 190 79.1667" xmlns="http://www.w3.org/2000/svg">
    <stripes-pattern v-if="isStriped" :pattern-id="patternId" />
    <ellipse cx="95" cy="39.5833" rx="85" ry="37.9167"
             :fill="fill"
             stroke="var(--shape-color)"
             stroke-width="var(--shape-border-width)"/>
  </svg>
</template>

<style scoped>
.oval {
  display: block;
  flex: 1 0 auto;
  max-width: 100%;
  aspect-ratio: 2 / 1;
  max-height: 3rem;
}
</style>

