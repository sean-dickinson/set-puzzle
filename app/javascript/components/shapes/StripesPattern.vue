<script setup lang="ts">
const { patternId } = defineProps<{
  patternId: string;
}>();

</script>

<template>
  <defs>
    <pattern :id="patternId" width="20" height="20" patternUnits="userSpaceOnUse" patternTransform="rotate(90)">
      <rect width="20" height="10" fill="var(--shape-color)" />
      <rect y="10" width="20" height="10" fill="transparent" />
    </pattern>
  </defs>
</template>