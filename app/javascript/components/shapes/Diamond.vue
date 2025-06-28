<script setup lang="ts">
import type {SetCard} from "@/types/set-types";
import {useShapeBackground} from "@/composables/useShapeBackground.ts";

const {shade} = defineProps<{
  shade: SetCard['shade']
}>();

const {isStriped, patternId, fill, StripesPattern} = useShapeBackground(() => shade);

</script>
<template>
  <svg class="diamond" viewBox="0 0 300 125" xmlns="http://www.w3.org/2000/svg">
    <stripes-pattern v-if="isStriped" :pattern-id="patternId"/>
    <polygon points="150,0 300,62.5 150,125 0,62.5"
             :fill="fill"
             stroke="var(--shape-color)"
             stroke-width="var(--shape-border-width"/>
  </svg>
</template>

<style scoped>
.diamond {
  display: block;
  flex: 0 0 auto;
  max-width: 60%;
  aspect-ratio: 300 / 125;

}
</style>
