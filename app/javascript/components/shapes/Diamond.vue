<template>
<div class="diamond">
  <svg viewBox="0 0 300 100" xmlns="http://www.w3.org/2000/svg">
    <polygon points="150,0 300,50 150,100 0,50" fill="var(--shape-background)" stroke="var(--shape-color)" stroke-width="2"/>
  </svg>
</div>
</template>

<style scoped>
.diamond {
  height: 3rem;
  aspect-ratio: 3 / 1;

  & svg {
    width: 100%;
    height: 100%;
  }
}
</style>


