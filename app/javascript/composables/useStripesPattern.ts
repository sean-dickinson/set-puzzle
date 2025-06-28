import {computed, type MaybeRefOrGetter, toValue, useId} from "vue";
import type {SetCard} from "@/types/set-types.ts";
import StripesPattern from "@/components/shapes/StripesPattern.vue";
export function useStripesPattern(shade: MaybeRefOrGetter<SetCard['shade']>) {

    const isStriped = computed(() => toValue(shade) === 'striped');

    const id = useId();
    const patternId = computed(() => `striped-pattern-${id}`);
    const fill = computed(() =>
        isStriped.value ? `url(#${patternId.value})` : 'var(--shape-color)'
    );

    return {
        isStriped,
        patternId,
        fill,
        StripesPattern,
    }
}