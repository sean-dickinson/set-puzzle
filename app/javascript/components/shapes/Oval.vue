<script setup lang="ts">
import type {SetCard} from "@/types/set-types.ts";
import {useStripesPattern} from "@/composables/useStripesPattern.ts";

const {shade} = defineProps<{
  shade: SetCard['shade']
}>();

const {isStriped, patternId, fill, StripesPattern} = useStripesPattern(() => shade);
</script>
<template>
  <svg class="oval" viewBox="0 0 200 100" xmlns="http://www.w3.org/2000/svg">
    <stripes-pattern v-if="isStriped" :pattern-id="patternId" />
    <ellipse cx="100" cy="50" rx="96" ry="48"
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

