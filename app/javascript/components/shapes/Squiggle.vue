<script setup lang="ts">
import type {SetCard} from "@/types/set-types.ts";
import {useStripesPattern} from "@/composables/useStripesPattern.ts";

const {shade} = defineProps<{
  shade: SetCard['shade']
}>();

const {isStriped, patternId, fill, StripesPattern} = useStripesPattern(() => shade);
</script>
<template>
  <svg class="squiggle" viewBox="210 280 1610 800" xmlns="http://www.w3.org/2000/svg">
    <stripes-pattern v-if="isStriped" :pattern-id="patternId"/>
    <path transform="translate(1560,212)"
          d="m0 0 16 1 38 7 18 5 21 9 16 8 17 10 12 8 13 10 13 11 11 10 7 8 8 9 13 17 10 15 10 17 11 23 9 24 6 21 4 30 3 36v18l-2 35-3 27-3 19-7 30-12 39-11 31-13 29-19 38-14 24-11 18-11 16-12 17-9 12-13 16-9 11-12 14-16 17-15 14-10 9-14 11-18 13-19 11-19 10-24 10-34 12-36 11-41 10-27 5-30 2h-52l-44-3-37-4-43-7-47-8-86-17-64-14-49-9-22-3-14-1h-34l-19 2-25 6-37 12-27 11-27 12-40 19-42 21-28 13-26 11-24 8-47 13-12 2h-13l-26-4-28-7-18-6-25-12-21-14-14-11-10-9-12-11-9-9-7-8-10-11-10-13-12-18-13-24-8-21-5-18-4-20-3-30v-45l3-32 4-29 6-29 14-52 10-28 13-29 9-19 10-18 16-27 8-12 9-12 14-19 13-15 11-12 7-8 18-18 11-9 10-9 25-20 15-11 21-12 27-14 27-12 22-7 31-8 39-7 21-3 14-1h50l33 2 26 3 58 9 34 7 80 20 45 12 74 19 22 6 26 4 21 2h26l25-2 18-3 27-9 25-11 23-12 40-27 26-20 14-11 11-9 13-11 11-9 18-14 17-12 19-13 18-10 12-5 21-7 23-4 14-3z"
          :fill="fill"
          stroke="var(--shape-color)"
          stroke-width="calc(5 * var(--shape-border-width))"
    />
  </svg>
</template>

<style scoped>
.squiggle {
  display: block;
  flex: 0 0 auto;
  max-width: 50%;
  aspect-ratio: 161 / 100;
}
</style>